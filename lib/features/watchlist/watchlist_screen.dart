import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/movie_model.dart';
import '../../core/services/tmdb_service.dart';
import '../movie_details/movie_detail_screen.dart';
import 'watchlist_provider.dart';

/// İzleme listesi ekranı
/// Bu ekran, izleme listesi yönetimi için kullanılır
class WatchlistScreen extends ConsumerWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watchlistState = ref.watch(watchlistProvider);
    final watchlistNotifier = ref.read(watchlistProvider.notifier);
    
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('İzleme Listesi - Aşama 3'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'İzlenmeyenler'),
              Tab(text: 'İzlenenler'),
            ],
          ),
          actions: [
            if (watchlistState.movies.isNotEmpty)
              IconButton(
                icon: const Icon(Icons.clear_all),
                onPressed: () {
                  _showClearDialog(context, watchlistNotifier);
                },
              ),
          ],
        ),
        body: Column(
          children: [
            // Açıklama kartı
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.purple[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.purple[200]!),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Aşama 3: İzleme Listesi Yönetimi',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Bu ekran StateNotifier kullanarak izleme listesini yönetir. '
                    'Filmleri izleme listesine ekleyebilir, izlendi olarak işaretleyebilirsiniz.',
                  ),
                ],
              ),
            ),
            
            // Tab bar içeriği
            Expanded(
              child: TabBarView(
                children: [
                  _buildMovieList(context, ref, watchlistNotifier.unwatchedMovies),
                  _buildMovieList(context, ref, watchlistNotifier.watchedMovies),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildMovieList(BuildContext context, WidgetRef ref, List<Movie> movies) {
    if (movies.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.list, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'Henüz film eklenmemiş',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      );
    }
    
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return _buildWatchlistMovieCard(context, ref, movie);
      },
    );
  }
  
  Widget _buildWatchlistMovieCard(BuildContext context, WidgetRef ref, Movie movie) {
    final watchlistNotifier = ref.read(watchlistProvider.notifier);
    
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(
            width: 60,
            height: 90,
            child: Image.network(
              TmdbService.getPosterUrl(movie.posterPath),
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 60,
                  height: 90,
                  color: Colors.grey[300],
                  child: const Icon(Icons.movie, size: 30),
                );
              },
            ),
          ),
        ),
        title: Text(
          movie.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              movie.overview,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.star, size: 16, color: Colors.amber[700]),
                const SizedBox(width: 4),
                Text(
                  movie.voteAverage.toStringAsFixed(1),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // İzleme durumu butonu
            IconButton(
              onPressed: () {
                if (movie.isWatched) {
                  watchlistNotifier.markAsUnwatched(movie.id);
                } else {
                  watchlistNotifier.markAsWatched(movie.id);
                }
              },
              icon: Icon(
                movie.isWatched ? Icons.check_circle : Icons.play_circle,
                color: movie.isWatched ? Colors.green : Colors.blue,
              ),
            ),
            // Listeden çıkar butonu
            IconButton(
              onPressed: () {
                watchlistNotifier.removeFromWatchlist(movie.id);
              },
              icon: const Icon(Icons.remove_circle, color: Colors.red),
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetailScreen(movieId: movie.id),
            ),
          );
        },
      ),
    );
  }
  
  void _showClearDialog(BuildContext context, WatchlistNotifier notifier) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('İzleme Listesini Temizle'),
        content: const Text('Tüm filmleri izleme listesinden çıkarmak istediğinizden emin misiniz?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('İptal'),
          ),
          TextButton(
            onPressed: () {
              notifier.clearWatchlist();
              Navigator.pop(context);
            },
            child: const Text('Temizle'),
          ),
        ],
      ),
    );
  }
}

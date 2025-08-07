import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/movie_model.dart';
import '../../core/services/tmdb_service.dart';
import '../watchlist/watchlist_provider.dart';
import '../movie_favorites/favorites_provider.dart';
import 'movie_detail_provider.dart';

/// Film detay sayfası
/// Bu sayfa, FutureProvider kullanarak film detaylarını gösterir
class MovieDetailScreen extends ConsumerWidget {
  final int movieId;
  
  const MovieDetailScreen({
    super.key,
    required this.movieId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // FutureProvider ile film detaylarını al
    final movieAsync = ref.watch(movieDetailProvider(movieId));
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Film Detayları - Aşama 3'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          // Favori durumunu kontrol et
          Consumer(
            builder: (context, ref, child) {
              final isFavorite = ref.watch(favoriteMoviesProvider).contains(movieId);
              final operations = ref.read(favoriteOperationsProvider);
              
              return IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : null,
                ),
                onPressed: () {
                  if (isFavorite) {
                    operations.removeFromFavorites(movieId);
                  } else {
                    operations.addToFavorites(movieId);
                  }
                },
              );
            },
          ),
        ],
      ),
      body: movieAsync.when(
        data: (movie) => _buildMovieDetail(context, ref, movie),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => _buildErrorWidget(context, ref, error),
      ),
    );
  }
  
  Widget _buildMovieDetail(BuildContext context, WidgetRef ref, Movie movie) {
    // İzleme listesi durumunu kontrol et
    final isInWatchlist = ref.watch(watchlistProvider.notifier).isInWatchlist(movie.id);
    final isWatched = ref.watch(watchlistProvider.notifier).isWatched(movie.id);
    final watchlistNotifier = ref.read(watchlistProvider.notifier);
    
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Film posteri ve temel bilgiler
          Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.8),
                  Colors.transparent,
                ],
              ),
            ),
            child: Stack(
              children: [
                // Arka plan resmi
                Positioned.fill(
                  child: Image.network(
                    TmdbService.getPosterUrl(movie.posterPath, size: 'w500'),
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: const Icon(Icons.movie, size: 100),
                      );
                    },
                  ),
                ),
                
                // Gradient overlay
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                ),
                
                // Film bilgileri
                Positioned(
                  bottom: 16,
                  left: 16,
                  right: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber[700],
                            size: 20,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${movie.voteAverage.toStringAsFixed(1)} (${movie.voteCount} oy)',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Açıklama kartı
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.orange[50],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.orange[200]!),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Aşama 3: FutureProvider ile Async State',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Bu sayfa FutureProvider kullanarak film detaylarını yükler. '
                        'AsyncValue ile loading, error ve data durumları handle edilir.',
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Film açıklaması
                Text(
                  'Özet',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  movie.overview,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                
                const SizedBox(height: 24),
                
                // Film bilgileri
                                 _buildInfoRow('Çıkış Tarihi', '${movie.releaseDate?.day ?? '?'}/${movie.releaseDate?.month ?? '?'}/${movie.releaseDate?.year ?? '?'}'),
                _buildInfoRow('Puan', '${movie.voteAverage}/10'),
                _buildInfoRow('Oy Sayısı', '${movie.voteCount}'),
                
                const SizedBox(height: 24),
                
                // İzleme listesi butonları
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          if (isInWatchlist) {
                            watchlistNotifier.removeFromWatchlist(movie.id);
                          } else {
                            watchlistNotifier.addToWatchlist(movie);
                          }
                        },
                        icon: Icon(
                          isInWatchlist ? Icons.remove : Icons.add,
                        ),
                        label: Text(
                          isInWatchlist ? 'Listeden Çıkar' : 'İzleme Listesine Ekle',
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: isInWatchlist
                            ? () {
                                if (isWatched) {
                                  watchlistNotifier.markAsUnwatched(movie.id);
                                } else {
                                  watchlistNotifier.markAsWatched(movie.id);
                                }
                              }
                            : null,
                        icon: Icon(
                          isWatched ? Icons.check_circle : Icons.play_circle,
                        ),
                        label: Text(
                          isWatched ? 'İzlendi' : 'İzle',
                        ),
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 16),
                
                // İzleme durumu
                if (isInWatchlist)
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isWatched ? Colors.green[50] : Colors.blue[50],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: isWatched ? Colors.green[200]! : Colors.blue[200]!,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          isWatched ? Icons.check_circle : Icons.schedule,
                          color: isWatched ? Colors.green : Colors.blue,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          isWatched ? 'Bu filmi izlediniz' : 'İzleme listenizde',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: isWatched ? Colors.green[700] : Colors.blue[700],
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          Text(value),
        ],
      ),
    );
  }
  
  Widget _buildErrorWidget(BuildContext context, WidgetRef ref, Object error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'Film detayları yüklenirken hata oluştu',
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              error.toString(),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.red,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ref.invalidate(movieDetailProvider(movieId));
              },
              child: const Text('Tekrar Dene'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/movie_model.dart';
import '../../core/services/tmdb_service.dart';
import '../movie_favorites/favorites_provider.dart';
import '../watchlist/watchlist_provider.dart';

/// Gelişmiş film kartı widget'ı
/// Bu widget, Movie modelini kullanır ve favori durumunu dinler
class MovieCard extends ConsumerWidget {
  final Movie movie;
  final VoidCallback? onTap;
  
  const MovieCard({
    super.key,
    required this.movie,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Favori durumunu dinle
    final isFavorite = ref.watch(favoriteMoviesProvider).contains(movie.id);
    
    // Favori işlemleri için provider'ı oku
    final operations = ref.read(favoriteOperationsProvider);
    
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Film posteri
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  width: 80,
                  height: 120,
                  child: Image.network(
                    TmdbService.getPosterUrl(movie.posterPath),
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 80,
                        height: 120,
                        color: Colors.grey[300],
                        child: const Icon(Icons.movie, size: 40),
                      );
                    },
                  ),
                ),
              ),
              
              const SizedBox(width: 16),
              
              // Film bilgileri
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    
                    const SizedBox(height: 8),
                    
                    Text(
                      movie.overview,
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    
                    const SizedBox(height: 8),
                    
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 16,
                          color: Colors.amber[700],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          movie.voteAverage.toStringAsFixed(1),
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '(${movie.voteCount})',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 4),
                    
                    Text(
                                             'Çıkış: ${movie.releaseDate?.year ?? 'Bilinmiyor'}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              
                          // Butonlar
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Favori butonu
                IconButton(
                  onPressed: () {
                    if (isFavorite) {
                      operations.removeFromFavorites(movie.id);
                    } else {
                      operations.addToFavorites(movie.id);
                    }
                  },
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.grey,
                  ),
                ),
                // İzleme listesi butonu
                Consumer(
                  builder: (context, ref, child) {
                    final isInWatchlist = ref.watch(watchlistProvider.notifier).isInWatchlist(movie.id);
                    final watchlistNotifier = ref.read(watchlistProvider.notifier);
                    
                    return IconButton(
                      onPressed: () {
                        if (isInWatchlist) {
                          watchlistNotifier.removeFromWatchlist(movie.id);
                        } else {
                          watchlistNotifier.addToWatchlist(movie);
                        }
                      },
                      icon: Icon(
                        isInWatchlist ? Icons.bookmark : Icons.bookmark_border,
                        color: isInWatchlist ? Colors.blue : Colors.grey,
                      ),
                    );
                  },
                ),
              ],
            ),
            ],
          ),
        ),
      ),
    );
  }
}

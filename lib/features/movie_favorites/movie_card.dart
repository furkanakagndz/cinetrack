import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'favorites_provider.dart';

/// Film kartı widget'ı
/// Bu widget, ConsumerWidget kullanarak favori durumunu dinler
class MovieCard extends ConsumerWidget {
  final int movieId;
  final String title;
  final String overview;
  final String? posterPath;
  final double rating;
  
  const MovieCard({
    super.key,
    required this.movieId,
    required this.title,
    required this.overview,
    this.posterPath,
    required this.rating,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Favori durumunu dinle
    final isFavorite = ref.watch(favoriteMoviesProvider).contains(movieId);
    
    // Favori işlemleri için provider'ı oku
    final operations = ref.read(favoriteOperationsProvider);
    
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Film posteri
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 80,
                height: 120,
                color: Colors.grey[300],
                child: posterPath != null
                    ? Image.network(
                        'https://image.tmdb.org/t/p/w200$posterPath',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.movie, size: 40);
                        },
                      )
                    : const Icon(Icons.movie, size: 40),
              ),
            ),
            
            const SizedBox(width: 16),
            
            // Film bilgileri
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  const SizedBox(height: 8),
                  
                  Text(
                    overview,
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
                        rating.toStringAsFixed(1),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            // Favori butonu
            IconButton(
              onPressed: () {
                if (isFavorite) {
                  operations.removeFromFavorites(movieId);
                } else {
                  operations.addToFavorites(movieId);
                }
              },
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


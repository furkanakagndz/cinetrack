import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'favorites_provider.dart';
import 'movie_card.dart';

/// Favori filmler ekranı
/// Bu ekran, favori filmleri listeler ve favori işlemlerini gösterir
class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Favori film sayısını dinle
    final favoriteCount = ref.watch(favoriteMoviesProvider).length;
    
    // Favori işlemleri için provider'ı oku
    final operations = ref.read(favoriteOperationsProvider);
    
    // Örnek film verileri
    final sampleMovies = [
      {
        'id': 1,
        'title': 'Inception',
        'overview': 'Rüya içinde rüya konseptini işleyen bilim kurgu filmi.',
        'posterPath': '/9gk7adHYeDvHkCSEqAvQNLV5Uge.jpg',
        'rating': 8.8,
      },
      {
        'id': 2,
        'title': 'The Dark Knight',
        'overview': 'Batman\'in Joker ile mücadelesini anlatan süper kahraman filmi.',
        'posterPath': '/qJ2tW6WMUDux911r6m7haRef0WH.jpg',
        'rating': 9.0,
      },
      {
        'id': 3,
        'title': 'Interstellar',
        'overview': 'Uzay yolculuğu ve zaman paradokslarını konu alan film.',
        'posterPath': '/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg',
        'rating': 8.6,
      },
    ];
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favori Filmler - Aşama 1'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          // Favori sayısını göster
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text(
                '$favoriteCount favori',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
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
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue[200]!),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Aşama 1: StateProvider ile Favori Sistemi',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Bu ekran StateProvider kullanarak favori film durumunu yönetir. '
                  'Her film kartı, favori durumunu dinler ve kullanıcı etkileşimine göre güncellenir.',
                ),
              ],
            ),
          ),
          
          // Film listesi
          Expanded(
            child: ListView.builder(
              itemCount: sampleMovies.length,
              itemBuilder: (context, index) {
                final movie = sampleMovies[index];
                return MovieCard(
                  movieId: movie['id'] as int,
                  title: movie['title'] as String,
                  overview: movie['overview'] as String,
                  posterPath: movie['posterPath'] as String,
                  rating: movie['rating'] as double,
                );
              },
            ),
          ),
          
          // Favori işlemleri butonları
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: favoriteCount > 0 ? operations.clearFavorites : null,
                  icon: const Icon(Icons.clear_all),
                  label: const Text('Tümünü Temizle'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Örnek olarak tüm filmleri favorilere ekle
                    for (final movie in sampleMovies) {
                      operations.addToFavorites(movie['id'] as int);
                    }
                  },
                  icon: const Icon(Icons.favorite),
                  label: const Text('Tümünü Favori Yap'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


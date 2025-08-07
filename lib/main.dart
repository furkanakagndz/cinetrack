import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'features/basic_counter/counter_screen.dart';
import 'features/movie_favorites/favorites_screen.dart';
import 'features/movies/movies_screen.dart';

void main() {
  runApp(
    // ProviderScope ile uygulamayı sar
    // Bu, tüm provider'ların çalışması için gerekli
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CineTrack - Riverpod Öğrenme',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

/// Ana ekran - Öğrenme aşamalarını gösterir
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CineTrack - Riverpod Öğrenme'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Başlık
              Text(
                'Riverpod Öğrenme Aşamaları',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              // Açıklama
              Container(
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
                      'Bu uygulama Riverpod\'u adım adım öğretir.',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Her aşama, bir önceki aşamanın üzerine inşa edilir ve '
                      'gerçek dünya senaryoları üzerinde çalışır.',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Aşama 1
              _buildStageCard(
                context,
                'Aşama 1: Temel Riverpod Kavramları',
                'StateProvider ve ConsumerWidget kullanımı',
                [
                  'Basit sayaç uygulaması',
                  'Film favori durumu',
                  'Provider dinleme ve güncelleme',
                ],
                Icons.numbers,
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CounterScreen(),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Aşama 1 - Favoriler
              _buildStageCard(
                context,
                'Aşama 1: Film Favori Sistemi',
                'StateProvider ile favori yönetimi',
                [
                  'Film kartları ve favori butonları',
                  'Favori durumu dinleme',
                  'Favori işlemleri',
                ],
                Icons.favorite,
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FavoritesScreen(),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Aşama 2 - Film Listesi
              _buildStageCard(
                context,
                'Aşama 2: Film Listesi',
                'StateNotifier ile karmaşık state yönetimi',
                [
                  'TMDB API entegrasyonu',
                  'Film arama ve filtreleme',
                  'Pagination ve infinite scroll',
                  'Loading/error durumları',
                ],
                Icons.movie,
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MoviesScreen()),
                ),
              ),

              const SizedBox(height: 16),

              // Gelecek aşamalar
              _buildStageCard(
                context,
                'Aşama 3: Film Detayları (Yakında)',
                'FutureProvider ve async state',
                [
                  'Film detay sayfası',
                  'FutureProvider kullanımı',
                  'AsyncValue ile state yönetimi',
                ],
                Icons.info,
                null, // Henüz aktif değil
                isEnabled: false,
              ),

              const SizedBox(height: 16),

              _buildStageCard(
                context,
                'Aşama 4: İzleme Listesi (Yakında)',
                'Local storage ve persistence',
                [
                  'İzleme listesi yönetimi',
                  'Local storage entegrasyonu',
                  'Persistence pattern',
                ],
                Icons.list,
                null, // Henüz aktif değil
                isEnabled: false,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStageCard(
    BuildContext context,
    String title,
    String subtitle,
    List<String> features,
    IconData icon,
    VoidCallback? onTap, {
    bool isEnabled = true,
  }) {
    return Card(
      child: InkWell(
        onTap: isEnabled ? onTap : null,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(
                icon,
                size: 32,
                color: isEnabled ? Colors.blue : Colors.grey,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: isEnabled ? null : Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: isEnabled ? Colors.grey[600] : Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ...features.map(
                      (feature) => Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: Row(
                          children: [
                            Icon(
                              Icons.check_circle,
                              size: 16,
                              color: isEnabled ? Colors.green : Colors.grey,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                feature,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: isEnabled ? null : Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (isEnabled)
                const Icon(Icons.arrow_forward_ios, size: 16)
              else
                const Icon(Icons.lock, size: 16, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}

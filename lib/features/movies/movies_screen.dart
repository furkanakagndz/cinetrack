import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/movie_model.dart';
import '../movie_details/movie_detail_screen.dart';
import 'movies_provider.dart';
import 'movie_card.dart';

/// Film listesi ekranı
/// Bu ekran, StateNotifier kullanarak film listesini yönetir
class MoviesScreen extends ConsumerStatefulWidget {
  const MoviesScreen({super.key});

  @override
  ConsumerState<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends ConsumerState<MoviesScreen> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  
  @override
  void initState() {
    super.initState();
    // İlk yüklemede popüler filmleri getir
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(moviesProvider.notifier).loadPopularMovies();
    });
    
    // Scroll listener ekle
    _scrollController.addListener(_onScroll);
  }
  
  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
  
  void _onScroll() {
    if (_scrollController.position.pixels >= 
        _scrollController.position.maxScrollExtent - 200) {
      // Sayfa sonuna yaklaştığında daha fazla film yükle
      final state = ref.read(moviesProvider);
      if (!state.isLoading && !state.hasReachedMax) {
        if (state.searchQuery.isEmpty) {
          ref.read(moviesProvider.notifier).loadPopularMovies();
        } else {
          ref.read(moviesProvider.notifier).loadMoreSearchResults();
        }
      }
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final moviesState = ref.watch(moviesProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filmler - Aşama 2'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(moviesProvider.notifier).loadPopularMovies(refresh: true);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Arama çubuğu
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Film ara...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          ref.read(moviesProvider.notifier).clearSearch();
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onSubmitted: (query) {
                ref.read(moviesProvider.notifier).searchMovies(query);
              },
            ),
          ),
          
          // Açıklama kartı
          if (moviesState.searchQuery.isEmpty)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.green[200]!),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Aşama 2: StateNotifier ile Karmaşık State',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Bu ekran StateNotifier kullanarak film listesini yönetir. '
                    'Loading, error ve pagination durumları handle edilir.',
                  ),
                ],
              ),
            ),
          
          const SizedBox(height: 16),
          
          // Film listesi
          Expanded(
            child: _buildMovieList(moviesState),
          ),
        ],
      ),
    );
  }
  
  Widget _buildMovieList(MoviesState state) {
    if (state.isLoading && state.movies.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
    
    if (state.error != null && state.movies.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'Hata: ${state.error}',
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ref.read(moviesProvider.notifier).clearError();
                ref.read(moviesProvider.notifier).loadPopularMovies(refresh: true);
              },
              child: const Text('Tekrar Dene'),
            ),
          ],
        ),
      );
    }
    
    if (state.movies.isEmpty) {
      return const Center(
        child: Text(
          'Film bulunamadı',
          style: TextStyle(fontSize: 16),
        ),
      );
    }
    
    return RefreshIndicator(
      onRefresh: () async {
        ref.read(moviesProvider.notifier).loadPopularMovies(refresh: true);
      },
      child: ListView.builder(
        controller: _scrollController,
        itemCount: state.movies.length + (state.isLoading ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == state.movies.length) {
            // Loading indicator
            return const Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: CircularProgressIndicator()),
            );
          }
          
          final movie = state.movies[index];
          return MovieCard(
            movie: movie,
            onTap: () {
              // Film detay sayfasına git
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetailScreen(movieId: movie.id),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

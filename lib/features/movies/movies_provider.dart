import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/movie_model.dart';
import '../../core/services/tmdb_service.dart';

/// Film listesi StateNotifier
/// Bu sınıf, karmaşık state yönetimi için StateNotifier kullanır
class MoviesNotifier extends StateNotifier<MoviesState> {
  final TmdbService _tmdbService;
  
  MoviesNotifier(this._tmdbService) : super(const MoviesState());
  
  /// Popüler filmleri yükle
  Future<void> loadPopularMovies({bool refresh = false}) async {
    if (refresh) {
      // Yenileme durumunda state'i sıfırla
      state = state.copyWith(
        isLoading: true,
        error: null,
        currentPage: 1,
        hasReachedMax: false,
      );
    } else if (state.isLoading || state.hasReachedMax) {
      // Zaten yükleniyorsa veya maksimuma ulaşıldıysa çık
      return;
    } else {
      // Yükleme durumunu güncelle
      state = state.copyWith(isLoading: true, error: null);
    }
    
    try {
      final movies = await _tmdbService.getPopularMovies(page: state.currentPage);
      
      if (movies.isEmpty) {
        // Daha fazla film yoksa maksimuma ulaştığını işaretle
        state = state.copyWith(
          isLoading: false,
          hasReachedMax: true,
        );
      } else {
        // Yeni filmleri mevcut listeye ekle
        final updatedMovies = refresh ? movies : [...state.movies, ...movies];
        
        state = state.copyWith(
          movies: updatedMovies,
          isLoading: false,
          currentPage: state.currentPage + 1,
        );
      }
    } catch (e) {
      // Hata durumunda state'i güncelle
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }
  
  /// Film arama
  Future<void> searchMovies(String query) async {
    if (query.trim().isEmpty) {
      // Boş arama durumunda popüler filmleri yükle
      await loadPopularMovies(refresh: true);
      return;
    }
    
    // Arama durumunu güncelle
    state = state.copyWith(
      searchQuery: query,
      isLoading: true,
      error: null,
      currentPage: 1,
      hasReachedMax: false,
    );
    
    try {
      final movies = await _tmdbService.searchMovies(query, page: 1);
      
      state = state.copyWith(
        movies: movies,
        isLoading: false,
        currentPage: 2,
        hasReachedMax: movies.isEmpty,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }
  
  /// Daha fazla arama sonucu yükle
  Future<void> loadMoreSearchResults() async {
    if (state.searchQuery.isEmpty || state.isLoading || state.hasReachedMax) {
      return;
    }
    
    state = state.copyWith(isLoading: true);
    
    try {
      final movies = await _tmdbService.searchMovies(
        state.searchQuery,
        page: state.currentPage,
      );
      
      if (movies.isEmpty) {
        state = state.copyWith(
          isLoading: false,
          hasReachedMax: true,
        );
      } else {
        state = state.copyWith(
          movies: [...state.movies, ...movies],
          isLoading: false,
          currentPage: state.currentPage + 1,
        );
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }
  
  /// Hata durumunu temizle
  void clearError() {
    state = state.copyWith(error: null);
  }
  
  /// Arama sorgusunu temizle
  void clearSearch() {
    state = state.copyWith(
      searchQuery: '',
      currentPage: 1,
      hasReachedMax: false,
    );
    loadPopularMovies(refresh: true);
  }
}

/// Film listesi provider'ı
final moviesProvider = StateNotifierProvider<MoviesNotifier, MoviesState>((ref) {
  final tmdbService = ref.watch(tmdbServiceProvider);
  return MoviesNotifier(tmdbService);
});

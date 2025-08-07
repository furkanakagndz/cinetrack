import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/movie_model.dart';
import '../../core/services/tmdb_service.dart';

/// Film detayları için FutureProvider
/// Bu provider, film ID'sine göre detay bilgilerini çeker
final movieDetailProvider = FutureProvider.family<Movie, int>((ref, movieId) async {
  final tmdbService = ref.watch(tmdbServiceProvider);
  return await tmdbService.getMovieDetails(movieId);
});

/// Film detayları için StateNotifier (alternatif yaklaşım)
/// Bu yaklaşım, daha karmaşık state yönetimi için kullanılır
class MovieDetailNotifier extends StateNotifier<MovieDetailState> {
  final TmdbService _tmdbService;
  
  MovieDetailNotifier(this._tmdbService) : super(const MovieDetailState());
  
  /// Film detaylarını yükle
  Future<void> loadMovieDetails(int movieId) async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      final movie = await _tmdbService.getMovieDetails(movieId);
      state = state.copyWith(movie: movie, isLoading: false);
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
  
  /// Detayları yenile
  Future<void> refresh(int movieId) async {
    await loadMovieDetails(movieId);
  }
}

/// Film detay StateNotifier provider'ı
final movieDetailNotifierProvider = StateNotifierProvider.family<MovieDetailNotifier, MovieDetailState, int>((ref, movieId) {
  final tmdbService = ref.watch(tmdbServiceProvider);
  return MovieDetailNotifier(tmdbService);
});

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/movie_model.dart';
import '../../core/services/tmdb_service.dart';

/// İzleme listesi durumu
class WatchlistState {
  final List<Movie> movies;
  final bool isLoading;
  final String? error;

  const WatchlistState({
    this.movies = const [],
    this.isLoading = false,
    this.error,
  });

  WatchlistState copyWith({
    List<Movie>? movies,
    bool? isLoading,
    String? error,
  }) {
    return WatchlistState(
      movies: movies ?? this.movies,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WatchlistState &&
        other.movies == movies &&
        other.isLoading == isLoading &&
        other.error == error;
  }

  @override
  int get hashCode {
    return Object.hash(movies, isLoading, error);
  }
}

/// İzleme listesi StateNotifier
/// Bu sınıf, izleme listesi yönetimi için kullanılır
class WatchlistNotifier extends StateNotifier<WatchlistState> {
  final TmdbService _tmdbService;
  
  WatchlistNotifier(this._tmdbService) : super(const WatchlistState());
  
  /// Filmi izleme listesine ekle
  Future<void> addToWatchlist(Movie movie) async {
    // Film zaten listede mi kontrol et
    if (state.movies.any((m) => m.id == movie.id)) {
      return;
    }
    
    // İzleme listesine ekle
    final updatedMovie = movie.copyWith(isWatched: false);
    state = state.copyWith(
      movies: [...state.movies, updatedMovie],
    );
    
    // TODO: Local storage'a kaydet
    await _saveToLocalStorage();
  }
  
  /// Filmi izleme listesinden çıkar
  Future<void> removeFromWatchlist(int movieId) async {
    state = state.copyWith(
      movies: state.movies.where((movie) => movie.id != movieId).toList(),
    );
    
    // TODO: Local storage'dan sil
    await _saveToLocalStorage();
  }
  
  /// Filmi izlendi olarak işaretle
  Future<void> markAsWatched(int movieId) async {
    final updatedMovies = state.movies.map((movie) {
      if (movie.id == movieId) {
        return movie.copyWith(isWatched: true);
      }
      return movie;
    }).toList();
    
    state = state.copyWith(movies: updatedMovies);
    
    // TODO: Local storage'a kaydet
    await _saveToLocalStorage();
  }
  
  /// Filmi izlenmedi olarak işaretle
  Future<void> markAsUnwatched(int movieId) async {
    final updatedMovies = state.movies.map((movie) {
      if (movie.id == movieId) {
        return movie.copyWith(isWatched: false);
      }
      return movie;
    }).toList();
    
    state = state.copyWith(movies: updatedMovies);
    
    // TODO: Local storage'a kaydet
    await _saveToLocalStorage();
  }
  
  /// Film izleme listesinde mi kontrol et
  bool isInWatchlist(int movieId) {
    return state.movies.any((movie) => movie.id == movieId);
  }
  
  /// Film izlendi mi kontrol et
  bool isWatched(int movieId) {
    final movie = state.movies.firstWhere(
      (movie) => movie.id == movieId,
      orElse: () => Movie(
        id: -1,
        title: '',
        overview: '',
        voteAverage: 0,
        voteCount: 0,
        releaseDate: null,
      ),
    );
    return movie.isWatched;
  }
  
  /// İzleme listesini temizle
  Future<void> clearWatchlist() async {
    state = const WatchlistState();
    await _saveToLocalStorage();
  }
  
  /// İzlenen filmleri getir
  List<Movie> get watchedMovies {
    return state.movies.where((movie) => movie.isWatched).toList();
  }
  
  /// İzlenmeyen filmleri getir
  List<Movie> get unwatchedMovies {
    return state.movies.where((movie) => !movie.isWatched).toList();
  }
  
  /// Local storage'a kaydet (şimdilik boş implementasyon)
  Future<void> _saveToLocalStorage() async {
    // TODO: SharedPreferences ile local storage implementasyonu
    // Aşama 4'te implement edeceğiz
  }
  
  /// Local storage'dan yükle (şimdilik boş implementasyon)
  Future<void> loadFromLocalStorage() async {
    // TODO: SharedPreferences ile local storage implementasyonu
    // Aşama 4'te implement edeceğiz
  }
}

/// İzleme listesi provider'ı
final watchlistProvider = StateNotifierProvider<WatchlistNotifier, WatchlistState>((ref) {
  final tmdbService = ref.watch(tmdbServiceProvider);
  return WatchlistNotifier(tmdbService);
});

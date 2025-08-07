import 'package:flutter_riverpod/flutter_riverpod.dart';

// Aşama 1: Film Favori Durumu
// Bu örnek, StateProvider ile basit bir favori sistemi oluşturur

/// Favori film ID'lerini tutan provider
/// Set<int> kullanarak unique film ID'lerini saklar
final favoriteMoviesProvider = StateProvider<Set<int>>((ref) => {});

/// Favori film işlemleri için provider
final favoriteOperationsProvider = Provider<FavoriteOperations>((ref) {
  return FavoriteOperations(ref);
});

/// Favori film işlemleri sınıfı
class FavoriteOperations {
  final Ref _ref;
  
  FavoriteOperations(this._ref);
  
  /// Filmi favorilere ekle
  void addToFavorites(int movieId) {
    _ref.read(favoriteMoviesProvider.notifier).state = {
      ..._ref.read(favoriteMoviesProvider),
      movieId,
    };
  }
  
  /// Filmi favorilerden çıkar
  void removeFromFavorites(int movieId) {
    final currentFavorites = _ref.read(favoriteMoviesProvider);
    currentFavorites.remove(movieId);
    _ref.read(favoriteMoviesProvider.notifier).state = Set.from(currentFavorites);
  }
  
  /// Film favori mi kontrol et
  bool isFavorite(int movieId) {
    return _ref.read(favoriteMoviesProvider).contains(movieId);
  }
  
  /// Favori film sayısını al
  int get favoriteCount => _ref.read(favoriteMoviesProvider).length;
  
  /// Tüm favori filmleri al
  Set<int> get allFavorites => _ref.read(favoriteMoviesProvider);
  
  /// Favorileri temizle
  void clearFavorites() {
    _ref.read(favoriteMoviesProvider.notifier).state = {};
  }
}


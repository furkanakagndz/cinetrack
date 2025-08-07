import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_model.freezed.dart';
part 'movie_model.g.dart';

/// Film modeli - TMDB API'den gelen verileri temsil eder
@freezed
class Movie with _$Movie {
  const factory Movie({
    required int id,
    required String title,
    required String overview,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'vote_average') required double voteAverage,
    @JsonKey(name: 'vote_count') required int voteCount,
    @JsonKey(name: 'release_date') required DateTime releaseDate,
    @Default([]) List<String> genres,
    @Default(false) bool isFavorite,
    @Default(false) bool isWatched,
  }) = _Movie;
  
  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}

/// Film listesi durumu - StateNotifier için kullanılır
@freezed
class MoviesState with _$MoviesState {
  const factory MoviesState({
    @Default([]) List<Movie> movies,
    @Default(false) bool isLoading,
    String? error,
    @Default(1) int currentPage,
    @Default(false) bool hasReachedMax,
    @Default('') String searchQuery,
  }) = _MoviesState;
}

/// Film detay durumu
@freezed
class MovieDetailState with _$MovieDetailState {
  const factory MovieDetailState({
    Movie? movie,
    @Default(false) bool isLoading,
    String? error,
  }) = _MovieDetailState;
}

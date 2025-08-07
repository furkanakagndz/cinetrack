/// Film modeli - TMDB API'den gelen verileri temsil eder
class Movie {
  final int id;
  final String title;
  final String overview;
  final String? posterPath;
  final double voteAverage;
  final int voteCount;
  final DateTime? releaseDate;
  final List<String> genres;
  final bool isFavorite;
  final bool isWatched;

  const Movie({
    required this.id,
    required this.title,
    required this.overview,
    this.posterPath,
    required this.voteAverage,
    required this.voteCount,
    this.releaseDate,
    this.genres = const [],
    this.isFavorite = false,
    this.isWatched = false,
  });

  Movie copyWith({
    int? id,
    String? title,
    String? overview,
    String? posterPath,
    double? voteAverage,
    int? voteCount,
    DateTime? releaseDate,
    List<String>? genres,
    bool? isFavorite,
    bool? isWatched,
  }) {
    return Movie(
      id: id ?? this.id,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      posterPath: posterPath ?? this.posterPath,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
      releaseDate: releaseDate ?? this.releaseDate,
      genres: genres ?? this.genres,
      isFavorite: isFavorite ?? this.isFavorite,
      isWatched: isWatched ?? this.isWatched,
    );
  }

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] as int,
      title: json['title'] as String,
      overview: json['overview'] as String,
      posterPath: json['poster_path'] as String?,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'] as int,
      releaseDate: json['release_date'] != null 
          ? DateTime.parse(json['release_date'] as String)
          : null,
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => e['name'] as String)
          .toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'overview': overview,
      'poster_path': posterPath,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'release_date': releaseDate?.toIso8601String(),
      'genres': genres,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Movie &&
        other.id == id &&
        other.title == title &&
        other.overview == overview &&
        other.posterPath == posterPath &&
        other.voteAverage == voteAverage &&
        other.voteCount == voteCount &&
        other.releaseDate == releaseDate &&
        other.genres == genres &&
        other.isFavorite == isFavorite &&
        other.isWatched == isWatched;
  }

  @override
  int get hashCode {
    return Object.hash(
      id, title, overview, posterPath, voteAverage, 
      voteCount, releaseDate, genres, isFavorite, isWatched,
    );
  }
}

/// Film listesi durumu - StateNotifier için kullanılır
class MoviesState {
  final List<Movie> movies;
  final bool isLoading;
  final String? error;
  final int currentPage;
  final bool hasReachedMax;
  final String searchQuery;

  const MoviesState({
    this.movies = const [],
    this.isLoading = false,
    this.error,
    this.currentPage = 1,
    this.hasReachedMax = false,
    this.searchQuery = '',
  });

  MoviesState copyWith({
    List<Movie>? movies,
    bool? isLoading,
    String? error,
    int? currentPage,
    bool? hasReachedMax,
    String? searchQuery,
  }) {
    return MoviesState(
      movies: movies ?? this.movies,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      currentPage: currentPage ?? this.currentPage,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MoviesState &&
        other.movies == movies &&
        other.isLoading == isLoading &&
        other.error == error &&
        other.currentPage == currentPage &&
        other.hasReachedMax == hasReachedMax &&
        other.searchQuery == searchQuery;
  }

  @override
  int get hashCode {
    return Object.hash(movies, isLoading, error, currentPage, hasReachedMax, searchQuery);
  }
}

/// Film detay durumu
class MovieDetailState {
  final Movie? movie;
  final bool isLoading;
  final String? error;

  const MovieDetailState({
    this.movie,
    this.isLoading = false,
    this.error,
  });

  MovieDetailState copyWith({
    Movie? movie,
    bool? isLoading,
    String? error,
  }) {
    return MovieDetailState(
      movie: movie ?? this.movie,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MovieDetailState &&
        other.movie == movie &&
        other.isLoading == isLoading &&
        other.error == error;
  }

  @override
  int get hashCode {
    return Object.hash(movie, isLoading, error);
  }
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return _Movie.fromJson(json);
}

/// @nodoc
mixin _$Movie {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get overview => throw _privateConstructorUsedError;
  @JsonKey(name: 'poster_path')
  String? get posterPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_average')
  double get voteAverage => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_count')
  int get voteCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'release_date')
  DateTime get releaseDate => throw _privateConstructorUsedError;
  List<String> get genres => throw _privateConstructorUsedError;
  bool get isFavorite => throw _privateConstructorUsedError;
  bool get isWatched => throw _privateConstructorUsedError;

  /// Serializes this Movie to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Movie
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MovieCopyWith<Movie> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieCopyWith<$Res> {
  factory $MovieCopyWith(Movie value, $Res Function(Movie) then) =
      _$MovieCopyWithImpl<$Res, Movie>;
  @useResult
  $Res call({
    int id,
    String title,
    String overview,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'vote_average') double voteAverage,
    @JsonKey(name: 'vote_count') int voteCount,
    @JsonKey(name: 'release_date') DateTime releaseDate,
    List<String> genres,
    bool isFavorite,
    bool isWatched,
  });
}

/// @nodoc
class _$MovieCopyWithImpl<$Res, $Val extends Movie>
    implements $MovieCopyWith<$Res> {
  _$MovieCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Movie
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? overview = null,
    Object? posterPath = freezed,
    Object? voteAverage = null,
    Object? voteCount = null,
    Object? releaseDate = null,
    Object? genres = null,
    Object? isFavorite = null,
    Object? isWatched = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int,
            title:
                null == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String,
            overview:
                null == overview
                    ? _value.overview
                    : overview // ignore: cast_nullable_to_non_nullable
                        as String,
            posterPath:
                freezed == posterPath
                    ? _value.posterPath
                    : posterPath // ignore: cast_nullable_to_non_nullable
                        as String?,
            voteAverage:
                null == voteAverage
                    ? _value.voteAverage
                    : voteAverage // ignore: cast_nullable_to_non_nullable
                        as double,
            voteCount:
                null == voteCount
                    ? _value.voteCount
                    : voteCount // ignore: cast_nullable_to_non_nullable
                        as int,
            releaseDate:
                null == releaseDate
                    ? _value.releaseDate
                    : releaseDate // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            genres:
                null == genres
                    ? _value.genres
                    : genres // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            isFavorite:
                null == isFavorite
                    ? _value.isFavorite
                    : isFavorite // ignore: cast_nullable_to_non_nullable
                        as bool,
            isWatched:
                null == isWatched
                    ? _value.isWatched
                    : isWatched // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MovieImplCopyWith<$Res> implements $MovieCopyWith<$Res> {
  factory _$$MovieImplCopyWith(
    _$MovieImpl value,
    $Res Function(_$MovieImpl) then,
  ) = __$$MovieImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String title,
    String overview,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'vote_average') double voteAverage,
    @JsonKey(name: 'vote_count') int voteCount,
    @JsonKey(name: 'release_date') DateTime releaseDate,
    List<String> genres,
    bool isFavorite,
    bool isWatched,
  });
}

/// @nodoc
class __$$MovieImplCopyWithImpl<$Res>
    extends _$MovieCopyWithImpl<$Res, _$MovieImpl>
    implements _$$MovieImplCopyWith<$Res> {
  __$$MovieImplCopyWithImpl(
    _$MovieImpl _value,
    $Res Function(_$MovieImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Movie
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? overview = null,
    Object? posterPath = freezed,
    Object? voteAverage = null,
    Object? voteCount = null,
    Object? releaseDate = null,
    Object? genres = null,
    Object? isFavorite = null,
    Object? isWatched = null,
  }) {
    return _then(
      _$MovieImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int,
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        overview:
            null == overview
                ? _value.overview
                : overview // ignore: cast_nullable_to_non_nullable
                    as String,
        posterPath:
            freezed == posterPath
                ? _value.posterPath
                : posterPath // ignore: cast_nullable_to_non_nullable
                    as String?,
        voteAverage:
            null == voteAverage
                ? _value.voteAverage
                : voteAverage // ignore: cast_nullable_to_non_nullable
                    as double,
        voteCount:
            null == voteCount
                ? _value.voteCount
                : voteCount // ignore: cast_nullable_to_non_nullable
                    as int,
        releaseDate:
            null == releaseDate
                ? _value.releaseDate
                : releaseDate // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        genres:
            null == genres
                ? _value._genres
                : genres // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        isFavorite:
            null == isFavorite
                ? _value.isFavorite
                : isFavorite // ignore: cast_nullable_to_non_nullable
                    as bool,
        isWatched:
            null == isWatched
                ? _value.isWatched
                : isWatched // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MovieImpl implements _Movie {
  const _$MovieImpl({
    required this.id,
    required this.title,
    required this.overview,
    @JsonKey(name: 'poster_path') this.posterPath,
    @JsonKey(name: 'vote_average') required this.voteAverage,
    @JsonKey(name: 'vote_count') required this.voteCount,
    @JsonKey(name: 'release_date') required this.releaseDate,
    final List<String> genres = const [],
    this.isFavorite = false,
    this.isWatched = false,
  }) : _genres = genres;

  factory _$MovieImpl.fromJson(Map<String, dynamic> json) =>
      _$$MovieImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String overview;
  @override
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @override
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @override
  @JsonKey(name: 'vote_count')
  final int voteCount;
  @override
  @JsonKey(name: 'release_date')
  final DateTime releaseDate;
  final List<String> _genres;
  @override
  @JsonKey()
  List<String> get genres {
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genres);
  }

  @override
  @JsonKey()
  final bool isFavorite;
  @override
  @JsonKey()
  final bool isWatched;

  @override
  String toString() {
    return 'Movie(id: $id, title: $title, overview: $overview, posterPath: $posterPath, voteAverage: $voteAverage, voteCount: $voteCount, releaseDate: $releaseDate, genres: $genres, isFavorite: $isFavorite, isWatched: $isWatched)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage) &&
            (identical(other.voteCount, voteCount) ||
                other.voteCount == voteCount) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            const DeepCollectionEquality().equals(other._genres, _genres) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.isWatched, isWatched) ||
                other.isWatched == isWatched));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    overview,
    posterPath,
    voteAverage,
    voteCount,
    releaseDate,
    const DeepCollectionEquality().hash(_genres),
    isFavorite,
    isWatched,
  );

  /// Create a copy of Movie
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieImplCopyWith<_$MovieImpl> get copyWith =>
      __$$MovieImplCopyWithImpl<_$MovieImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MovieImplToJson(this);
  }
}

abstract class _Movie implements Movie {
  const factory _Movie({
    required final int id,
    required final String title,
    required final String overview,
    @JsonKey(name: 'poster_path') final String? posterPath,
    @JsonKey(name: 'vote_average') required final double voteAverage,
    @JsonKey(name: 'vote_count') required final int voteCount,
    @JsonKey(name: 'release_date') required final DateTime releaseDate,
    final List<String> genres,
    final bool isFavorite,
    final bool isWatched,
  }) = _$MovieImpl;

  factory _Movie.fromJson(Map<String, dynamic> json) = _$MovieImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get overview;
  @override
  @JsonKey(name: 'poster_path')
  String? get posterPath;
  @override
  @JsonKey(name: 'vote_average')
  double get voteAverage;
  @override
  @JsonKey(name: 'vote_count')
  int get voteCount;
  @override
  @JsonKey(name: 'release_date')
  DateTime get releaseDate;
  @override
  List<String> get genres;
  @override
  bool get isFavorite;
  @override
  bool get isWatched;

  /// Create a copy of Movie
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MovieImplCopyWith<_$MovieImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MoviesState {
  List<Movie> get movies => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  bool get hasReachedMax => throw _privateConstructorUsedError;
  String get searchQuery => throw _privateConstructorUsedError;

  /// Create a copy of MoviesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MoviesStateCopyWith<MoviesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoviesStateCopyWith<$Res> {
  factory $MoviesStateCopyWith(
    MoviesState value,
    $Res Function(MoviesState) then,
  ) = _$MoviesStateCopyWithImpl<$Res, MoviesState>;
  @useResult
  $Res call({
    List<Movie> movies,
    bool isLoading,
    String? error,
    int currentPage,
    bool hasReachedMax,
    String searchQuery,
  });
}

/// @nodoc
class _$MoviesStateCopyWithImpl<$Res, $Val extends MoviesState>
    implements $MoviesStateCopyWith<$Res> {
  _$MoviesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MoviesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movies = null,
    Object? isLoading = null,
    Object? error = freezed,
    Object? currentPage = null,
    Object? hasReachedMax = null,
    Object? searchQuery = null,
  }) {
    return _then(
      _value.copyWith(
            movies:
                null == movies
                    ? _value.movies
                    : movies // ignore: cast_nullable_to_non_nullable
                        as List<Movie>,
            isLoading:
                null == isLoading
                    ? _value.isLoading
                    : isLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
            error:
                freezed == error
                    ? _value.error
                    : error // ignore: cast_nullable_to_non_nullable
                        as String?,
            currentPage:
                null == currentPage
                    ? _value.currentPage
                    : currentPage // ignore: cast_nullable_to_non_nullable
                        as int,
            hasReachedMax:
                null == hasReachedMax
                    ? _value.hasReachedMax
                    : hasReachedMax // ignore: cast_nullable_to_non_nullable
                        as bool,
            searchQuery:
                null == searchQuery
                    ? _value.searchQuery
                    : searchQuery // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MoviesStateImplCopyWith<$Res>
    implements $MoviesStateCopyWith<$Res> {
  factory _$$MoviesStateImplCopyWith(
    _$MoviesStateImpl value,
    $Res Function(_$MoviesStateImpl) then,
  ) = __$$MoviesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<Movie> movies,
    bool isLoading,
    String? error,
    int currentPage,
    bool hasReachedMax,
    String searchQuery,
  });
}

/// @nodoc
class __$$MoviesStateImplCopyWithImpl<$Res>
    extends _$MoviesStateCopyWithImpl<$Res, _$MoviesStateImpl>
    implements _$$MoviesStateImplCopyWith<$Res> {
  __$$MoviesStateImplCopyWithImpl(
    _$MoviesStateImpl _value,
    $Res Function(_$MoviesStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MoviesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movies = null,
    Object? isLoading = null,
    Object? error = freezed,
    Object? currentPage = null,
    Object? hasReachedMax = null,
    Object? searchQuery = null,
  }) {
    return _then(
      _$MoviesStateImpl(
        movies:
            null == movies
                ? _value._movies
                : movies // ignore: cast_nullable_to_non_nullable
                    as List<Movie>,
        isLoading:
            null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
        error:
            freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as String?,
        currentPage:
            null == currentPage
                ? _value.currentPage
                : currentPage // ignore: cast_nullable_to_non_nullable
                    as int,
        hasReachedMax:
            null == hasReachedMax
                ? _value.hasReachedMax
                : hasReachedMax // ignore: cast_nullable_to_non_nullable
                    as bool,
        searchQuery:
            null == searchQuery
                ? _value.searchQuery
                : searchQuery // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$MoviesStateImpl implements _MoviesState {
  const _$MoviesStateImpl({
    final List<Movie> movies = const [],
    this.isLoading = false,
    this.error,
    this.currentPage = 1,
    this.hasReachedMax = false,
    this.searchQuery = '',
  }) : _movies = movies;

  final List<Movie> _movies;
  @override
  @JsonKey()
  List<Movie> get movies {
    if (_movies is EqualUnmodifiableListView) return _movies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movies);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;
  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final bool hasReachedMax;
  @override
  @JsonKey()
  final String searchQuery;

  @override
  String toString() {
    return 'MoviesState(movies: $movies, isLoading: $isLoading, error: $error, currentPage: $currentPage, hasReachedMax: $hasReachedMax, searchQuery: $searchQuery)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoviesStateImpl &&
            const DeepCollectionEquality().equals(other._movies, _movies) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.hasReachedMax, hasReachedMax) ||
                other.hasReachedMax == hasReachedMax) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_movies),
    isLoading,
    error,
    currentPage,
    hasReachedMax,
    searchQuery,
  );

  /// Create a copy of MoviesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MoviesStateImplCopyWith<_$MoviesStateImpl> get copyWith =>
      __$$MoviesStateImplCopyWithImpl<_$MoviesStateImpl>(this, _$identity);
}

abstract class _MoviesState implements MoviesState {
  const factory _MoviesState({
    final List<Movie> movies,
    final bool isLoading,
    final String? error,
    final int currentPage,
    final bool hasReachedMax,
    final String searchQuery,
  }) = _$MoviesStateImpl;

  @override
  List<Movie> get movies;
  @override
  bool get isLoading;
  @override
  String? get error;
  @override
  int get currentPage;
  @override
  bool get hasReachedMax;
  @override
  String get searchQuery;

  /// Create a copy of MoviesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MoviesStateImplCopyWith<_$MoviesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MovieDetailState {
  Movie? get movie => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of MovieDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MovieDetailStateCopyWith<MovieDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieDetailStateCopyWith<$Res> {
  factory $MovieDetailStateCopyWith(
    MovieDetailState value,
    $Res Function(MovieDetailState) then,
  ) = _$MovieDetailStateCopyWithImpl<$Res, MovieDetailState>;
  @useResult
  $Res call({Movie? movie, bool isLoading, String? error});

  $MovieCopyWith<$Res>? get movie;
}

/// @nodoc
class _$MovieDetailStateCopyWithImpl<$Res, $Val extends MovieDetailState>
    implements $MovieDetailStateCopyWith<$Res> {
  _$MovieDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MovieDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movie = freezed,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            movie:
                freezed == movie
                    ? _value.movie
                    : movie // ignore: cast_nullable_to_non_nullable
                        as Movie?,
            isLoading:
                null == isLoading
                    ? _value.isLoading
                    : isLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
            error:
                freezed == error
                    ? _value.error
                    : error // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of MovieDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MovieCopyWith<$Res>? get movie {
    if (_value.movie == null) {
      return null;
    }

    return $MovieCopyWith<$Res>(_value.movie!, (value) {
      return _then(_value.copyWith(movie: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MovieDetailStateImplCopyWith<$Res>
    implements $MovieDetailStateCopyWith<$Res> {
  factory _$$MovieDetailStateImplCopyWith(
    _$MovieDetailStateImpl value,
    $Res Function(_$MovieDetailStateImpl) then,
  ) = __$$MovieDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Movie? movie, bool isLoading, String? error});

  @override
  $MovieCopyWith<$Res>? get movie;
}

/// @nodoc
class __$$MovieDetailStateImplCopyWithImpl<$Res>
    extends _$MovieDetailStateCopyWithImpl<$Res, _$MovieDetailStateImpl>
    implements _$$MovieDetailStateImplCopyWith<$Res> {
  __$$MovieDetailStateImplCopyWithImpl(
    _$MovieDetailStateImpl _value,
    $Res Function(_$MovieDetailStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MovieDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movie = freezed,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(
      _$MovieDetailStateImpl(
        movie:
            freezed == movie
                ? _value.movie
                : movie // ignore: cast_nullable_to_non_nullable
                    as Movie?,
        isLoading:
            null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
        error:
            freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$MovieDetailStateImpl implements _MovieDetailState {
  const _$MovieDetailStateImpl({
    this.movie,
    this.isLoading = false,
    this.error,
  });

  @override
  final Movie? movie;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;

  @override
  String toString() {
    return 'MovieDetailState(movie: $movie, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieDetailStateImpl &&
            (identical(other.movie, movie) || other.movie == movie) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, movie, isLoading, error);

  /// Create a copy of MovieDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieDetailStateImplCopyWith<_$MovieDetailStateImpl> get copyWith =>
      __$$MovieDetailStateImplCopyWithImpl<_$MovieDetailStateImpl>(
        this,
        _$identity,
      );
}

abstract class _MovieDetailState implements MovieDetailState {
  const factory _MovieDetailState({
    final Movie? movie,
    final bool isLoading,
    final String? error,
  }) = _$MovieDetailStateImpl;

  @override
  Movie? get movie;
  @override
  bool get isLoading;
  @override
  String? get error;

  /// Create a copy of MovieDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MovieDetailStateImplCopyWith<_$MovieDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

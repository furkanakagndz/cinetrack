import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constants/api_constants.dart';
import '../models/movie_model.dart';

/// TMDB API servisi
/// Bu servis, TMDB API'den film verilerini çeker
class TmdbService {
  final Dio _dio;
  
  TmdbService(this._dio);
  
  /// Popüler filmleri getir
  Future<List<Movie>> getPopularMovies({int page = 1}) async {
    try {
      final response = await _dio.get(
        '${ApiConstants.baseUrl}${ApiConstants.popularMovies}',
        queryParameters: {
          'api_key': ApiConstants.apiKey,
          'page': page,
          'language': 'tr-TR',
        },
      );
      
      final List<dynamic> results = response.data['results'];
      return results.map((json) => Movie.fromJson(json)).toList();
    } on DioException catch (e) {
      throw Exception('Film verileri yüklenirken hata oluştu: ${e.message}');
    }
  }
  
  /// Film arama
  Future<List<Movie>> searchMovies(String query, {int page = 1}) async {
    if (query.trim().isEmpty) {
      return [];
    }
    
    try {
      final response = await _dio.get(
        '${ApiConstants.baseUrl}${ApiConstants.searchMovies}',
        queryParameters: {
          'api_key': ApiConstants.apiKey,
          'query': query,
          'page': page,
          'language': 'tr-TR',
        },
      );
      
      final List<dynamic> results = response.data['results'];
      return results.map((json) => Movie.fromJson(json)).toList();
    } on DioException catch (e) {
      throw Exception('Film arama sırasında hata oluştu: ${e.message}');
    }
  }
  
  /// Film detaylarını getir
  Future<Movie> getMovieDetails(int movieId) async {
    try {
      final response = await _dio.get(
        '${ApiConstants.baseUrl}${ApiConstants.movieDetails}/$movieId',
        queryParameters: {
          'api_key': ApiConstants.apiKey,
          'language': 'tr-TR',
        },
      );
      
      return Movie.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Film detayları yüklenirken hata oluştu: ${e.message}');
    }
  }
  
  /// Poster URL'i oluştur
  static String getPosterUrl(String? posterPath, {String size = 'w200'}) {
    if (posterPath == null || posterPath.isEmpty) {
      return ApiConstants.defaultPosterUrl;
    }
    return '${ApiConstants.imageBaseUrl}$size$posterPath';
  }
}

/// Dio provider'ı
final dioProvider = Provider<Dio>((ref) {
  return Dio();
});

/// TMDB Service provider'ı
final tmdbServiceProvider = Provider<TmdbService>((ref) {
  final dio = ref.watch(dioProvider);
  return TmdbService(dio);
});

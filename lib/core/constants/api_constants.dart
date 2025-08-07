/// TMDB API sabitleri
class ApiConstants {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String imageBaseUrl = 'https://image.tmdb.org/t/p';
  
  // Demo için test API key (gerçek uygulamada kendi API key'inizi kullanın)
  // https://www.themoviedb.org/settings/api
  static const String apiKey = 'ed232ad8939d082c743f9d8b5c5ee5b0';
  
  // Endpoint'ler
  static const String popularMovies = '/movie/popular';
  static const String searchMovies = '/search/movie';
  static const String movieDetails = '/movie';
  
  // Image boyutları
  static const String posterSmall = '/w200';
  static const String posterMedium = '/w500';
  static const String posterLarge = '/w780';
  static const String backdropLarge = '/w1280';
  
  // Varsayılan poster URL'i
  static const String defaultPosterUrl = 'https://via.placeholder.com/200x300/cccccc/666666?text=No+Image';
}

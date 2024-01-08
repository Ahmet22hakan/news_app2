
import 'package:news_app/models/WordpressModels/astrology_model.dart';
import 'package:news_app/models/WordpressModels/post_models.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://bulten360.com/wp-json/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  factory ApiService.make() {  final dio = Dio();  

    return ApiService(dio);
  }

 @GET('wp/v2/posts')
  Future<List<WpArtircle>> getLastArticles(@Query("per_page") int perPage,@Query("page") int page);
 @GET('wp/v2/posts')
  Future<List<WpArtircle>> getArticlesByCategoriId(@Query("categories") int kategori, @Query("per_page") int perPage,@Query("page") int page,);
   @GET('wp/v2/posts')
  Future<List<WpArtircle>> getArticlesByCategoriTag(@Query("tags") int tag, @Query("per_page") int perPage,@Query("page") int page,);

   @GET('wp/v2/posts')
  Future<List<WpArtircle>> getArticlesBySearching(@Query("search") String keyword, @Query("per_page") int perPage,@Query("page") int page,);

  @GET('yoast/v1/get_head')
  Future<AstrologyModel> getAstro(@Query("url") String url,);


  





}

final api = ApiService.make();

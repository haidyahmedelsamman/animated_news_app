import 'package:dio/dio.dart';
import 'package:news_app/core/networking/api_constants.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/home/data/models/sources_response.dart';
import '../../features/home/data/models/sources_title_response.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(ApiConstants.everyThing)
  Future<SourcesResponse> getArticals(
    @Query('apikey') String apiKey,
    @Query('q') String category,
    @Query('sources') String source,
  );

  @GET(ApiConstants.sourcesTitle)
  Future<SoursesTitleResponse> getSoursesTitle(
    @Query('apikey') String apiKey,
  );

  

}

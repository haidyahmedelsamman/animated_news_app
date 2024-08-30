import 'package:news_app/core/networking/api_constants.dart';
import 'package:news_app/features/home/data/models/sources_title_response.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../models/artical_model.dart';

class HomeRepo {
  final ApiService _apiService;

  HomeRepo(this._apiService);

  Future<ApiResult<List<ArticalModel>>> getArticals(
      String category, String source) async {
    try {
      final response =
          await _apiService.getArticals(ApiConstants.apiKey, category, source);
      return ApiResult.success(response.articles!);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<SourcesTitle>>> getSoursesTitle() async {
    try {
      final response = await _apiService.getSoursesTitle(ApiConstants.apiKey);
      return ApiResult.success(response.sources!);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}

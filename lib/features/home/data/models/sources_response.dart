// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:news_app/features/home/data/models/artical_model.dart';
part 'sources_response.g.dart';

@JsonSerializable()
class SourcesResponse {
  String? status;
  int? totalResults;
  List<ArticalModel>? articles;
  SourcesResponse({
    this.status,
    this.totalResults,
    this.articles,
  });

  Map<String, dynamic> toJson() => _$SourcesResponseToJson(this);

  factory SourcesResponse.fromJson(Map<String, dynamic> json) =>
      _$SourcesResponseFromJson(json);
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
part 'sources_title_response.g.dart';

@JsonSerializable()
class SoursesTitleResponse {
  String? status;
  List<SourcesTitle>? sources;
  SoursesTitleResponse({
    this.status,
    this.sources,
  });
  Map<String, dynamic> toJson() => _$SoursesTitleResponseToJson(this);

  factory SoursesTitleResponse.fromJson(Map<String, dynamic> json) =>
      _$SoursesTitleResponseFromJson(json);
}

@JsonSerializable()
class SourcesTitle {
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
  String? country;

  SourcesTitle(
      {this.id,
      this.name,
      this.description,
      this.url,
      this.category,
      this.language,
      this.country});
  Map<String, dynamic> toJson() => _$SourcesTitleToJson(this);

  factory SourcesTitle.fromJson(Map<String, dynamic> json) =>
      _$SourcesTitleFromJson(json);
}

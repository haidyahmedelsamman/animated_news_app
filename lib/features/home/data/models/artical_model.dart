// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'artical_model.g.dart';

@JsonSerializable()
class ArticalModel {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;
  ArticalModel({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory ArticalModel.fromJson(Map<String, dynamic> json) =>
      _$ArticalModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArticalModelToJson(this);
}

@JsonSerializable()
class Source {
  String? id;
  String? name;
  Source({
    this.id,
    this.name,
  });

  Map<String, dynamic> toJson() => _$SourceToJson(this);

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}

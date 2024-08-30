// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sources_title_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SoursesTitleResponse _$SoursesTitleResponseFromJson(
        Map<String, dynamic> json) =>
    SoursesTitleResponse(
      status: json['status'] as String?,
      sources: (json['sources'] as List<dynamic>?)
          ?.map((e) => SourcesTitle.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SoursesTitleResponseToJson(
        SoursesTitleResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'sources': instance.sources,
    };

SourcesTitle _$SourcesTitleFromJson(Map<String, dynamic> json) => SourcesTitle(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      category: json['category'] as String?,
      language: json['language'] as String?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$SourcesTitleToJson(SourcesTitle instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'url': instance.url,
      'category': instance.category,
      'language': instance.language,
      'country': instance.country,
    };

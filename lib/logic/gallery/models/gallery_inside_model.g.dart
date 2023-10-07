// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_inside_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GalleryInsideModel _$GalleryInsideModelFromJson(Map<String, dynamic> json) =>
    GalleryInsideModel(
      json['albumId'] as int,
      json['id'] as int,
      json['title'] as String,
      json['url'] as String,
      json['thumbnailUrl'] as String,
    );

Map<String, dynamic> _$GalleryInsideModelToJson(GalleryInsideModel instance) =>
    <String, dynamic>{
      'albumId': instance.albumId,
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
    };

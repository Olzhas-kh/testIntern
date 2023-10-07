// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_inside_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsInsideModel _$NewsInsideModelFromJson(Map<String, dynamic> json) =>
    NewsInsideModel(
      postId: json['postId'] as int,
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      body: json['body'] as String,
    );

Map<String, dynamic> _$NewsInsideModelToJson(NewsInsideModel instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'body': instance.body,
    };

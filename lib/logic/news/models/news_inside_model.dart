
import 'package:json_annotation/json_annotation.dart';
part 'news_inside_model.g.dart';

@JsonSerializable()
class NewsInsideModel{
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  NewsInsideModel({required this.postId,required this.id,required this.name,required this.email,required this.body});

  factory NewsInsideModel.fromJson(Map<String, dynamic> json)=> _$NewsInsideModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsInsideModelToJson(this);

}
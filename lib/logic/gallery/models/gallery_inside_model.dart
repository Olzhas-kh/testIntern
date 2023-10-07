import 'package:json_annotation/json_annotation.dart';
part 'gallery_inside_model.g.dart';

@JsonSerializable()
class GalleryInsideModel {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  GalleryInsideModel(
      this.albumId, this.id, this.title, this.url, this.thumbnailUrl);

  factory GalleryInsideModel.fromJson(Map<String, dynamic> json) =>
      _$GalleryInsideModelFromJson(json);
  Map<String, dynamic> toJson() => _$GalleryInsideModelToJson(this);
}

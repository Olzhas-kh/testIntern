import 'package:dio/dio.dart';
import 'package:test_intern/logic/gallery/datasources/gallery_inside_datasource.dart';
import 'package:test_intern/logic/gallery/models/gallery_inside_model.dart';

abstract class GalleryInsideRepository{
  Future<List<GalleryInsideModel>> getGalleryPhotos();

}

class GalleryInsideRepositoryImpl implements GalleryInsideRepository{
  final GalleryInsideDataSource galleryInsideDataSource;

  GalleryInsideRepositoryImpl(this.galleryInsideDataSource);

  @override
  Future<List<GalleryInsideModel>> getGalleryPhotos() async{
    Response response = await galleryInsideDataSource.getGalleryPhotos();
    return (response.data as List).map((i) => GalleryInsideModel.fromJson(i)).toList();

  }
}
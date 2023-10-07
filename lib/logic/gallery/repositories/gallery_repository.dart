import 'package:dio/dio.dart';
import 'package:test_intern/logic/gallery/datasources/gallery_datasource.dart';
import 'package:test_intern/logic/gallery/models/gallery_model.dart';

abstract class GalleryRepository{
  Future<List<GalleryModel>> getAlbums();

}

class GalleryRepositoryImpl implements GalleryRepository{
  final GalleryDataSource galleryDataSource;

  GalleryRepositoryImpl(this.galleryDataSource);

  @override
  Future<List<GalleryModel>> getAlbums() async{
    Response response = await galleryDataSource.getAlbums();
    return (response.data as List).map((i) => GalleryModel.fromJson(i)).toList();

  }
}
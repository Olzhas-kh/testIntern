import 'package:dio/dio.dart';

abstract class GalleryInsideDataSource{
  Future<Response> getGalleryPhotos();
}

class GalleryInsideDataSourceImpl implements GalleryInsideDataSource{
  Dio dio = Dio();

  @override
  Future<Response> getGalleryPhotos() async{
    Response response = await dio.get('https://jsonplaceholder.typicode.com/photos');
    return response; 
  }
}
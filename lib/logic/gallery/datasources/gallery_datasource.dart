import 'package:dio/dio.dart';

abstract class GalleryDataSource{
  Future<Response> getAlbums();
}

class GalleryDataSourceImpl implements GalleryDataSource{
  Dio dio = Dio();

  @override
  Future<Response> getAlbums() async{
    Response response = await dio.get('https://jsonplaceholder.typicode.com/albums');
    return response; 
  }
}
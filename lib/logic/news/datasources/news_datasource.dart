import 'package:dio/dio.dart';

abstract class NewsDataSource{
  Future<Response> getNewsPost();
}

class NewsDataSourceImpl implements NewsDataSource{
  Dio dio = Dio();

  @override
  Future<Response> getNewsPost() async{
    Response response = await dio.get('https://jsonplaceholder.typicode.com/posts');
    return response; 
  }
}
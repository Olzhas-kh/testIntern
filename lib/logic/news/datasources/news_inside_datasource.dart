import 'package:dio/dio.dart';

abstract class NewsInsideDataSource{
  Future<Response> getNewsComment();
}

class NewsInsideDataSourceImpl implements NewsInsideDataSource{
  Dio dio = Dio();

  @override
  Future<Response> getNewsComment() async{
    Response response = await dio.get('https://jsonplaceholder.typicode.com/comments');
    return response;
  }
}
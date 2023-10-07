import 'package:dio/dio.dart';

abstract class CheckDataSource{
  Future<Response> getTodos();
}

class CheckDataSourceImpl implements CheckDataSource{
  Dio dio = Dio();

  @override
  Future<Response> getTodos() async{
    Response response = await dio.get('https://jsonplaceholder.typicode.com/todos');
    return response; 
  }
}
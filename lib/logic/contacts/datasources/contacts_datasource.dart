import 'package:dio/dio.dart';

abstract class ContactsDataSource{
  Future<Response> getContact();
}

class ContactsDataSourceImpl implements ContactsDataSource{
  Dio dio = Dio();

  @override
  Future<Response> getContact() async{
    Response response = await dio.get('https://jsonplaceholder.typicode.com/users');
    return response; 
  }
}
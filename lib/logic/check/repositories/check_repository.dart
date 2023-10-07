import 'package:dio/dio.dart';
import 'package:test_intern/logic/check/datasources/check_datasource.dart';
import 'package:test_intern/logic/check/models/check_model.dart';

abstract class CheckRepository{
  Future<List<CheckModel>> getTodos();

}

class CheckRepositoryImpl implements CheckRepository{
  final CheckDataSource checkDataSource;

  CheckRepositoryImpl(this.checkDataSource);

  @override
  Future<List<CheckModel>> getTodos() async{
    Response response = await checkDataSource.getTodos();
    return (response.data as List).map((i) => CheckModel.fromJson(i)).toList();

  }
}
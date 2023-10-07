import 'package:dio/dio.dart';
import 'package:test_intern/logic/news/datasources/news_inside_datasource.dart';
import 'package:test_intern/logic/news/models/news_inside_model.dart';

abstract class NewsInsideRepository{
  Future<List<NewsInsideModel>> getNewsComment();
}

class NewsInsideRepositoryImpl implements NewsInsideRepository{
  final NewsInsideDataSource newsInsideDataSource;

  NewsInsideRepositoryImpl(this.newsInsideDataSource);

  @override
  Future<List<NewsInsideModel>> getNewsComment()async{
    Response response = await newsInsideDataSource.getNewsComment();
    return (response.data as List).map((i) => NewsInsideModel.fromJson(i)).toList();
  }
}
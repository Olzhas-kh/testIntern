
import 'package:dio/dio.dart';
import 'package:test_intern/logic/news/datasources/news_datasource.dart';
import 'package:test_intern/logic/news/models/news_model.dart';

abstract class NewsRepository{
  Future<List<NewsModel>> getNewsPost();

}

class NewsRepositoryImpl implements NewsRepository{
  final NewsDataSource newsDataSource;

  NewsRepositoryImpl(this.newsDataSource);

  @override
  Future<List<NewsModel>> getNewsPost() async{
    Response response = await newsDataSource.getNewsPost();
    return (response.data as List).map((i) => NewsModel.fromJson(i)).toList();

  }
}

import 'package:get_it/get_it.dart';
import 'package:test_intern/logic/check/bloc/check_bloc.dart';
import 'package:test_intern/logic/check/datasources/check_datasource.dart';
import 'package:test_intern/logic/check/repositories/check_repository.dart';
import 'package:test_intern/logic/contacts/bloc/contacts_bloc.dart';
import 'package:test_intern/logic/contacts/datasources/contacts_datasource.dart';
import 'package:test_intern/logic/contacts/repositories/contacts_repository.dart';
import 'package:test_intern/logic/gallery/blocs/gallery_bloc/gallery_bloc.dart';
import 'package:test_intern/logic/gallery/blocs/gallery_inside_bloc/gallery_inside_bloc.dart';
import 'package:test_intern/logic/gallery/datasources/gallery_datasource.dart';
import 'package:test_intern/logic/gallery/datasources/gallery_inside_datasource.dart';
import 'package:test_intern/logic/gallery/repositories/gallery_inside_repository.dart';
import 'package:test_intern/logic/gallery/repositories/gallery_repository.dart';
import 'package:test_intern/logic/news/bloc/news_bloc/news_bloc.dart';
import 'package:test_intern/logic/news/bloc/news_inside_bloc/news_inside_bloc.dart';
import 'package:test_intern/logic/news/datasources/news_datasource.dart';
import 'package:test_intern/logic/news/datasources/news_inside_datasource.dart';
import 'package:test_intern/logic/news/repositories/news_inside_repository.dart';
import 'package:test_intern/logic/news/repositories/news_repository.dart';

final getIt = GetIt.instance;

void initGetIt() async{
  getIt.registerFactory<NewsBloc>(() => NewsBloc(getIt()));

  getIt.registerLazySingleton<NewsRepository>(() => NewsRepositoryImpl(getIt()));

  getIt.registerLazySingleton<NewsDataSource>(() => NewsDataSourceImpl());

  getIt.registerFactory<NewsInsideBloc>(() => NewsInsideBloc(getIt()));

  getIt.registerLazySingleton<NewsInsideRepository>(() => NewsInsideRepositoryImpl(getIt()));

  getIt.registerLazySingleton<NewsInsideDataSource>(() => NewsInsideDataSourceImpl());

  getIt.registerFactory<GalleryBloc>(() => GalleryBloc(getIt()));

  getIt.registerLazySingleton<GalleryRepository>(() => GalleryRepositoryImpl(getIt()));

  getIt.registerLazySingleton<GalleryDataSource>(() => GalleryDataSourceImpl());

  getIt.registerFactory<GalleryInsideBloc>(() => GalleryInsideBloc(getIt()));

  getIt.registerLazySingleton<GalleryInsideRepository>(() => GalleryInsideRepositoryImpl(getIt()));

  getIt.registerLazySingleton<GalleryInsideDataSource>(() => GalleryInsideDataSourceImpl());

  getIt.registerFactory<CheckBloc>(() => CheckBloc(getIt()));

  getIt.registerLazySingleton<CheckRepository>(() => CheckRepositoryImpl(getIt()));

  getIt.registerLazySingleton<CheckDataSource>(() => CheckDataSourceImpl());

  getIt.registerFactory<ContactsBloc>(() => ContactsBloc(getIt()));

  getIt.registerLazySingleton<ContactsRepository>(() => ContactsRepositoryImpl(getIt()));

  getIt.registerLazySingleton<ContactsDataSource>(() => ContactsDataSourceImpl());
} 
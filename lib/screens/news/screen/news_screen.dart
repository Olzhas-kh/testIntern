import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_intern/const/colors.dart';
import 'package:test_intern/core/injection_container.dart';
import 'package:test_intern/logic/news/bloc/news_bloc/news_bloc.dart';
import 'package:test_intern/screens/news/screen/news_inside_screen.dart';
import 'package:test_intern/screens/news/widgets/news_card_widget.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NewsBloc>()..add(NewsPostEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'News',
          ),
        ),
        body: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state is NewsInitial) {
              return Center(
                child: Text(
                  "Initial State",
                  style: TextStyle(color: ColorProject.white),
                ),
              );
            }
            if (state is NewsPostLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  
                ),
              );
            }
            if (state is NewsPostSuccess) {
              return Padding(
                padding:  const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: ListView.builder(
                  itemCount: state.successNews.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) =>  NewsInsideScreen(postId: state.successNews[index].id, title: state.successNews[index].title,description: state.successNews[index].body,)));
                      },
                      child:  NewsCardWidget(title: state.successNews[index].title,description: state.successNews[index].body,),
                    );
                  },
                ),
              );
            }
            if(state is NewsPostFailed){
              return Center(child: Text(state.errorMessage,),);
            }
            return const Offstage();
          },
        ),
      ),
    );
  }
}

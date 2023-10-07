
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_intern/const/colors.dart';
import 'package:test_intern/core/injection_container.dart';
import 'package:test_intern/logic/news/bloc/news_inside_bloc/news_inside_bloc.dart';
import 'package:test_intern/logic/news/models/news_inside_model.dart';
import 'package:test_intern/screens/news/widgets/comment_card.dart';
import 'package:test_intern/screens/news/widgets/news_description_widget.dart';

class NewsInsideScreen extends StatefulWidget {
  final int postId;
  final String title;
  final String description;
  const NewsInsideScreen(
      {super.key,
      required this.title,
      required this.description,
      required this.postId});

  @override
  State<NewsInsideScreen> createState() => _NewsInsideScreenState();
}

class _NewsInsideScreenState extends State<NewsInsideScreen> {
  bool initialLength = true;

  void onPressedChage() {
    setState(() {
      initialLength = !initialLength;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<NewsInsideBloc>()..add(NewsInsideGetCommentEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Title',
          ),
        ),
        body: BlocBuilder<NewsInsideBloc, NewsInsideState>(
            builder: (context, state) {
          if (state is NewsInsideInitial) {
            return const Center(child: Text('State is initial'));
          }
          if (state is NewsInsideLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is NewsInsideSuccess) {
            List<NewsInsideModel> newPostComment = state.getNewsComment
                .where((element) => element.postId == widget.postId)
                .toList();

            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: ListView(children: [
                NewsDescriptionWidget(
                  title: widget.title,
                  description: widget.description,
                ),
                const SizedBox(
                  height: 32,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: initialLength ? 2 : newPostComment.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CommentCard(
                      name: newPostComment[index].email,
                      comment: newPostComment[index].body,
                    );
                  },
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 24)),
                    backgroundColor:
                        MaterialStateProperty.all(ColorProject.blueButtonColor),
                  ),
                  onPressed: () {
                    onPressedChage();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                      initialLength?'Show me ${newPostComment.length} comments' :'Hide comments' ,
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: GoogleFonts.inter().fontFamily),
                      ),
                      const Icon(
                        Icons.remove_red_eye,
                        size: 22,
                      )
                    ],
                  ),
                ),
              ]),
            );
          }
          if (state is NewsInsdeFailed) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          return const Offstage();
        }),
      ),
    );
  }
}

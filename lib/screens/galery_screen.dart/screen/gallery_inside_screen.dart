import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_intern/core/injection_container.dart';
import 'package:test_intern/logic/gallery/blocs/gallery_inside_bloc/gallery_inside_bloc.dart';
import 'package:test_intern/logic/gallery/models/gallery_inside_model.dart';
import 'package:test_intern/screens/galery_screen.dart/widgets/gallery_inside_photos.dart';

class GalleryInsideScreen extends StatefulWidget {
  final int albumId;
  const GalleryInsideScreen({super.key, required this.albumId});

  @override
  State<GalleryInsideScreen> createState() => _GalleryInsideScreenState();
}

class _GalleryInsideScreenState extends State<GalleryInsideScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<GalleryInsideBloc>()..add(GalleryInsidePhotosEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Title',
          ),
        ),
        body: BlocBuilder<GalleryInsideBloc, GalleryInsideState>(
          builder: (context, state) {
            if (state is GalleryInsideInitial) {
              return const Center(
                child: Text(
                  "Initial State",
                ),
              );
            }
            if (state is GalleryInsideLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is GalleryInsideSuccess) {
              List<GalleryInsideModel> newGalleryPhotos = state
                  .successGalleryInside
                  .where((element) => element.albumId == widget.albumId)
                  .toList();

              return GridView.builder(
                itemCount: newGalleryPhotos.length,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, crossAxisSpacing: 8, mainAxisSpacing: 8),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      onTap: () {
                        GalleryInsidePhotos.showFullScreen(
                            newGalleryPhotos[index].thumbnailUrl, context);
                      },
                      child: GalleryInsidePhotos(
                        title: newGalleryPhotos[index].title,
                        imageUrl: newGalleryPhotos[index].thumbnailUrl,
                      ));
                },
              );
            }
            if (state is GalleryInsideFailed) {
              return Center(
                child: Text(
                  state.errorMessage,
                ),
              );
            }
            return const Offstage();
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_intern/core/injection_container.dart';
import 'package:test_intern/logic/gallery/blocs/gallery_bloc/gallery_bloc.dart';
import 'package:test_intern/screens/galery_screen.dart/screen/gallery_inside_screen.dart';
import 'package:test_intern/screens/galery_screen.dart/widgets/galery_album_container.dart';

class GaleryScreen extends StatefulWidget {
  const GaleryScreen({super.key});

  @override
  State<GaleryScreen> createState() => _GaleryScreenState();
}

class _GaleryScreenState extends State<GaleryScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GalleryBloc>()..add(GalleryAlbumEvent()),
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Gallery',
            ),
          ),
          body: BlocBuilder<GalleryBloc, GalleryState>(
            builder: (context, state) {
              if (state is GalleryInitial) {
                return const Center(
                  child: Text(
                    "Initial State",
                  ),
                );
              }
              if (state is GalleryLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is GallerySuccess) {
                return GridView.builder(
                  itemCount: state.successGalleryAlbums.length,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=> GalleryInsideScreen(albumId: state.successGalleryAlbums[index].id,))),
                      child: GaleryAlbumContainer(title: state.successGalleryAlbums[index].title,));
                  },
                );
              }
              if (state is GalleryFailed) {
                return Center(
                  child: Text(
                    state.errorMessage,
                  ),
                );
              }
              return const Offstage();
            },
          )),
    );
  }
}

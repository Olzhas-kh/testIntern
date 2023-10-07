
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_intern/logic/gallery/models/gallery_model.dart';
import 'package:test_intern/logic/gallery/repositories/gallery_repository.dart';

part 'gallery_event.dart';
part 'gallery_state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
    final GalleryRepository galleryRepository;

  GalleryBloc(this.galleryRepository) : super(GalleryInitial()) {
    on<GalleryAlbumEvent>((event, emit)async {
      emit(GalleryLoading());
      try {
        final List<GalleryModel> response = await galleryRepository.getAlbums();
        emit(GallerySuccess(successGalleryAlbums: response));
      }catch (e) {
        emit(GalleryFailed(errorMessage: e.toString()));
      }
    
    });
  }
}

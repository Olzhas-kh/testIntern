import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_intern/logic/gallery/models/gallery_inside_model.dart';
import 'package:test_intern/logic/gallery/repositories/gallery_inside_repository.dart';

part 'gallery_inside_event.dart';
part 'gallery_inside_state.dart';

class GalleryInsideBloc extends Bloc<GalleryInsideEvent, GalleryInsideState> {
  final GalleryInsideRepository galleryInsideRepository;

  GalleryInsideBloc(this.galleryInsideRepository)
      : super(GalleryInsideInitial()) {
    on<GalleryInsidePhotosEvent>((event, emit) async {
      emit(GalleryInsideLoading());
      try {
        final List<GalleryInsideModel> response =
            await galleryInsideRepository.getGalleryPhotos();
        emit(GalleryInsideSuccess(successGalleryInside: response));
      } catch (e) {
        emit(GalleryInsideFailed(errorMessage: e.toString()));
      }
    });
  }
}

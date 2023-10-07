part of 'gallery_inside_bloc.dart';


abstract class GalleryInsideState {}

class GalleryInsideInitial extends GalleryInsideState {}

class GalleryInsideLoading extends GalleryInsideState {}

class GalleryInsideSuccess extends GalleryInsideState {
  final List<GalleryInsideModel> successGalleryInside;

  GalleryInsideSuccess({required this.successGalleryInside});
}

class GalleryInsideFailed extends GalleryInsideState {
  final String errorMessage;

  GalleryInsideFailed({required this.errorMessage});
}
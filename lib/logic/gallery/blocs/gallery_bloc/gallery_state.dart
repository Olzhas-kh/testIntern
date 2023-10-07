part of 'gallery_bloc.dart';

abstract class GalleryState {}

class GalleryInitial extends GalleryState {}

class GalleryLoading extends GalleryState {}

class GallerySuccess extends GalleryState {
  final List<GalleryModel> successGalleryAlbums;

  GallerySuccess({required this.successGalleryAlbums});
}

class GalleryFailed extends GalleryState {
  final String errorMessage;

  GalleryFailed({required this.errorMessage});
}

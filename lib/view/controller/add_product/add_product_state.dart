

abstract class AddProductStates {}

class AddProductInitialState extends AddProductStates {}

class AddProductLoadingState extends AddProductStates {}

class AddProductSuccessState extends AddProductStates {}
class UploadPhotoLoadingState extends AddProductStates {}

class UploadPhotoSuccessState extends AddProductStates {
  String photoPath;
  UploadPhotoSuccessState({required this.photoPath});
}


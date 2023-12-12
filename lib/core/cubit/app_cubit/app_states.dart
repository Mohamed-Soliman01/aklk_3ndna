abstract class AppStates {}

class InitialState extends AppStates {}

class GetUserDataLoadingState extends AppStates {}

class GetUserDataSuccessState extends AppStates {}

class GetUserDataErrorState extends AppStates {
  final String error;
  GetUserDataErrorState(this.error);
}

class UpdateUserDataLoadingState extends AppStates {}

class UpdateUserDataSuccessState extends AppStates {}

class UpdateUserDataErrorState extends AppStates {
  late final String error;
  UpdateUserDataErrorState(this.error);
}

//get All Meals
class GetAllMealsLoadingState extends AppStates {}

class GetAllMealsSuccessState extends AppStates {}

class GetAllMealsErrorState extends AppStates {
  final String error;
  GetAllMealsErrorState(this.error);
}

class SocialLikePostsSuccessState extends AppStates {}

class LikeMealsErrorState extends AppStates {
  final String error;
  LikeMealsErrorState(this.error);
}

/////////////////////////////////////////////////////////////////////
//ProfileImagePicker
class ProfileImagePickerLoadingState extends AppStates {}

class ProfileImagePickerSuccessState extends AppStates {}

class ProfileImagePickerErrorState extends AppStates {}

//UpdateProfileImage
class UpdateProfileImageLoadingState extends AppStates {}

class UpdateProfileImageSuccessState extends AppStates {}

class UpdateProfileImageErrorState extends AppStates {}

// Search

class SearchMealLoadingState extends AppStates {}

class SearchMealSuccessState extends AppStates {}

class SearchMealErrorState extends AppStates {}

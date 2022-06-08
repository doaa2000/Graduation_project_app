abstract class VitanicStates {}

class VitanicInitialStates extends VitanicStates {}

class VitanicloadingStates extends VitanicStates {}

class VitanicLoginSuccessStates extends VitanicStates {}

class VitanicErrorStates extends VitanicStates {
  String error;
  VitanicErrorStates(this.error);
}

class VitanicAppChangePasswordVisibility extends VitanicStates {}

class VitanicGetDataSucessesStates extends VitanicStates {}

class VitanicGetDataErrorStates extends VitanicStates {}

class VitanicRefreshStates extends VitanicStates {}

class SocialInitialStates extends VitanicStates {}

class SocialloadingStates extends VitanicStates {}

class SocialLoginSuccessStates extends VitanicStates {
  String uId;
  SocialLoginSuccessStates(this.uId);
}

class SocialLoginErrorStates extends VitanicStates {
  String error;
  SocialLoginErrorStates(this.error);
}

class SocialAppChangePasswordVisibility extends VitanicStates {}

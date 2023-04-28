class ApiEndPoints {
  static final String BASE_URL = "http://localhost:8000/api/v1/";
  static _AuthEndPoints AUTHENDPOINTS = _AuthEndPoints();
}

class _AuthEndPoints {
  final String REGISTER = "subscriber-register";
  final String LOGIN = "subscribe-login-send-otp";
  final String CONFIRM_OTP = "subscribe-login-confirm-otp";
  final String PROFILE = "subscriber/profile";
  final String UPDATE_PROFILE = "subscriber/update";
}

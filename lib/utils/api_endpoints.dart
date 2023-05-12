class ApiEndPoints {
  static final String BASE_URL = "http://localhost:8000/api/v1/";
  static _AuthEndPoints AUTHENDPOINTS = _AuthEndPoints();
  static _ProfileEndPoints PROFILEENDPOINTS = _ProfileEndPoints();
}

class _AuthEndPoints {
  final String REGISTER = "subscriber-register-send-otp";
  final String REGISTER_CONFIRM_OTP = "subscriber-register-confirm-otp";
  final String LOGIN = "subscribe-login-send-otp";
  final String LOGIN_CONFIRM_OTP = "subscribe-login-confirm-otp";
}

class _ProfileEndPoints {
  final String PROFILE = "subscriber/profile";
  final String UPDATE_PROFILE = "subscriber/update";
}

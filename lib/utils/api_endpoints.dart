class BaseUrl {
  static final String BASE_URL = "http://localhost:8000/api/v1/";
  static final String IMAGE_URL = "http://localhost:8000/";
}

class ApiEndPoints {
  static _AuthEndPoints AUTHENDPOINTS = _AuthEndPoints();
  static _ProfileEndPoints PROFILEENDPOINTS = _ProfileEndPoints();
  static _MasterEndPoints MASTERENDPOINTS = _MasterEndPoints();
  static _MySubscribeEndPoints MYSUBSCRIBEENDPOINTS = _MySubscribeEndPoints();
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

class _MasterEndPoints {
  final String MASTER_ALL = "masters/all";
  final String MASTER_FIND_BY_ID = "masters/findById";
  final String MASTER_FIND_BY_SUBSCRIBER = "masters/Subscriber";
  final String MASTER_FIND_BY_NAME = "masters/listBySubscriber";
}

class _MySubscribeEndPoints {
  final String GET_BY_SUBSCRIBER = "subscription/getBySubscriber";
}

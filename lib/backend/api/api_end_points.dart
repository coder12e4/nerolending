class ApiEndpoint {
  static const baseUrl = "http://64.227.147.107/api/";
  // static const baseUrl = "http://tsia.digital/api/";
  static const String login = 'login';
  static const String signUp = 'register';
  static const String verifyEmail = 'verify-email';
  static const String resendSignUpOtp = 'resend-otp';
  static const getAgentList = "getAgentList";
  static const getAgentDetails = "getAgent";
  static const getCategory = "getCategoryList";
  static const getLocationList = "getLocationList";
  static const bookWorker = "addBooking";
  static const getMyRequest = "booking-list";
  static const getUsersDetails = "user";
  static const deteteAccount = "delete-account";
  static const bookingDetails = "booking/";
  static const updateUserDetails = "update-user";
  static const deleteBooking = "calcelBooking";
  static const addRating = "addRating";
  static const changePassword = "change-password";
  static const addDispute = "add-dispute";
  static const forgetPassword = "forgot-password";
  static const updatePayment = "updatePaymentStatus";
  static const getRatingQuestions = "getRatingQuestions";
  static const getNotification = "get-all-notification";
  static const getUnreadedNotification = "get-unread-notification";
  static const getReadedNotification = "read-notification";
}

import 'package:get/get.dart';
import '../../../backend/binding/agent_profile/agent_profile_bindinf.dart';
import '../../../backend/binding/dipute_binding/dispute_binding.dart';
import '../../../backend/binding/edit_profile_binding/edit_profile_binding.dart';
import '../../../backend/binding/filter_screen_binding/filter_screen_binding.dart';
import '../../../backend/binding/login/login_binding.dart';
import '../../../backend/binding/my_request/request_details_binding/request_details_binding.dart';
import '../../../backend/binding/notification/notification_binding.dart';
import '../../../backend/binding/settings_binding/settings_binding.dart';
import '../../../backend/binding/splash/splash_screen.dart';
import '../../../view/home/bottom_nav.dart';
import '../../../view/home/filter_screen/filter_screen.dart';
import '../../../view/login/login_screen.dart';
import '../../../view/my_request/dispute_screen/dispute_screen.dart';
import '../../../view/my_request/rating_screen/rating_screen.dart';
import '../../../view/my_request/request_details/request_details_screen.dart';
import '../../../view/notification/notification_screen.dart';
import '../../../view/profile/edit_profile/edit_profile.dart';
import '../../../view/settings/setting_screen.dart';
import '../../../view/signup/email_varification/email_varification_screen.dart';
import '../../../view/splash_screen/splash_screen.dart';

import '../backend/binding/bottom_navigation/bottom_nav_binding.dart';
import '../backend/binding/rating_screen_binding/rating_screen_binding.dart';
import '../backend/binding/signup/email_varification/email_varification_binding.dart';
import '../backend/binding/signup/sign_up_binding.dart';
import '../view/signup/sign_up.dart';

class AppRouter {
  static const String initial = '/';
  static const String loginRoutes = '/login';
  static const String bottomNavRoutes = '/bottomNav';
  static const String agentProfileRoutes = '/agentProfile';
  static const String signUpRoutes = '/signup';

  static const String bookWorkerRoutes = '/bookWorker';
  static const String filterScreenRoutes = '/filterScreen';
  static const String locationSelectionRoutes = '/locationSelection';
  static const String ratingScreenRoutes = '/ratingScreen';
  static const String disputeScreeRoutes = '/disputeScree';
  static const String editProfileRoutes = '/editProfile';
  static const String emailVerificationSignUpRoutes =
      '/emailVerificationSignUp';
  static const String settingsRoutes = '/settings';
  static const String requestDetailsRoutes = '/requestDetails';
  static const String notificationRoute = '/notificationRoute';

  static String getInitialRoute() => initial;
  static String getLoginRoute() => loginRoutes;
  static String getSignUpRoute() => signUpRoutes;
  static String getBottomNavRoute() => bottomNavRoutes;
  static String getAgentProfileRoute() => agentProfileRoutes;

  static String getBookWorkerRoute() => bookWorkerRoutes;
  static String getFilterScreenRoute() => filterScreenRoutes;
  static String getLocationSelectionRoutesRoute() => locationSelectionRoutes;
  static String getRatingScreenRoute() => ratingScreenRoutes;
  static String getDisputeScreeRoute() => disputeScreeRoutes;
  static String getEditProfileRoute() => editProfileRoutes;
  static String getEmailVerificationSignUpRoute() =>
      emailVerificationSignUpRoutes;
  static String getSettingsRoutes() => settingsRoutes;
  static String getRequestDetailsRoutesRoute() => requestDetailsRoutes;
  static String getNotificationRoute() => notificationRoute;

  static List<GetPage> routes = [
    GetPage(
      name: initial,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: loginRoutes,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
        name: signUpRoutes,
        page: () => const SignUpScreen(),
        binding: SignUpBinding()),
    GetPage(
        name: bottomNavRoutes,
        page: () => const BottomNav(),
        binding: BottomNavBinding()),

    GetPage(
        name: ratingScreenRoutes,
        page: () => const RatingScreen(),
        binding: RatingScreenBinding()),

    GetPage(
        name: filterScreenRoutes,
        page: () => const AgentFilterScreen(),
        binding: FilterScreenBinding()),

    GetPage(
      name: disputeScreeRoutes,
      page: () => const DisputeScreen(),
      binding: DisputeBinding(),
    ),

    GetPage(
        name: editProfileRoutes,
        page: () => const EditProfileScreen(),
        binding: EditProfileBinding()),

    GetPage(
        name: emailVerificationSignUpRoutes,
        page: () => const EmailVerificationScreen(),
        binding: EmailVerificationSignUpBinding()),
    GetPage(
        name: settingsRoutes,
        page: () => const SettingsScreen(),
        binding: SettingsBinding()),
    GetPage(
      name: requestDetailsRoutes,
      page: () => const RequestDetailsScreen(),
      binding: RequestDetailsBinding(),
    ),
//
    GetPage(
      name: notificationRoute,
      page: () => const NotificationScreen(),
      binding: NotificationBinding(),
    ),

//     GetPage(
//       name: notificationPollRoutes,
//       page: () => const VoteViewScreen(),
//       binding: SuretyViewBinding(),
//     ),
//     GetPage(
//         name: profileLoanDetailsRoutes,
//         page: () => const ActiveLoanDetailsScreen(),
//         binding: ProfileLoanDataBinding()),
//
  ];
}

// import 'package:rtd_project/backend/api/api.dart';
// import 'package:rtd_project/backend/parser/authentication/login_parser.dart';
// import 'package:rtd_project/backend/parser/authentication/sighnup_parser.dart';
// import 'package:rtd_project/backend/parser/book/service_member_parser.dart';
// import 'package:rtd_project/backend/parser/elected_member_parser.dart';
// import 'package:rtd_project/backend/parser/home_parser.dart';
// import 'package:rtd_project/backend/parser/loan/loan_edit_parser.dart';
// import 'package:rtd_project/backend/parser/notification/notification_parser.dart';
// import 'package:rtd_project/backend/parser/profile/profile_parser.dart';
// import 'package:rtd_project/backend/parser/search_parser.dart';
// import 'package:rtd_project/core/constraints/api_urls.dart';
// import 'package:rtd_project/helper/shared_pref.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../backend/parser/book/books_parser.dart';
// import '../backend/parser/bottom_navigation_parser.dart';
// import '../backend/parser/loan/loan_details_parser.dart';
// import '../backend/parser/loan/loan_screen_parser.dart';
// import '../backend/parser/profile/edit_profile_parser.dart';
// import '../backend/parser/splash_screen_parser.dart';
// import '../backend/parser/wall_screen_parser.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../backend/api/api.dart';
import '../../../backend/parser/agent_profile/agent_profile_parser.dart';
import '../../../backend/parser/edit_profile_parser/edit_profile_parser.dart';
import '../../../backend/parser/home/home_parser.dart';
import '../../../backend/parser/login/login_parser.dart';
import '../../../backend/parser/my_request/my_request_parser.dart';
import '../../../backend/parser/my_request/request_deatils_parser/request_deatils.dart';
import '../../../backend/parser/notification/notification_parser.dart';
import '../../../backend/parser/profile_parser/profile_parser.dart';
import '../../../backend/parser/signup/sign_up_parser.dart';
import '../../../helper/shared_pref.dart';

import '../backend/binding/connectivity_binding/connectivity.dart';
import '../backend/parser/book_worker/book_worker_parser.dart';
import '../backend/parser/dispute_parser/dispute_parser.dart';
import '../backend/parser/filter_screen_parser/filter_screen_parser.dart';
import '../backend/parser/loacation_selection_parser/location_selection_parser.dart';
import '../backend/parser/rating_screen_parser/rating_screen_parser.dart';
import '../backend/parser/settings_parser/settings.dart';
import '../backend/parser/signup/email_varification_parser/email_varification_parser.dart';
import '../backend/parser/splash/splash_screen.dart';

class MainBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    final sharedPref = await SharedPreferences.getInstance();
    Get.put(
      SharedPreferencesManager(sharedPreferences: sharedPref),
      permanent: true,
    );
//
    Get.lazyPut(() => ApiService(appBaseUrl: ''));
//
    Get.lazyPut(() => SplashScreenParser(sharedPreferencesManager: Get.find()),
        fenix: true);
    Get.lazyPut(() => ConnectivityBinding(), fenix: true);
    Get.lazyPut(
        () => LoginParser(
            apiService: Get.find(), sharedPreferencesManager: Get.find()),
        fenix: true);

    Get.lazyPut(
      () => SignUpParser(
          apiService: Get.find(), sharedPreferencesManager: Get.find()),
    );
    Get.lazyPut(
        () => HomeParser(
            apiService: Get.find(), sharedPreferencesManager: Get.find()),
        fenix: true);
    Get.lazyPut(
        () => AgentProfileParser(
            apiService: Get.find(), sharedPreferencesManager: Get.find()),
        fenix: true);

    Get.lazyPut(
        () => BookWorkerParser(
            sharedPreferencesManager: Get.find(), apiService: Get.find()),
        fenix: true);
    Get.lazyPut(
        () => FilterScreenParser(
            apiService: Get.find(), sharedPreferencesManager: Get.find()),
        fenix: true);

    Get.lazyPut(
        () => LocationSelectionParser(
            apiService: Get.find(), sharedPreferencesManager: Get.find()),
        fenix: true);

    Get.lazyPut(
        () => MyRequestParser(
            apiService: Get.find(), sharedPreferencesManager: Get.find()),
        fenix: true);

    Get.lazyPut(
        () => RatingScreenParser(
            apiService: Get.find(), sharedPreferencesManager: Get.find()),
        fenix: true);

    Get.lazyPut(
        () => DisputeParser(
            apiService: Get.find(), sharedPreferencesManager: Get.find()),
        fenix: true);

    Get.lazyPut(
        () => ProfileParser(
            apiService: Get.find(), sharedPreferencesManager: Get.find()),
        fenix: true);
    Get.lazyPut(
        () => EditProfileParser(
            apiService: Get.find(), sharedPreferencesManager: Get.find()),
        fenix: true);
    Get.lazyPut(
        () => EmailVerificationSignUpParser(
            apiService: Get.find(), sharedPreferencesManager: Get.find()),
        fenix: true);

    Get.lazyPut(
        () => SettingsParser(
            apiService: Get.find(), sharedPreferencesManager: Get.find()),
        fenix: true);

    Get.lazyPut(
        () => RequestDetailsParser(
            apiService: Get.find(), sharedPreferencesManager: Get.find()),
        fenix: true);
//
    Get.lazyPut(
        () => NotificationParser(
            apiService: Get.find(), sharedPreferencesManager: Get.find()),
        fenix: true);

// Get.lazyPut(
//     () => StylistCategoriesParser(
//         apiService: Get.find(), sharedPreferencesManager: Get.find()),
//     fenix: true);

//   Get.lazyPut(
//       () => ProfileCategoriesParse(
//           apiService: Get.find(), sharedPreferencesManager: Get.find()),
//       fenix: true);

//   Get.lazyPut(
//       () => GallaryParser(
//           apiService: Get.find(), sharedPreferencesManager: Get.find()),
//       fenix: true);

//   Get.lazyPut(
//       () => ReviewParser(
//           apiService: Get.find(), sharedPreferencesManager: Get.find()),
//       fenix: true);

//   Get.lazyPut(
//       () => LanguagesParser(
//           apiService: Get.find(), sharedPreferencesManager: Get.find()),
//       fenix: true);

//   Get.lazyPut(
//       () => ContactUsParser(
//           apiService: Get.find(), sharedPreferencesManager: Get.find()),
//       fenix: true);

//   Get.lazyPut(
//       () => AppPagesParser(
//           apiService: Get.find(), sharedPreferencesManager: Get.find()),
//       fenix: true);

//   Get.lazyPut(
//       () => PackagesParser(
//           apiService: Get.find(), sharedPreferencesManager: Get.find()),
//       fenix: true);

//   Get.lazyPut(
//       () => AddPackagesParser(
//           apiService: Get.find(), sharedPreferencesManager: Get.find()),
//       fenix: true);

//   Get.lazyPut(
//       () => PackagesCategoriesParser(
//           apiService: Get.find(), sharedPreferencesManager: Get.find()),
//       fenix: true);

//   Get.lazyPut(
//       () => ProductsParser(
//           apiService: Get.find(), sharedPreferencesManager: Get.find()),
//       fenix: true);

//   Get.lazyPut(
//       () => CreateProductsParser(
//           apiService: Get.find(), sharedPreferencesManager: Get.find()),
//       fenix: true);

//   Get.lazyPut(
//       () => ShopCategoriesParser(
//           apiService: Get.find(), sharedPreferencesManager: Get.find()),
//       fenix: true);

//   Get.lazyPut(
//       () => ShopSubCategoriesParser(
//           apiService: Get.find(), sharedPreferencesManager: Get.find()),
//       fenix: true);

//   Get.lazyPut(
//       () => SalonCategoriesParser(
//           apiService: Get.find(), sharedPreferencesManager: Get.find()),
//       fenix: true);

//   Get.lazyPut(
//       () => CitiesCategoriesParser(
//           apiService: Get.find(), sharedPreferencesManager: Get.find()),
//       fenix: true);

//   Get.lazyPut(
//       () => AddTimingParser(
//           apiService: Get.find(), sharedPreferencesManager: Get.find()),
//       fenix: true);

//   Get.lazyPut(
//       () => SlotParser(
//           apiService: Get.find(), sharedPreferencesManager: Get.find()),
//       fenix: true);

//   Get.lazyPut(
//       () => AddSlotParser(
//           apiService: Get.find(), sharedPreferencesManager: Get.find()),
//       fenix: true);

//   Get.lazyPut(
//       () => AddServicesParser(
//           apiService: Get.find(), sharedPreferencesManager: Get.find()),
//       fenix: true);

//   Get.lazyPut(
//       () => ServicesParser(
//           apiService: Get.find(), sharedPreferencesManager: Get.find()),
//       fenix: true);

//   Get.lazyPut(
//       () => ServicesCategorisParser(
//           apiService: Get.find(), sharedPreferencesManager: Get.find()),
//       fenix: true);

//   Get.lazyPut(
//       () => PackagesSpecialistParser(
//           apiService: Get.find(), sharedPreferencesManager: Get.find()),
//       fenix: true);

//   Get.lazyPut(
//       () => IndividualProfileParser(
//           apiService: Get.find(), sharedPreferencesManager: Get.find()),
//       fenix: true);

//   Get.lazyPut(
//       () => IndividualProfileCategoriesParser(
//           apiService: Get.find(), sharedPreferencesManager: Get.find()),
//       fenix: true);

//   Get.lazyPut(
//       () => IndividualCitiesParser(
//           apiService: Get.find(), sharedPreferencesManager: Get.find()),
//       fenix: true);
  }
}

import 'package:deluxe_hospital_sm/presentation/deshboard/deshboard_screen.dart';
import 'package:flutter/material.dart';
import '../../../export_dulex.dart';
import '../../patient_screens/pay_for_someone/pay_for_someone_screen.dart';

class CustomRouteGenerator {
  CustomRouteGenerator._();

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case CustomRouteNames.kBookDetailScreenRoute:
      //   final argument = settings.arguments as BookDetailPageArgumentModel;
      //   BookModel temp = BookModel.empty();
      //   if (argument.argumentIsBookModel) {
      //     temp = argument.bookModel;
      //   } else {
      //     temp.bookId = argument.resumeBookModel.bookId;
      //     temp.coverImageUrl = argument.resumeBookModel.coverImageUrl;
      //   }
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return BlocProvider<BookDetailsBloc>(
      //         create: (context) => BookDetailsBloc(),
      //         child: BookDetailsPage(
      //           book: temp,
      //         ),
      //       );
      //     },
      //   );
      case CustomRouteNames.kInitialRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const SplashScreen();
          },
        );
      case CustomRouteNames.kChooseAccountScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return ChooseAccountScreen();
          },
        );

      case CustomRouteNames.kLoginScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const SignInScreen();
          },
        );

      case CustomRouteNames.kSignUpScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const SignUpScreen();
          },
        );
      case CustomRouteNames.kOtpVerificationScreenRoute:
        OtpScreenArgumentModel argumentModel =
            settings.arguments as OtpScreenArgumentModel;
        // final String email = settings.arguments as String;
        // final bool isForgotPw = settings.arguments as bool;

        return MaterialPageRoute(
          builder: (context) {
            return OtpCodeVerificationScreen(
                email: argumentModel.email, //email,
                isForgotPassword: argumentModel.isForgotPwPage //isForgotPw,
                );
          },
        );
      case CustomRouteNames.kPersonalInformationScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const PersonalInformationScreen();
          },
        );
      case CustomRouteNames.kMedicalDetailsScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const MedicalDetailsScreen();
          },
        );
      case CustomRouteNames.kProfilePictureSetupScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const ProfilePictureSetup();
          },
        );
      case CustomRouteNames.kFingerPrintSetupScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const FingerPrintSetupScreen();
          },
        );
      case CustomRouteNames.kFaceIdSetupScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return FaceIdSetupScreen();
          },
        );

      case CustomRouteNames.kForgotPasswordScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return ForgotPasswordScreen();
          },
        );
      case CustomRouteNames.kCreateNewPasswordScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return CreateNewPasswordScreen();
          },
        );

      case CustomRouteNames.kDashboardScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return DashboardScreen();
          },
        );

      case CustomRouteNames.kProfessionalInformationScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const ProfessionalInformationScreen();
          },
        );

      case CustomRouteNames.kEditProfileScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const EditProfileScreen();
          },
        );
      case CustomRouteNames.kNotificationsScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return NotificationsScreen();
          },
        );
      case CustomRouteNames.kPayForSomeOneScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const PayForSomeOneScreen();
          },
        );
      case CustomRouteNames.kPayForSomeOneTwoScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const PayForSomeOneTwoScreen();
          },
        );
      case CustomRouteNames.kSubAccountScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return SubAccountScreen();
          },
        );
      case CustomRouteNames.kPaymentsScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return PaymentsScreen();
          },
        );

      case CustomRouteNames.kHomeNotificationsScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return HomeNotificationsScreen();
          },
        );
      case CustomRouteNames.kSearchFilterScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return SearchFilterScreen();
          },
        );

      case CustomRouteNames.kSearchResultScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return SearchResultScreen();
          },
        );
      case CustomRouteNames.kDoctorProfileScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return DoctorProfileScreen();
          },
        );
      case CustomRouteNames.kBookAppointmentScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const BookAppointmentScreen();
          },
        );
      case CustomRouteNames.kPatientDetailsScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const PatientDetailsScreen();
          },
        );
      case CustomRouteNames.kGiveMeDiscountScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return GiveMeDiscountScreen();
          },
        );

        case CustomRouteNames.kPaymentSetupScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const PaymentSetupScreen();
          },
        );
        case CustomRouteNames.kReviewSummaryScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const ReviewSummaryScreen();
          },
        );
        case CustomRouteNames.kScheduledAppointmentScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const ScheduledAppointmentScreen();
          },
        );

      default:
        return null;
    }
  }
}

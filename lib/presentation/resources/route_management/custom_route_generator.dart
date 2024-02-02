import 'package:deluxe_hospital_sm/presentation/resources/route_management/export_route_management.dart';
import 'package:flutter/material.dart';
import '../../export_presentation.dart';


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
            return
              const SplashScreen();

          },
        );
      case CustomRouteNames.kChooseAccountScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const ChooseAccountScreen();
          },
        );


        case CustomRouteNames.kLoginScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return   SignInScreen();
          },
        );case CustomRouteNames.kSignUpScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return   SignUpScreen();
          },
        );
      // case CustomRouteNames.kForgotPasswordScreenRoute:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return BlocProvider<ForgotPasswordCubit>(
      //         create: (context) => ForgotPasswordCubit(),
      //         child: const ForGotPasswordPage(),
      //       );
      //     },
      //   );
      // case CustomRouteNames.kOTPScreenRoute:
      //   final String email = settings.arguments as String;
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return BlocProvider<VerifyOtpCubit>(
      //         create: (context) => VerifyOtpCubit(),
      //         child: OtpScreen(
      //           email: email,
      //         ),
      //       );
      //     },
      //   );
      // case CustomRouteNames.kResetPasswordScreenRoute:
      //   final String email = settings.arguments as String;
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return BlocProvider<ResetPasswordCubit>(
      //         create: (context) => ResetPasswordCubit(),
      //         child: ResetPasswordPage(email: email),
      //       );
      //     },
      //   );
      // case CustomRouteNames.kGenreBuilderScreenRoute:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return BlocProvider<SaveGenreBloc>(
      //         create: (context) => SaveGenreBloc(),
      //         child: const ChooseGenrePage(),
      //       );
      //     },
      //   );
      // case CustomRouteNames.kHomeScreenRoute:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return const HomePage();
      //     },
      //   );
      // case CustomRouteNames.kDashboardScreenRoute:
      //   return MaterialPageRoute(builder: (context) {
      //     return MultiBlocProvider(
      //       providers: [
      //         BlocProvider(
      //           create: (context) => HomeBloc(),
      //         ),
      //         BlocProvider(
      //           create: (context) => MyListCubit(),
      //         ),
      //         BlocProvider(
      //           create: (context) => CategoryCubit(),
      //         ),
      //       ],
      //       child: const DashBoard(),
      //     );
      //   });
      // case CustomRouteNames.kAllBookPageScreenRoute:
      //   ABPArgumentModel argumentModel = settings.arguments as ABPArgumentModel;
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return AllBooksPage(
      //         title: argumentModel.title,
      //         books: argumentModel.books,
      //         recentViewedBooks: argumentModel.recentBooks,
      //       );
      //     },
      //   );

      // case CustomRouteNames.kSubCategoryScreenRoute:
      //   SubCategoryArgModel argumentModel =
      //       settings.arguments as SubCategoryArgModel;
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return BlocProvider<SubCategoryBloc>(
      //           create: (context) => SubCategoryBloc(),
      //           child: SubCategoriesPage(
      //             id: argumentModel.id,
      //             title: argumentModel.title,
      //           ));
      //     },
      //   );
      // case CustomRouteNames.kVideoPlayerScreenRoute:
      //   // VideoScreenArgumentModel argumentModel =
      //   //     settings.arguments as VideoScreenArgumentModel;
      //   BookModel? bookModel = settings.arguments as BookModel?;
      //
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return VideoPlayerPage(
      //         bookModel: bookModel,
      //        // videoScreenArgumentModel: argumentModel,
      //       );
      //     },
      //   );
      // case CustomRouteNames.kUserSettingScreenRoute:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return BlocProvider(
      //         create: (context) => UserSettingCubit(),
      //         child: const UserSettingsScreen(),
      //       );
      //     },
      //   );
      // case CustomRouteNames.kAuthorScreenRoute:
      //   AuthorScreenArgumentModel argumentModel =
      //       settings.arguments as AuthorScreenArgumentModel;
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return BlocProvider(
      //         create: (context) => AuthorCubit(),
      //         child: AuthorScreen(
      //           argument: argumentModel,
      //         ),
      //       );
      //     },
      //   );
      default:
        return null;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:shark_mobile/core/routing/routes.dart';
import 'package:shark_mobile/features/onboaring/presentation/views/onboarding_view.dart';

class AppRouter {
  Route? generateRoutes(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      // case Routes.loginScreen:
      //   //متنساش ال <>.
      //   return MaterialPageRoute(
      //     builder:
      //         (_) => BlocProvider<LoginCubit>(
      //           create: (context) => getIt<LoginCubit>(),
      //           child: const LoginSceen(),
      //         ),
      //   );
      // case Routes.registerScreen:
      //   return MaterialPageRoute(
      //     builder:
      //         (_) => BlocProvider<RegisterCubit>(
      //           create: (context) => getIt<RegisterCubit>(),
      //           child: const RegisterScreen(),
      //         ),
      //   );
      // case Routes.homeScreen:
      //   return MaterialPageRoute(
      //     builder:
      //         (_) => BlocProvider(
      //           create:
      //               (context) => HomeCubit(
      //                 getIt(),
      //               )..getSpecialization(), // ركز هنا انا هنا مسجلتش ال HomeCubit فى ال Di  وعملت كد
      //           child: const HomeScreen(),

      //           //
      //         ),
      //   );
      default:
        return null;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shark_mobile/core/di/dependancy_injection.dart';
import 'package:shark_mobile/core/routing/routes.dart';
import 'package:shark_mobile/features/auth/logic/register_cubit.dart';
import 'package:shark_mobile/features/auth/presentation/views/register_view.dart';
import 'package:shark_mobile/features/home/data/model/service_model.dart';
import 'package:shark_mobile/features/home/logic/cubit/home_cubit.dart';
import 'package:shark_mobile/features/home/presentation/views/contact_us_view.dart';
import 'package:shark_mobile/features/home/presentation/views/home_view.dart';
import 'package:shark_mobile/features/home/presentation/views/news_details_view.dart';
import 'package:shark_mobile/features/home/presentation/views/our_clients_view.dart';
import 'package:shark_mobile/features/home/presentation/views/service_details_view.dart';
import 'package:shark_mobile/features/onboaring/presentation/views/onboarding_view.dart';

class AppRouter {
  Route? generateRoutes(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingView());

      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<RegisterCubit>(),
            child: const RegisterView(),
          ),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<RegisterCubit>(),
            child: const RegisterView(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<HomeCubit>(),
            child: const HomeView(),
          ),
        );

      case Routes.serviceDetailsView:
        if (arguments is! ServiceModel) {
          throw ArgumentError(
            'ServiceModel argument required for ServiceDetailsView',
          );
        }
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<HomeCubit>(),
            child: ServiceDetailsView(service: arguments),
          ),
        );

      case Routes.ourClientsView:
        return MaterialPageRoute(
          builder: (_) {
            final homeCubit = getIt<HomeCubit>();
            return BlocProvider.value(
              value: homeCubit,
              child: OurClientsView(homeCubit: homeCubit),
            );
          },
        );

      case Routes.newsDetailsView:
        final news = settings.arguments as Map<String, String>;
        return MaterialPageRoute(builder: (_) => NewsDetailsView(news: news));
      case Routes.contactUsView:
        return MaterialPageRoute(builder: (_) => ContactUsView());
      default:
        return null;
    }
  }
}

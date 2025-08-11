import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shark_mobile/core/di/dependancy_injection.dart';
import 'package:shark_mobile/core/routing/routes.dart';
import 'package:shark_mobile/features/home/data/model/service_model.dart';
import 'package:shark_mobile/features/home/logic/cubit/home_cubit.dart';
import 'package:shark_mobile/features/home/presentation/views/home_view.dart';
import 'package:shark_mobile/features/home/presentation/views/service_details_view.dart';
import 'package:shark_mobile/features/home/presentation/widgets/our_clients_list_view.dart';
import 'package:shark_mobile/features/onboaring/presentation/views/onboarding_view.dart';

class AppRouter {
  Route? generateRoutes(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
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
              child: OurClientsListView(homeCubit: homeCubit),
            );
          },
        );

      default:
        return null;
    }
  }
}

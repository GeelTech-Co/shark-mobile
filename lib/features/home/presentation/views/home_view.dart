import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shark_mobile/features/home/logic/cubit/home_cubit.dart';
import 'package:shark_mobile/features/home/logic/cubit/home_state.dart';
import 'package:shark_mobile/features/home/presentation/widgets/all_tab.dart';
import 'package:shark_mobile/features/home/presentation/widgets/careers_tab.dart';
import 'package:shark_mobile/features/home/presentation/widgets/gallery_tab.dart';
import 'package:shark_mobile/features/home/presentation/widgets/home_app_bar.dart';
import 'package:shark_mobile/features/home/presentation/widgets/home_tab.dart';
import 'package:shark_mobile/features/home/presentation/widgets/services/services_list_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  final List<String> languages = ['English', 'العربيه'];
  String selectedLanguage = 'English';
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        context.read<HomeCubit>().changeSelectedIndex(_tabController.index);
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onLanguageChanged(String value) {
    setState(() {
      selectedLanguage = value;
      context.setLocale(
        value == 'English' ? const Locale('en') : const Locale('ar'),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();
        return Scaffold(
          appBar: HomeAppBar(
            tabController: _tabController,
            selectedLanguage: selectedLanguage,
            onLanguageChanged: _onLanguageChanged,
          ),
          body: TabBarView(
            controller: _tabController,
            physics: const BouncingScrollPhysics(),
            children: [
              AllTab(tabController: _tabController),

              HomeTab(controller: _tabController),
              ServicesListView(
                services: cubit.dummyServices,
                title: 'security_services'.tr(),
              ),
              CareersTab(),
              GalleryTab(),
            ],
          ),
        );
      },
    );
  }
}

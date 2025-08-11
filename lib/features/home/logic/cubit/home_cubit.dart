// home_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shark_mobile/features/home/data/model/service_model.dart';
import 'package:shark_mobile/features/home/logic/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());

  // home_cubit.dart
  final List<Map<String, String>> newsList = [
    {
      'title': 'New Security Cameras Installed in City',
      'image': 'https://images.unsplash.com/photo-1504384308090-c894fdcc538d',
    },
    {
      'title': 'Our Guards Successfully Prevent Incident',
      'image': 'https://images.unsplash.com/photo-1454165804606-c3d57bc86b40',
    },
    {
      'title': 'Company Expands to New Branches',
      'image':
          'https://plus.unsplash.com/premium_photo-1682141713992-b54999985c32',
    },
  ];

  final List<Map<String, String>> clients = [
    {
      'name': 'freepik',
      'logo':
          'https://cdn.dribbble.com/userupload/16238757/file/original-e5bd6a8ae9d75e336f10f8d65e875b4c.png?resize=1024x768&vertical=center',
    },
    {
      'name': 'bookstore',
      'logo':
          'https://cdn.dribbble.com/userupload/42897377/file/original-68529fe552bbdd0d1a68d455ec4579fd.png?resize=812x591&vertical=center',
    },
    {
      'name': 'flat',
      'logo':
          'https://cdn.dribbble.com/userupload/21048988/file/original-50e6be98ccffd6a52455854b9d232033.png?resize=812x591&vertical=center',
    },
  ];

  final List<ServiceModel> dummyServices = [
    ServiceModel(
      imageUrl: 'https://images.unsplash.com/photo-1454165804606-c3d57bc86b40',
      title: 'Static Security Guards',
      description:
          'Providing 24/7 static security services at vital locations.',
    ),
    ServiceModel(
      imageUrl:
          'https://plus.unsplash.com/premium_photo-1682141713992-b54999985c32',
      title: 'Mounted Security Patrols',
      description: 'Coverage for large areas beyond static services.',
    ),
    ServiceModel(
      imageUrl: 'https://images.unsplash.com/photo-1504384308090-c894fdcc538d',
      title: 'Camera Monitoring',
      description: 'Professional surveillance using high-quality cameras.',
    ),
    ServiceModel(
      imageUrl:
          'https://plus.unsplash.com/premium_photo-1682148026899-d21f17c04e80',
      title: 'Access Control',
      description: 'Implementation of security policies for restricted areas.',
    ),
  ];

  final List<String> languages = ['English', 'العربيه'];
  String selectedLanguage = 'English';
  final List<String> titles = ['all', 'home', 'services'];
  int selectedIndex = 0;

  // change List index
  void changeSelectedIndex(int index) {
    selectedIndex = index;
    emit(HomeState.changeIndex(selectedIndex));
  }
}

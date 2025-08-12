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
      'description': '''
In an effort to enhance public safety and monitor critical areas effectively, our company has installed cutting-edge security cameras across multiple locations in the city. These cameras feature advanced motion detection, night vision, and real-time remote monitoring capabilities, providing law enforcement and security personnel with invaluable tools to respond quickly to incidents. The initiative is part of our ongoing commitment to leveraging technology to create safer environments for residents, businesses, and visitors alike. We continuously evaluate and upgrade our systems to maintain the highest standards of security and surveillance.
''',
    },
    {
      'title': 'Our Guards Successfully Prevent Incident',
      'image': 'https://images.unsplash.com/photo-1454165804606-c3d57bc86b40',
      'description': '''
Our dedicated team of professional security guards recently played a critical role in averting a potentially dangerous situation at one of our client’s facilities. Through constant vigilance, quick decision-making, and effective communication, they were able to detect suspicious activity early and neutralize the threat before it escalated. This incident highlights the importance of having well-trained security personnel who are committed to protecting people and property. We pride ourselves on maintaining rigorous training programs and protocols to ensure our guards are always prepared to handle any security challenge efficiently and effectively.
''',
    },
    {
      'title': 'Company Expands to New Branches',
      'image':
          'https://plus.unsplash.com/premium_photo-1682141713992-b54999985c32',
      'description': '''
We are thrilled to announce the expansion of our company with the opening of several new branches across key cities in the region. This strategic growth allows us to broaden our reach and enhance the quality of services offered to our valued clients. Each new branch is staffed with highly skilled professionals dedicated to upholding our standards of excellence in security solutions. As we continue to grow, we remain committed to innovation, customer satisfaction, and community engagement, ensuring that our clients receive unparalleled protection and support wherever they are located.
''',
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

  final List<Map<String, String>> certificates = [
    {
      'title': 'ISO 9001 Certificate',
      'image':
          'https://res.cloudinary.com/certifier/image/upload/v1726573155/how_to_create_digital_certificate_Certifier_blog_completion_7478ee0283.png',
    },
    {
      'title': 'Company Classification Certificate',
      'image':
          'https://res.cloudinary.com/certifier/image/upload/v1726573155/how_to_create_digital_certificate_Certifier_blog_achievement_439fa6d0da.png',
    },
    {
      'title': 'Al Suqoor Academy Appreciation',
      'image':
          'https://cdn.prod.website-files.com/661b25aa8bda4a590a431922/6663248fa5dae72fca630723_61097b2801194a8d2968bf56_Example-Digital-Credential.png',
    },
    {
      'title': 'Customer Appreciation Certificate',
      'image':
          'https://cdn.prod.website-files.com/661b25aa8bda4a590a431922/6663248fa5dae72fca630708_61097af8161fd516096659a2_Example-Credential.jpeg',
    },
  ];

  final List<String> languages = ['English', 'العربيه'];
  String selectedLanguage = 'English';
  final List<String> titles = ['all', 'home', 'services', 'careers','galary'];
  int selectedIndex = 0;

  // change List index
  void changeSelectedIndex(int index) {
    selectedIndex = index;
    emit(HomeState.changeIndex(selectedIndex));
  }
}

import 'package:flutter/material.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingItem> _onboardingItems = [
    OnboardingItem(
      title: 'Comienza tu experiencia Resourcify aquí',
      subtitle: 'Monitorea y ahorra energía en tu hogar.',
      image: 'assets/renewable-energy.png',
    ),
    OnboardingItem(
      title: 'Obten reportes personalizados y alertas de alto consumo',
      subtitle: 'No olvides activar las notificaciones.',
      image: 'assets/green-leaf.png', 
    ),
    OnboardingItem(
      title: 'Recibe recomendaciones de ahorro de energía y unete a la red de usuarios en Resourcify',
      subtitle: 'Comparte tu experiencia y aprende de otros usuarios.',
      image: 'assets/green-energy.png', 
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDAE49),
      body: Stack(
        
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _onboardingItems.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              return OnboardingItemWidget(_onboardingItems[index]);
            },
          ),
          Positioned(
            bottom: 20.0,
            left: 20.0,
            right: 20.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentPage != 0)
                  ElevatedButton(
                    onPressed: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                    child: const Text('Anterior'),
                  ),
                ElevatedButton(
                  onPressed: () {
                    if (_currentPage == _onboardingItems.length - 1) {
                      // Handle navigation to the next screen after onboarding
                      // e.g., navigate to the home screen or login page.
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    }
                  },
                  child: Text(_currentPage == _onboardingItems.length - 1
                      ? 'Comenzar'
                      : 'Siguiente'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingItem {
  final String title;
  final String subtitle;
  final String image;

  OnboardingItem({
    required this.title,
    required this.subtitle,
    required this.image,
  });
}

class OnboardingItemWidget extends StatelessWidget {
  final OnboardingItem item;

  const OnboardingItemWidget(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          item.image,
          height: 250.0,
        ),
        const SizedBox(height: 40.0),
        Text(
          item.title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold,),
        ),
        const SizedBox(height: 20.0),
        Text(
          item.subtitle,
          
          style: const TextStyle(fontSize: 16.0),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
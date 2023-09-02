import 'package:flutter/material.dart';
import 'package:flutter_application_1/user-company.dart';
import 'package:dots_indicator/dots_indicator.dart'; // Importa el paquete para los puntos de progreso

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

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
      title: 'Recibe recomendaciones de ahorro de energía y únete a la red de usuarios en Resourcify',
      subtitle: 'Comparte tu experiencia y aprende de otros usuarios.',
      image: 'assets/green-energy.png', 
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Color.fromARGB(255, 199, 14, 14), Color.fromARGB(255, 247, 201, 76)],
            stops: [0, 1],
            begin: AlignmentDirectional(0.87, -1),
            end: AlignmentDirectional(-0.87, 1),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
              child: Column(
                children: [
                  DotsIndicator(
                    dotsCount: _onboardingItems.length, // Cantidad de puntos igual a la cantidad de elementos en _onboardingItems
                    position: _currentPage, // Posición actual
                    decorator: const DotsDecorator(
                      color: Color.fromARGB(255, 185, 185, 185), // Color de los puntos inactivos
                      activeColor: Colors.blue, // Color del punto activo
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
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
                      Container(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: ElevatedButton(
                          onPressed: () {
                            if (_currentPage == _onboardingItems.length - 1) {
                              Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (context) => const UserCompanyPage(), 
                              ));
                            } else {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            }
                          },
                          child: Text(_currentPage == _onboardingItems.length - 1 ? 'Comenzar' : 'Siguiente'),
                          ),
                        ),  
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
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

  const OnboardingItemWidget(this.item, {Key? key}) : super(key: key);

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
import 'package:flutter/material.dart';
import 'package:sensia/pages/authentication/Login.dart';
import '../utils/styles.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {

  final PageController _controller = PageController();
  late AnimationController rotationController;
  int currentIndex = 0;

  final List<OnboardingData> pages = [
    OnboardingData(
      icon: "assets/images/brain.png",
      title: "Welcome to Sensia",
      subtitle: "Your emotional wellness companion that understands you",
    ),
    OnboardingData(
      icon: "assets/images/heart.png",
      title: "Track Your Journey",
      subtitle: "Journal your emotions and discover patterns in your well-being",
    ),
    OnboardingData(
      icon: "assets/images/plus.png",
      title: "Grow Together",
      subtitle:
      "Get personalized insights and mindfulness practices tailored for you",
    ),
  ];

  @override
  void initState() {
    super.initState();

    rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  @override
  void dispose() {
    rotationController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
          const SizedBox(height: 50),

          // logo
          Image.asset("assets/images/logo.png", height: 50),

          const SizedBox(height: 20),

          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: pages.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return buildPage(pages[index]);
              },
            ),
          ),

          buildIndicators(),

          const SizedBox(height: 30),

          buildButton(),

          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget buildPage(OnboardingData data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Rotating Icon inside gradient circle
        RotationTransition(
          turns: rotationController,
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Colors.blue.shade300,
                  Colors.pink.shade300,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Image.asset(
                data.icon,
                height: 70,
                color: Colors.white,
              ),
            ),
          ),
        ),

        const SizedBox(height: 30),

        Text(
          data.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 10),

        Text(
          data.subtitle,
          style: const TextStyle(fontSize: 16, color: Colors.black54),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget buildIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pages.length,
            (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          height: 10,
          width: currentIndex == index ? 25 : 10,
          decoration: BoxDecoration(
            color: currentIndex == index
                ? const Color(0xFFB49BFF)
                : const Color(0xFFD8CFFF),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  Widget buildButton() {
    bool last = (currentIndex == pages.length - 1);

    return GestureDetector(
      onTap: () {
        if (!last) {
          _controller.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        } else {
          // Navigate to Login screen and replace onboarding
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const LoginScreen()),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
        decoration: BoxDecoration(
          color: const Color(0xFFB49BFF),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          last ? "Get Started" : "Continue",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

class OnboardingData {
  final String icon;
  final String title;
  final String subtitle;

  OnboardingData({
    required this.icon,
    required this.title,
    required this.subtitle,
  });
}

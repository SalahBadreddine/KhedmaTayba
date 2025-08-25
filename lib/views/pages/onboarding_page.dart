import 'package:flutter/material.dart';
import 'package:food_delivery/views/pages/login_page.dart';
import 'package:food_delivery/views/widgets/onboarding_card.dart';
import 'package:food_delivery/views/widgets/orange_button_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> onboardingPages = [
    OnboardingCard(
      title: "All your favorites",
      description:
          "Get all your loved foods in one once place, you just place the orer we do the rest",
      image: "assets/images/onboarding1.png",
    ),
    OnboardingCard(
      title: "Order from choosen chef",
      description:
          "Handpicked meals made just for you — choose your chef, we’ll bring their flavors to your table",
      image: "assets/images/onboarding2.png",
    ),
    OnboardingCard(
      title: "Free delivery offers",
      description:
          "Delicious food, delivered with no extra cost — enjoy your meals without worrying about fees",
      image: "assets/images/onboarding3.png",
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    });
  }

  void onPressed() {
    if (_currentPage < onboardingPages.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      // TODO: goes to sign-in / log-in
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return LoginPage();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 30),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                children: onboardingPages,
              ),
            ),
            SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              effect: WormEffect(),
              onDotClicked: (index) {
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
            ),
            SizedBox(height: 50),
            OrangeButtonWidget(
              onPressed: onPressed,
              buttontext: _currentPage < onboardingPages.length - 1
                  ? "Next"
                  : "Get Started",
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginPage();
                    },
                  ),
                );
              },
              child: Text("Skip", style: TextStyle(color: Color(0xFF646982))),
            ),
          ],
        ),
      ),
    );
  }
}

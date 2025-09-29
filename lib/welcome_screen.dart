import 'package:flutter/material.dart';
import 'login_form.dart'; // reuse your existing login screen
import 'signup.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    // Auto scroll images
    Future.delayed(const Duration(seconds: 3), _autoScroll);
  }

  void _autoScroll() {
    if (_pageController.hasClients) {
      _currentPage = (_currentPage + 1) % 2; // we have 2 images
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      Future.delayed(const Duration(seconds: 3), _autoScroll);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Shopping App",
          style: TextStyle(
            fontFamily: 'Font',
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image slider with background
            Container(
              height: 400,
              decoration: BoxDecoration(
                color: const Color.fromARGB(
                  255,
                  102,
                  25,
                  219,
                ), // light background
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: PageView(
                controller: _pageController,
                children: [
                  Image.asset("assets/photo.png", fit: BoxFit.cover),
                  Image.network(
                    "https://images.unsplash.com/photo-1574634534894-89d7576c8259?q=80&w=764&auto=format&fit=crop",
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Welcome to UrShop!",
              style: TextStyle(
                fontFamily: 'Font',
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 40),

            // Buttons
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignupPage()),
                );
              },
              child: const Text("Sign Up"),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(title: 'Sign In'),
                  ),
                );
              },
              child: const Text("Sign In"),
            ),
          ],
        ),
      ),
    );
  }
}

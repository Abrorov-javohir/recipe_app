import 'package:flutter/material.dart';
import 'package:recipe_app/ui/screens/auth/register/begin_register_screen.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    });
  }

  void _onLastPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const BeginRegisterScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              if (index == 2) {
                // Assuming the last page index is 2
                _onLastPage();
              }
            },
            children: const [
              SplashPage(
                image: "assets/image/carrisa-gan.png",
                title: "Share Your Recipes",
                description: "Lorem ipsum dolor sit amet, consectetur elit.",
              ),
              SplashPage(
                image: "assets/image/fathul.png",
                title: "Cook with Friends",
                description: "Share and enjoy recipes with friends.",
              ),
              SplashPage(
                image: "assets/image/brooke.png",
                title: "Discover New Flavors",
                description: "Explore new recipes and cooking methods.",
              ),
            ],
          ),
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: LinearProgressIndicator(
              value: (_currentPage + 1) / 3,
              backgroundColor: Colors.grey[300],
              color: Colors.teal,
              minHeight: 5,
            ),
          ),
        ],
      ),
    );
  }
}

class SplashPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const SplashPage({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          color: Colors.black54, // Semi-transparent overlay
        ),
        Positioned(
          top: 500, // Adjust this value as needed
          left: 20,
          right: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10),
              Text(
                description,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

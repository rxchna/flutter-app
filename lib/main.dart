import 'package:flutter/material.dart';
import 'package:minions_project_2/products_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minion Watch Store',
      home: MyHomeScreen(),
    );
  }
}

class MyHomeScreen extends StatefulWidget {
  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  bool _animateLogo = false; // Controls animation

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        _animateLogo = true; // Trigger animation
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isLargeScreen = constraints.maxWidth > 600;

            return Center(
              child: SizedBox(
                width: isLargeScreen ? constraints.maxWidth * 0.6 : constraints.maxWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 700), // Animation duration
                      curve: Curves.easeOut, // Smooth transition
                      transform: Matrix4.translationValues(
                        _animateLogo ? 0 : -200, // From left (-200) to center (0)
                        0,
                        0,
                      ),
                      child: Container(
                        padding: EdgeInsets.only(top: isLargeScreen ? 70 : 220),
                        child: Column(
                          children: [
                            Image.asset(
                              'images/minion_watch_store_logo.png',
                              width: isLargeScreen ? 130 : 175,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Minions Watch Store',
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: isLargeScreen ? 20 : 100),
                    SizedBox(
                      width: isLargeScreen
                          ? constraints.maxWidth * 0.4
                          : MediaQuery.of(context).size.width * 0.55,
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.yellow,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          elevation: 4.0,
                          shadowColor: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ProductsScreen(),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Go to Shop',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Icon(
                              Icons.arrow_circle_right,
                              size: isLargeScreen ? 20 : 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

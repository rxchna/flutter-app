import 'package:flutter/material.dart';
import 'package:minions_project_2/products_screen.dart';

class ThankyouScreen extends StatefulWidget {
  @override
  _ThankyouScreenState createState() => _ThankyouScreenState();
}

class _ThankyouScreenState extends State<ThankyouScreen> {
  bool _animateText = false;
  bool _animateLogo = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        _animateText = true; // Trigger animation for text
        _animateLogo = true; // Trigger animation for logo
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9FAFB),
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
                    Container(
                      padding: EdgeInsets.only(top: isLargeScreen ? 50 : 150),
                      child: Column(
                        children: [
                          SizedBox(height: isLargeScreen ? 0 : 50),

                          // Animated scaling for the logo
                          AnimatedScale(
                            duration: Duration(milliseconds: 700),
                            scale: _animateLogo ? 1.0 : 1.5, // Scale from larger to original size
                            curve: Curves.easeOut,
                            child: Image.asset(
                              'images/order_success_minionlogo.png',
                              width: isLargeScreen ? 110 : 175,
                            ),
                          ),
                          SizedBox(height: isLargeScreen ? 10 : 30),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Thank you for your Order!',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: isLargeScreen ? 0 : 10),

                          // Animated text with translation effect
                          AnimatedContainer(
                            duration: Duration(milliseconds: 700),
                            curve: Curves.easeOut,
                            transform: Matrix4.translationValues(
                              _animateText ? 0 : -200, // Translate the text
                              0,
                              0,
                            ),
                            child: const Text(
                              'Your item is on its way 🚀',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          SizedBox(height: isLargeScreen ? 20 : 70),
                        ],
                      ),
                    ),
                    // Button to go to the shop
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
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Go to Shop',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.arrow_circle_right,
                              size: 30,
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
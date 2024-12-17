import 'dart:async';
import 'package:flutter/material.dart';
import 'package:minions_project_2/checkout_screen.dart';
import 'package:minions_project_2/main.dart';
import 'Watch.dart';

class ProductScreen extends StatefulWidget {
  final Watch currentWatch;

  const ProductScreen({
    super.key,
    required this.currentWatch,
  });

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int _quantity = 1;
  final PageController _pageController = PageController();
  Timer? _timer;
  bool _isPaused = false;
  int _currentIndex = 0;

  // Method to increment quantity
  void _incrementQuantity() {
    if (_quantity >= 5) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Quantity cannot be greater than 5.")));
    } else {
      setState(() {
        _quantity++;
      });
    }
  }

  // Method to decrement quantity
  void _decrementQuantity() {
    if (_quantity <= 1) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Quantity cannot be less than 1.")));
    } else {
      setState(() {
        _quantity--;
      });
    }
  }

  // Method to start auto-scrolling the images
  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentIndex < widget.currentWatch.watchImages.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0; // Reset to the first image
      }
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  // Method to stop auto-scrolling
  void _stopAutoScroll() {
    _timer?.cancel();
  }

  // Toggle between pause and resume
  void _togglePauseResume() {
    if (_isPaused) {
      _startAutoScroll();
    } else {
      _stopAutoScroll();
    }
    setState(() {
      _isPaused = !_isPaused;
    });
  }

  @override
  void initState() {
    super.initState();
    _startAutoScroll(); // Start auto-scroll when screen is loaded
  }

  @override
  void dispose() {
    _stopAutoScroll(); // Stop the timer when the screen changes
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isWideScreen = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MyHomeScreen(),
                  ),
                );
              },
              child: Image.asset(
                'images/minion_logo_yellow.png',
                height: 32,
                width: 32,
              ),
            ),
            SizedBox(height: 10), // Space between the image and title
            Text(
              widget.currentWatch.watchName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        toolbarHeight: 85,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: isWideScreen
              ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image Column on the left
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    Hero(
                      tag: 'watch_${widget.currentWatch.watchID}',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: SizedBox(
                          height: 280,
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount: widget.currentWatch.watchImages.length,
                            itemBuilder: (context, index) {
                              return Image.asset(
                                widget.currentWatch.watchImages[index],
                                fit: BoxFit.contain,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -3,
                      right: 1,
                      child: ElevatedButton(
                        onPressed: _togglePauseResume,
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Colors.yellow),
                          padding: MaterialStateProperty.all(EdgeInsets.zero),
                          shape: MaterialStateProperty.all(CircleBorder()),
                        ),
                        child: Icon(
                          _isPaused ? Icons.play_arrow : Icons.pause,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20), // Space between image and content
              // Content Column on the right
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.currentWatch.watchName.toUpperCase(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '\$${widget.currentWatch.watchPrice.toStringAsFixed(2)}',
                            style: const TextStyle(
                              color: Color(0xFFE7B601),
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            widget.currentWatch.watchDesc,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                            maxLines: 6,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Text(
                                'Quantity',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: _decrementQuantity,
                                    child: const Icon(
                                      Icons.remove_circle,
                                      size: 35,
                                      color: Colors.amber,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    _quantity.toString(),
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  GestureDetector(
                                    onTap: _incrementQuantity,
                                    child: const Icon(
                                      Icons.add_circle,
                                      size: 35,
                                      color: Colors.amber,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: 55,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => CheckoutScreen(
                                      quantity: _quantity,
                                      currentWatch: widget.currentWatch,
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                backgroundColor: Colors.transparent,
                                elevation: 4,
                                padding: EdgeInsets.zero,
                              ),
                              child: Ink(
                                decoration: BoxDecoration(
                                  color: Colors.yellow.shade600,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Buy Now',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
              : Column(
            children: [
              const SizedBox(height: 40),
              Stack(
                children: [
                  Hero(
                    tag: 'watch_${widget.currentWatch.watchID}',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: SizedBox(
                        height: 280,
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: widget.currentWatch.watchImages.length,
                          itemBuilder: (context, index) {
                            return Image.asset(
                              widget.currentWatch.watchImages[index],
                              fit: BoxFit.contain,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -3,
                    right: 1,
                    child: ElevatedButton(
                      onPressed: _togglePauseResume,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.yellow),
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                        shape: MaterialStateProperty.all(CircleBorder()),
                      ),
                      child: Icon(
                        _isPaused ? Icons.play_arrow : Icons.pause,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.currentWatch.watchName.toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      '\$${widget.currentWatch.watchPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Color(0xFFE7B601),
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      widget.currentWatch.watchDesc,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        const Text(
                          'Quantity',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: _decrementQuantity,
                              child: const Icon(
                                Icons.remove_circle,
                                size: 35,
                                color: Colors.amber,
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              _quantity.toString(),
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(width: 8),
                            GestureDetector(
                              onTap: _incrementQuantity,
                              child: const Icon(
                                Icons.add_circle,
                                size: 35,
                                color: Colors.amber,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 35),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => CheckoutScreen(
                                quantity: _quantity,
                                currentWatch: widget.currentWatch,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          backgroundColor: Colors.transparent,
                          elevation: 4,
                          padding: EdgeInsets.zero,
                        ),
                        child: Ink(
                          decoration: BoxDecoration(
                            color: Colors.yellow.shade600,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Center(
                            child: Text(
                              'Buy Now',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:animation_bootcamp/pages/home_page.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class BusinessPage extends StatefulWidget {
  const BusinessPage({super.key});

  @override
  State<BusinessPage> createState() => _BusinessPageState();
}

class _BusinessPageState extends State<BusinessPage> {
  bool isContainerVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: AnimationLimiter(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: 30, // Number of items to generate
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredGrid(
              position: index,
              columnCount: 3,
              child: ScaleAnimation(
                duration: const Duration(milliseconds: 3000),
                child: FadeInAnimation(
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    height: 200,
                    width: 200,
                    color: Colors.red,
                    child: const Center(
                      child: Text(
                        'Animated',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
        height: isContainerVisible ? 68 : 0,
        child: Container(
          margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.red,
            boxShadow: [
              BoxShadow(
                color: Colors.black38.withOpacity(0.2),
                blurRadius: 6,
                spreadRadius: 2,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: BottomNavigationBar(
              selectedLabelStyle: const TextStyle(
                color: Colors.white,
              ),
              unselectedLabelStyle: const TextStyle(
                color: Colors.red,
              ),
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.black,
              backgroundColor: Colors.red,
              type: BottomNavigationBarType.fixed,
              currentIndex: 0,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    },
                    child: const Icon(
                      Icons.home,
                    ),
                  ),
                  label: 'Home',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.wallet,
                  ),
                  label: 'Wallet',
                ),
                BottomNavigationBarItem(
                  icon: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BusinessPage(),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.business,
                    ),
                  ),
                  label: 'Business',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

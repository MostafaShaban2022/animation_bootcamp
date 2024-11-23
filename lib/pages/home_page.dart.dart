import 'package:animation_bootcamp/pages/business_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  bool isContainerVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is UserScrollNotification) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              setState(() {
                if (notification.direction == ScrollDirection.reverse) {
                  isContainerVisible = false;
                } else if (notification.direction == ScrollDirection.forward) {
                  isContainerVisible = true;
                }
              });
            });
          }
          return true;
        },
        child: ListView.builder(
          controller: _scrollController,
          itemCount: 31,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Title $index'),
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
                  icon: GestureDetector(
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
                              builder: (context) => const BusinessPage()));
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

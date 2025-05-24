import 'package:flutter/material.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:go_router/go_router.dart';


class HomeBottomBarNavigation extends StatefulWidget {
  final Widget child;
  const HomeBottomBarNavigation({required this.child, super.key});

  @override
  State<HomeBottomBarNavigation> createState() => _HomeBottomBarNavigationState();
}

class _HomeBottomBarNavigationState extends State<HomeBottomBarNavigation> {
  @override
  Widget build(BuildContext context) {
    final currentLocation = GoRouterState.of(context).uri.toString();
    int currentIndex = _getTabIndex(currentLocation);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(18, 18, 18, 1),
        resizeToAvoidBottomInset: true,
        body: widget.child,
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Color.fromRGBO(18, 18, 18, 1),
          color: Color(0xFF1F222A),
          index: currentIndex,
          onTap: (index) {
            switch (index) {
              case 0:
                context.go('/');
                break;
              case 1:
                context.go('/report');
                break;
              case 2:
                context.go('/notification');
                break;
              case 3:
                context.go('/chat');
                break;
            }
          },
          items: [
            CurvedNavigationBarItem(
              child: Icon(Icons.home_outlined, size: 40, color: currentIndex == 0? Color(0xFFFFFFFF):Color(0xFFB0BEC5),),
              label: 'Home',
              labelStyle: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
            CurvedNavigationBarItem(
              
              child: Icon(Icons.report_outlined, size: 40, color: currentIndex == 1? Color(0xFFFFFFFF):Color(0xFFB0BEC5),),
              label: 'Report',
              labelStyle: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
            CurvedNavigationBarItem(
              child: Icon(Icons.notifications_outlined, size: 40, color: currentIndex == 2? Color(0xFFFFFFFF):Color(0xFFB0BEC5),),
              label: 'Notification',
              labelStyle: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
            CurvedNavigationBarItem(
              child: Icon(Icons.chat_bubble_outlined, size: 40, color: currentIndex == 3? Color(0xFFFFFFFF):Color(0xFFB0BEC5),),
              label: 'Chat',
              labelStyle: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  int _getTabIndex(String location) {
    if (location.contains('/report')) return 1;
    if (location.contains('/notification')) return 2;
    if (location.contains('/chat')) return 3;
    return 0;
  }
}
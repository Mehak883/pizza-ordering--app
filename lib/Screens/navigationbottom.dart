import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:pixzzaapp/Screens/HomePage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pixzzaapp/Screens/likes.dart';
// import 'package:pixzzaapp/order.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// import 'package:pixzzaapp/';
// import 'package:cupertino_icons/cupertino_icons.dart';
class navigationbottom extends StatelessWidget {
  // const navigationbottom({Key key}) : super(key: key);
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  List<Widget> _buildScreens() {
    return [HomePage(), likes(), likes(), likes(), likes()];
  }

  List <PersistentBottomNavBarItem>_navBarsItems() {
    return [
      PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            'images/home.svg',
            height: 22,
            color: Colors.white,
          ),
          inactiveColorPrimary: const Color.fromARGB(255, 255, 255, 255),
          activeColorPrimary: const Color.fromARGB(255, 255, 255, 255)),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.search),
          inactiveColorPrimary: const Color.fromARGB(255, 255, 255, 255),
          activeColorPrimary: const Color.fromARGB(255, 255, 255, 255)),
      PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            'images/person.svg',
            width: 22,
            color: Colors.white,
          ),
          inactiveColorPrimary: const Color.fromARGB(255, 255, 255, 255),
          activeColorPrimary: const Color.fromARGB(255, 255, 255, 255)),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.favorite_outline),
          inactiveColorPrimary: const Color.fromARGB(255, 255, 255, 255),
          activeColorPrimary: const Color.fromARGB(255, 255, 255, 255)),
      PersistentBottomNavBarItem(
          icon: SvgPicture.asset('images/more.svg',
              color: Colors.white, width: 27),
          inactiveColorPrimary: const Color.fromARGB(255, 255, 255, 255),
          activeColorPrimary: const Color.fromARGB(255, 255, 255, 255)),
    ];
  }

  @override
  Widget build(BuildContext context){
      return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor:
          Color.fromARGB(255, 65, 48, 79), // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(0.0),
        colorBehindNavBar: Colors.white,
      ),
  
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style2,
    );
  }
}

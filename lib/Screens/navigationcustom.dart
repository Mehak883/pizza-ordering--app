import 'package:flutter/material.dart';
import 'package:pixzzaapp/Screens/HomePage.dart';
import 'package:pixzzaapp/Screens/Search.dart';
import 'package:pixzzaapp/Screens/likes.dart';
import 'package:flutter_svg/flutter_svg.dart';
class navigationcustom extends StatefulWidget {
  const navigationcustom({super.key});

  @override
  State<navigationcustom> createState() => _navigationcustomState();
}

class _navigationcustomState extends State<navigationcustom> {
  int selectedIndex = 0;
  List<String> icondata = [
    'images/home.svg',
    'images/search.svg',
    'images/fav.svg',
    'images/person.svg',
    'images/more.svg'
  ];
  List<Widget> pages = [
    HomePage(),
    Search(),
    likes(),
    likes(),
    likes(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Material(
        child: Container(
          height: 60,
          decoration: const BoxDecoration(color: Color.fromARGB(255, 65, 48, 79),),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: icondata.length,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: SizedBox(
                    width : index!=2 ? 33:27,
                    height: index!=2 ? 33:27,
                    child: SvgPicture.asset(icondata[index],
                      color: Colors.white,
                      width: 30,
                      height: 30,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      body: pages[selectedIndex],
    );
  }
}

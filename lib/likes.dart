import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixzzaapp/Provider/LikesProv.dart';
import 'package:provider/provider.dart';

// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
class likes extends StatelessWidget {
  const likes({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              // actions: [Padding(
              //   padding: const EdgeInsets.only(right: 10),
              //   child: Icon(Icons.favorite,color: Colors.red,size: 28,),
              // )],
              title: Text('Your Favourites',
                  style: GoogleFonts.poppins(fontSize: 26)),
            ),
            body: Consumer<LikesProv>(builder: ((context, value, child) {
              return SizedBox(
                height: 680,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final item = value.favItem[index];
                    return value.favItem[index][3]==true?Dismissible(
                        direction: DismissDirection.horizontal,
                        key: Key(item.toString()),
                        onDismissed: (direction) {
                          value.dislikeItem(index);
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Item Unliked')));
                        },
                        background:
                            Container(color: Color.fromRGBO(65, 48, 79, 1)),
                        child: Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: ListTile(
                              leading: Image(
                                  image: AssetImage(value.favItem[index][0])),
                              title: Text(value.favItem[index][1]),
                              subtitle: Text(value.favItem[index][4],
                                  maxLines: 2, overflow: TextOverflow.ellipsis),
                              trailing: Column(
                                children: [
                                  Text(
                                    '\$${value.favItem[index][2]}',
                                    style: TextStyle(
                                        fontSize: 23, color: Colors.black),
                                  )
                                  // ])
                                  // ]
                                  //)
                                ],
                              ),
                            ))):SizedBox();
                  },
                  itemCount: value.favItem.length,
                ),
              );
            }))));
  }
}

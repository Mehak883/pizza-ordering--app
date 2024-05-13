import 'package:flutter/material.dart';
import 'package:pixzzaapp/Provider/HomeProv.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'package:pixzzaapp/Provider/LikesProv.dart';
// class Search extends StatefulWidget {
//   const Search({super.key});

//   @override
//   State<Search> createState() => _SearchState();
// }

// class _SearchState extends State<Search> {
//   bool isDark = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(children: [
//         SizedBox(height: 30,),
//            Padding(padding:EdgeInsets.symmetric(vertical: 10,horizontal: 20),
//             child: SearchAnchor(
//                 builder: (BuildContext context, SearchController controller) {
//               return SearchBar(
//                 controller: controller,
//                 padding: const MaterialStatePropertyAll<EdgeInsets>(
//                     EdgeInsets.symmetric(horizontal: 16.0)),
//                 onTap: () {
//                   controller.openView();
//                 },
//                 onChanged: (_) {
//                   controller.openView();
//                 },
//                 leading: const Icon(Icons.search),
//                 hintText: 'Search',

//               );
//             },
//             suggestionsBuilder:
//                     (BuildContext context, SearchController controller) {
//               return List<ListTile>.generate(5, (int index) {
//                 final String item = 'item $index';
//                 return ListTile(
//                   title: Text(item),
//                   onTap: () {
//                     setState(() {
//                       controller.closeView(item);
//                     });
//                   },
//               );
//               });
//             }
//             ),
//     ),

//     ]),
//         );
//   }
// }

class Search extends StatefulWidget {
  Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  HomeProv hp = HomeProv();
  List searchitems = <dynamic>[
    ['images/pizza-png-15.png', 'Canadian Pizza', '20', false],
    ['images/pizza-png-15.png', 'Baby Corn Pizza', '30', false],
    ['images/pizza-png-15.png', 'Tandoori Pizza', '15', false],
    ['images/pizza-png-15.png', 'Mushooms Olives Pizza', '30', false],
    ['images/pizza-png-15.png', 'Canadian Pizza', '20', false],
  ];
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
              top: 120,
              left: 10,
              right: 10,
              child: Column(
                children: [
                  SizedBox(
                    height: 150,
                    width: 380,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                            height: 150,
                            width: 380,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                //  stops: [0.5, 0.8],

                                colors: [
                                  Color.fromARGB(255, 65, 48, 79),
                                  Color.fromARGB(255, 155, 128, 176)
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: -35,
                          left: -15,
                          bottom: 0,
                          child: Image.asset(
                            'images/slice5.webp',
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                            right: 20,
                            top: 20,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '#Double the Fun',
                                  style:
                                      GoogleFonts.poppins(color: Colors.white),
                                ),
                                Text('Get our 2x Powerplay Deal',
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      width: 102,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 0)),
                                      child: Text(
                                        'Order Now',
                                        style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.white, // Container background color
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Top Picks For You',
                              style: GoogleFonts.poppins(
                                  fontSize: 24,
                                  color: Color.fromARGB(255, 65, 48, 79),
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                                height: 300,
                                width: 510,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: hp.pd.length,
                                  itemBuilder: (BuildContext context, index) {
                                    // var data = itemlist.items[index];

                                    return Card(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 0),
                                        child: SizedBox(
                                          width: 200,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 15,
                                              ),
                                              SizedBox(
                                                  height: 150,
                                                  child: Hero(
                                                      tag: index,
                                                      child: Image.asset(hp
                                                          .pd[index].Pimage))),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5, right: 5, left: 5),
                                                child: Text(
                                                  hp.pd[index].Pname,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 18,
                                                    color: Color.fromARGB(
                                                        255, 65, 48, 79),
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  maxLines: 1,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    10, 10, 10, 0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      '\$${hp.pd[index].price}',
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 20,
                                                              color: const Color
                                                                  .fromRGBO(
                                                                  0, 0, 0, 1)),
                                                    ),
                                                    Consumer<LikesProv>(
                                                      builder: (context, value,
                                                          child) {
                                                        return GestureDetector(
                                                          onTap: (){
                                                            if (value.getItem(index)==false) {
                      value.addItem(index);
                    } else {

                      value.removeItem(value.getId(index));
                    }
                    print(value.favItem);
                                                          },
                                                          child: Icon(
                                                            value.getItem(index)                                                        
                                                                ? Icons
                                                                    .favorite_rounded
                                                                : Icons
                                                                    .favorite_outline_rounded,
                                                            size: 22,
                                                            color: value.getItem(index) 
                                                                ? Colors.red
                                                                : Colors.black,
                                                          ),
                                                        );
                                                      },
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 0),
                                                  child: ElevatedButton(
                                                      onPressed: () {},
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              backgroundColor:
                                                                  Color
                                                                      .fromARGB(
                                                                          255,
                                                                          65,
                                                                          48,
                                                                          79),
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          30,
                                                                      vertical:
                                                                          0)),
                                                      child: Text(
                                                        'Order Now',
                                                        style:
                                                            GoogleFonts.poppins(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 15),
                                                      ))),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                )),
                          ]))
                ],
              )),
          // buildBottomNavigationBar(),
          buildFloatingSearchBar(),
        ],
      ),
    );
  }

  Widget buildFloatingSearchBar() {
    FloatingSearchBarController _srchcont = FloatingSearchBarController();
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return FloatingSearchBar(
      controller: _srchcont,
      hint: 'Search...',
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      // border: BorderRadius
      borderRadius: BorderRadius.all(Radius.circular(30)),
      // border:BorderRadius.all(radius)),
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 370 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {
        print(_srchcont.query);
      },

      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: true,
          child: CircularButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              print(_srchcont);
            },
          ),
        ),
        // FloatingSearchBarAction.searchToClear(
        //   showIfClosed: false,
        // ),
      ],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Colors.white,
            elevation: 4.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: searchitems.map((oneitem) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _srchcont.query = oneitem[1];
                    });
                  },
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      child: Container(
                        height: 52,
                        color: Colors.white,
                        child: Row(children: [
                          Image.asset(
                            oneitem[0],
                            width: 40,
                            height: 40,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 220,
                            child: Text(
                              oneitem[1],
                              style: GoogleFonts.poppins(),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  searchitems.remove(oneitem);
                                });
                              },
                              icon: Icon(Icons.close))
                        ]),
                      )),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}

// Widget PageItems() {

//   // List searchitems = <dynamic>[
//   //   ['images/pizza-png-15.png', 'Canadian Pizza', '20'],
//   //   ['images/pizza-png-15.png', 'Baby Corn Pizza', '30'],
//   //   ['images/pizza-png-15.png', 'Tandoori Pizza', '15'],
//   //   ['images/pizza-png-15.png', 'Mushooms Olives Pizza', '30'],
//   //   ['images/pizza-png-15.png', 'Canadian Pizza', '20'],
//   // ];

//   return
//    Positioned(
//       top: 120,
//       left: 10,
//       right: 10,
//       child: Column(
//         children: [
//           SizedBox(
//             height: 150,
//             width: 380,
//             child: Stack(
//               children: [
//                 Positioned(
//                   top: 0,
//                   left: 0,
//                   child: Container(
//                     height: 150,
//                     width: 380,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(15)),
//                       gradient: LinearGradient(
//                         begin: Alignment.topLeft,
//                         end: Alignment.bottomRight,
//                         //  stops: [0.5, 0.8],

//                         colors: [
//                           Color.fromARGB(255, 65, 48, 79),
//                           Color.fromARGB(255, 155, 128, 176)
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   top: -35,
//                   left: -15,
//                   bottom: 0,
//                   child: Image.asset(
//                     'images/slice5.webp',
//                     width: 200,
//                     height: 200,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 Positioned(
//                     right: 20,
//                     top: 20,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           '#Double the Fun',
//                           style: GoogleFonts.poppins(color: Colors.white),
//                         ),
//                         Text('Get our 2x Powerplay Deal',
//                             style: GoogleFonts.poppins(
//                                 color: Colors.white,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w600)),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             SizedBox(
//                               width: 102,
//                             ),
//                             ElevatedButton(
//                               onPressed: () {},
//                               style: ElevatedButton.styleFrom(
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: 20, vertical: 0)),
//                               child: Text(
//                                 'Order Now',
//                                 style: GoogleFonts.poppins(
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.w600),
//                               ),
//                             )
//                           ],
//                         )
//                       ],
//                     ))
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Container(
//               decoration: BoxDecoration(
//                 color: Colors.white, // Container background color
//               ),
//               child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Recommended For You',
//                       style: GoogleFonts.poppins(
//                           fontSize: 24,
//                           color: Color.fromARGB(255, 65, 48, 79),
//                           fontWeight: FontWeight.w500),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     SizedBox(
//                       height: 320,
//                       width: 510,
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: 4,
//                         itemBuilder: (BuildContext context, index) {
//                           // var data = itemlist.items[index];
//                           myFunc() {

//                           }

//                           return Card(
//                             color: Colors.white,
//                             child: Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 10),
//                               child: SizedBox(
//                                 width: 200,
//                                 child: Column(
//                                   children: [
//                                     SizedBox(
//                                       height: 15,
//                                     ),
//                                     SizedBox(
//                                         height: 150,
//                                         child: Hero(
//                                             tag: index,
//                                             child: Image.asset(
//                                                 searchitems[index][0]))),
//                                     Padding(
//                                       padding: const EdgeInsets.only(
//                                           top: 5, right: 5, left: 5),
//                                       child: Text(
//                                         searchitems[index][1],
//                                         style: GoogleFonts.poppins(
//                                           fontSize: 18,
//                                           color:
//                                               Color.fromARGB(255, 65, 48, 79),
//                                           fontWeight: FontWeight.w600,
//                                         ),
//                                         maxLines: 1,
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding:
//                                           EdgeInsets.fromLTRB(10, 10, 10, 0),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             '\$${searchitems[index][2]}',
//                                             style: GoogleFonts.poppins(
//                                                 fontSize: 20,
//                                                 color: Colors.black),
//                                           ),
//                                           IconButton(
//                                             onPressed: () {
//                                               setState(() {
//                                                 isFav = !isFav;
//                                               });
//                                             },
//                                             icon: Icon(
//                                               isFav
//                                                   ? Icons.favorite_rounded
//                                                   : Icons
//                                                       .favorite_outline_rounded,
//                                               size: 22,
//                                               color: isFav
//                                                   ? Colors.red
//                                                   : Colors.black,
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                     Padding(
//                                         padding: EdgeInsets.only(top: 0),
//                                         child: ElevatedButton(
//                                             onPressed: () {},
//                                             style: ElevatedButton.styleFrom(
//                                                 backgroundColor: Color.fromARGB(
//                                                     255, 65, 48, 79),
//                                                 padding: EdgeInsets.symmetric(
//                                                     horizontal: 30,
//                                                     vertical: 0)),
//                                             child: Text(
//                                               'Order Now',
//                                               style: GoogleFonts.poppins(
//                                                   color: Colors.white,
//                                                   fontSize: 15),
//                                             ))),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ]))
//         ],
//       ));
// }

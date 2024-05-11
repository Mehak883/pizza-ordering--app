import 'package:flutter/material.dart';
// import 'package:flutter_avif/flutter_avif.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixzzaapp/Provider/HomeProv.dart';
import 'package:pixzzaapp/order.dart';
import 'package:pixzzaapp/cart.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PizzaDetails {
  final String Pimage;
  final String Pname;
  final String Pdesp;
  final Color Ccolor;
  final int price;
  PizzaDetails(this.Pimage, this.Pname, this.Pdesp, this.Ccolor, this.price);
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeProv hp = HomeProv();
  // List<PizzaDetails> pd = <PizzaDetails>[
  // PizzaDetails(
  //     'images/pizza-png-15.png',
  //     'Canadian Pizza',
  //     'The "Canadian pizza" toppings typically include tomato sauce, mozzarella cheese, side bacon, pepperoni, and mushrooms',
  //     Color.fromARGB(255, 250, 255, 190),
  //     35),
  // PizzaDetails(
  //     'images/pizza-png-15.png',
  //     'Mushrooms-olives',
  //     'This delicious mushroom pizza is smothered in sautéed mushrooms, onions and garlic, and layers of mozzarella and fresh-grated parmesan',
  //     Color.fromRGBO(206, 255, 206, 1),
  //     60),
  // PizzaDetails(
  //     'images/pizza-png-15.png',
  //     'Mushrooms-olives',
  //     'This delicious mushroom pizza is smothered in sautéed mushrooms, onions and garlic, and layers of mozzarella and fresh-grated parmesan',
  //     Color.fromRGBO(206, 255, 206, 1),
  //     20),
  // PizzaDetails(
  //     'images/pizza-png-15.png',
  //     'Onion Chesse Pizza',
  //     'The wholesome pizza base is topped up with crunchy vegetables along with mozzarella cheese and is baked to perfection to tantalize your taste buds.',
  //     Color.fromARGB(255, 167, 211, 234),
  //     23),
  // PizzaDetails(
  //     'images/pizza-png-15.png',
  //     'Tandoori Paneer Pizza',
  //     'Savor the perfect fusion of smoky tandoori flavors and succulent paneer on our exquisite Tandoori Paneer Pizza, where traditional Indian spices meet the cheesy delight of a classic pizza crust',
  //     Color.fromARGB(255, 249, 218, 254),
  //     57),
  // PizzaDetails(
  //     'images/pizza-png-15.png',
  //     'FarmHouse Pizza',
  //     'Indulge in the rustic charm of our Farmhouse Pizza, featuring a medley of fresh, farm-to-table ingredients atop a golden crust, delivering a savory symphony of flavors straight from the heart of the countryside',
  //     Color.fromARGB(255, 186, 255, 199),
  //     76),
  // // PizzaDetails('images/sweetcorn.png', 'Sweet Corn Pizza', ''),
  // PizzaDetails(
  //     'images/pizza-png-15.png',
  //     'Veg BabyCorn Pizza',
  //     'Experience a burst of freshness with our Veg Baby Corn Pizza, where crisp baby corn, vibrant vegetables, and gooey cheese unite on a perfectly baked crust, creating a delightful symphony of flavors',
  //     Color.fromRGBO(255, 249, 196, 1),
  //     20),
  // PizzaDetails(
  //     'images/pizza-png-15.png',
  //     'Veg BabyCorn Pizza',
  //     'Experience a burst of freshness with our Veg Baby Corn Pizza, where crisp baby corn, vibrant vegetables, and gooey cheese unite on a perfectly baked crust, creating a delightful symphony of flavors',
  //     Color.fromARGB(255, 167, 211, 234),
  //     63),
  // PizzaDetails(
  //     'images/pizza-png-15.png',
  //     'Veg BabyCorn Pizza',
  //     'Experience a burst of freshness with our Veg Baby Corn Pizza, where crisp baby corn, vibrant vegetables, and gooey cheese unite on a perfectly baked crust, creating a delightful symphony of flavors',
  //     Color.fromRGBO(255, 196, 207, 1),
  //     45),
  // ];
// int _selectedIndex = 0;
//     void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
  // final ScrollController? controller=ScrollController(initialScrollOffset: 4.5);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => cart()));
              },
              icon: SvgPicture.asset('images/shopping-bag.svg', height: 30),
            )
          ],
          // leading: Icon(
          //   Icons.menu,
          //   size: 30,
          // ),
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            children: <Widget>[
              // DrawerHeader(
              //   // padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
              //     child: Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text(
              //       'Cheesy Bites',
              //       style: GoogleFonts.poppins(
              //         fontSize: 25,
              //         fontWeight: FontWeight.w600,
              //         color: Color.fromARGB(255, 65, 48, 79)
              //       ),
              //     )
              //   ],
              // )),
              ListTile(
                title: Text('HomePage'),
                trailing: Icon(Icons.home),
                iconColor: Colors.teal,
                onTap: () => Navigator.of(context).pushNamed('/'),
              ),
              Divider(
                thickness: 1.0,
                color: Color.fromARGB(255, 188, 193, 192),
                endIndent: 2,
              ),
              ListTile(
                title: Text('Your Cart'),
                trailing: Icon(Icons.card_travel),
                iconColor: Colors.teal,
                onTap: () => Navigator.of(context).pushNamed("/login"),
              ),
              Divider(
                thickness: 1.0,
                color: Color.fromARGB(255, 188, 193, 192),
                endIndent: 2,
              ),
              ListTile(
                title: Text("Profile"),
                trailing: Icon(Icons.person_2),
                iconColor: Colors.teal,
                onTap: () => Navigator.of(context).pushNamed('/Profile'),
              ),
              Divider(
                thickness: 1.0,
                color: Color.fromARGB(255, 188, 193, 192),
                endIndent: 2,
              ),
              ListTile(
                title: Text(""),
                trailing: Icon(Icons.home),
                iconColor: Colors.teal,
                onTap: () => Navigator.of(context).pushNamed('/Mascot'),
              ),
              Divider(
                thickness: 1.0,
                color: Color.fromARGB(255, 188, 193, 192),
                endIndent: 2,
              ),
              ListTile(
                title: Text("Close"),
                trailing: Icon(Icons.close),
                iconColor: Colors.teal,
                onTap: () => Navigator.of(context).pop(),
              ),
              Divider(
                thickness: 1.0,
                color: Color.fromARGB(255, 188, 193, 192),
                endIndent: 2,
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 14),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Eat Fresh Pizza',
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 65, 48, 79),
                    ),
                  ),
                  Text(
                    'Our daily fresh pizzas',
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Color.fromARGB(255, 134, 117, 157)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            print(hp.pd.length);
                          },
                          child: Text(
                            'Salad',
                            style: GoogleFonts.poppins(
                                color: Color.fromARGB(255, 65, 48, 79)),
                          ),
                          style: ButtonStyle(
                              side: MaterialStateProperty.all<BorderSide>(
                                BorderSide(
                                    color: Color.fromARGB(255, 203, 199,
                                        199)), // Set the border color here
                              ),
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 0)))),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Fresh Pizza',
                            style: GoogleFonts.poppins(
                                color: Color.fromARGB(255, 65, 48, 79)),
                          ),
                          style: ButtonStyle(
                              side: MaterialStateProperty.all<BorderSide>(
                                BorderSide(
                                    color: Color.fromARGB(255, 203, 199,
                                        199)), // Set the border color here
                              ),
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 0)))),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Grilled',
                            style: GoogleFonts.poppins(
                                color: Color.fromARGB(255, 65, 48, 79)),
                          ),
                          style: ButtonStyle(
                              side: MaterialStateProperty.all<BorderSide>(
                                BorderSide(
                                    color: Color.fromARGB(255, 203, 199,
                                        199)), // Set the border color here
                              ),
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 0)))),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 510,
                    child: MasonryGridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 6,
                      crossAxisSpacing: 8,
                      itemBuilder: (context, index) {
                        return index != 1
                            ? SizedBox(
                                height: 300,
                                child: Card(
                                    color: hp.pd[index].Ccolor,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 20),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 12, bottom: 7),
                                              child: Image(
                                                image: AssetImage(
                                                    hp.pd[index].Pimage),
                                                height: 120,
                                                width: 120,
                                              ),
                                            ),
                                            Expanded(
                                                child: SizedBox(
                                                    child: Text(
                                              '${hp.pd[index].Pname}',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 15,
                                                  color: Color.fromARGB(
                                                      255, 65, 48, 79),
                                                  fontWeight: FontWeight.w600),
                                            ))),
                                            Text(
                                              '${hp.pd[index].Pdesp}',
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 86, 65, 104),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          order(
                                                            index:index
                                                            // Pname:
                                                            //     hp.pd[index].Pname,
                                                            // Pdesp:
                                                            //    hp.pd[index].Pdesp,
                                                            // Pimage:hp. pd[index]
                                                            //     .Pimage,
                                                            // Pprice:
                                                            //    hp. pd[index].price,
                                                          )),
                                                );
                                              },
                                              child: Text('Order Now',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                  )),
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.white,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 35,
                                                      vertical: 0)),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            )
                                          ]),
                                    )))
                            : SizedBox(
                                height: 150,
                                child: Card(
                                    color: const Color.fromARGB(
                                        255, 255, 161, 192)),
                              );
                      },
                      itemCount: hp.pd.length,
                    ),
                  ),
                  // SingleChildScrollView(child:
                  // SizedBox(
                  //   height: 1200,
                  //   child: GridView.custom(
                  //     shrinkWrap: true,
                  //     physics: NeverScrollableScrollPhysics(),
                  //     gridDelegate: SliverWovenGridDelegate.count(
                  //       crossAxisCount: 2,
                  //       mainAxisSpacing: 4,
                  //       crossAxisSpacing: 4,
                  //       pattern: [
                  //         WovenGridTile(0.65),
                  //         WovenGridTile(
                  //           0.65,
                  //           crossAxisRatio: 1,
                  //         ),
                  //       ],
                  //     ),
                  //     childrenDelegate: SliverChildBuilderDelegate(
                  //         (context, index) => index != 1
                  //             ? Card(
                  //                 color: pd[index].Ccolor,
                  //                 child: Padding(
                  //                   padding: EdgeInsets.symmetric(
                  //                       vertical: 0, horizontal: 20),
                  //                   child: Column(
                  //                       mainAxisAlignment:
                  //                           MainAxisAlignment.spaceBetween,
                  //                       children: [
                  //                         Padding(
                  //                           padding: EdgeInsets.only(
                  //                               top: 12, bottom: 7),
                  //                           child: Image(
                  //                             image:
                  //                                 AssetImage(pd[index].Pimage),
                  //                             height: 120,
                  //                             width: 120,
                  //                           ),
                  //                         ),
                  //                         Expanded(
                  //                             child: SizedBox(
                  //                                 child: Text(
                  //                           '${pd[index].Pname}',
                  //                           style: GoogleFonts.poppins(
                  //                               fontSize: 15,
                  //                               color: Color.fromARGB(
                  //                                   255, 65, 48, 79),
                  //                               fontWeight: FontWeight.w600),
                  //                         ))),
                  //                         Text(
                  //                           '${pd[index].Pdesp}',
                  //                           maxLines: 2,
                  //                           overflow: TextOverflow.ellipsis,
                  //                           style: TextStyle(
                  //                             color: Color.fromARGB(
                  //                                 255, 86, 65, 104),
                  //                           ),
                  //                         ),
                  //                         SizedBox(
                  //                           height: 10,
                  //                         ),
                  //                         ElevatedButton(
                  //                           onPressed: () {},
                  //                           child: Text('Order Now',
                  //                               style: TextStyle(
                  //                                 color: Colors.black,
                  //                               )),
                  //                           style: ElevatedButton.styleFrom(
                  //                               backgroundColor: Colors.white,
                  //                               padding: EdgeInsets.symmetric(
                  //                                   horizontal: 30,
                  //                                   vertical: 0)),
                  //                         ),
                  //                         SizedBox(
                  //                           height: 8,
                  //                         )
                  //                       ]),
                  //                 ))
                  //             : Text("gji"),
                  //         childCount: pd.length),
                  //   ),
                  // )
                  // for (int i = 0, c = 0; i < pd.length ~/ 2; i++)
                  //   Row(
                  //     children: [
                  //       for (int j = 0; j < 2; j++, c++)
                  //        Expanded(
                  //       child:  Card(
                  //           color: pd[c].Ccolor,
                  //           child:Padding(padding:EdgeInsets.symmetric(vertical: 0,horizontal: 20) ,
                  //           child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                  //           Padding(padding: EdgeInsets.only(top: 20,bottom: 5),child:
                  //                  Image(
                  //                     image: AssetImage(pd[c].Pimage),
                  //                     height: 120,
                  //                     width: 120,
                  //                   ),),
                  //         Text('${pd[c].Pname}',style: GoogleFonts.poppins(fontSize: 12,color: Color.fromARGB(255, 65, 48, 79),fontWeight: FontWeight.w500),)
                  //         ]),
                  //         )))
                  //     ],
                  //   ),

                  // SizedBox(
                  //     height: 800,
                  //     child: GridView.builder(
                  //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //           crossAxisCount: 2,
                  //           crossAxisSpacing: 4.0,
                  //           mainAxisSpacing: 4.0),
                  //       itemBuilder: (BuildContext context, int index) {
                  //         return Row(children: [
                  //           Expanded(
                  //             child: Card(
                  //                   color: pd[index].Ccolor,
                  //                   child: Padding(
                  //                     padding: EdgeInsets.symmetric(
                  //                         vertical: 0, horizontal: 20),
                  //                     child: Column(
                  //                         mainAxisAlignment:
                  //                             MainAxisAlignment.spaceBetween,
                  //                         children: [
                  //                           Padding(
                  //                             padding: EdgeInsets.only(
                  //                                 top: 20, bottom: 5),
                  //                             child: Image(
                  //                               image: AssetImage(pd[index].Pimage),
                  //                               height: 120,
                  //                               width: 120,
                  //                             ),
                  //                           ),
                  //                             Expanded(
                  //                          child: SizedBox(

                  //                           child:
                  //                          Text(
                  //                             '${pd[index].Pname}',
                  //                             style: GoogleFonts.poppins(
                  //                                 fontSize: 14,
                  //                                 color: Color.fromARGB(
                  //                                     255, 65, 48, 79),
                  //                                 fontWeight: FontWeight.w500),
                  //                           )))
                  //                         ]),
                  //                   )))
                  //         ]);
                  //       },
                  //       itemCount: pd.length,
                  //     )),
                ]),
          ),
        ));
  }
}

// class Tile extends StatefulWidget {
//   Tile(
//       {super.key,
//       required this.index,
//       required this.extent,
//       required this.Ccolor,
//       required this.name,
//       required this.desp,
//       required this.images});
//   final int index;
//   final double extent;
//   final String name;
//   final String desp;
//   final String images;
//   final Color Ccolor;

//   @override
//   State<Tile> createState() => _TileState(
//       index: index,
//       extent: extent,
//       Ccolor: Ccolor,
//       name: name,
//       desp: desp,
//       images: images);
// }

// class _TileState extends State<Tile> {
//   final int index;
//   final double extent;
//   final String name;
//   final String desp;
//   final String images;
//   final Color Ccolor;

//   _TileState(
//       {required this.index,
//       required this.extent,
//       required this.Ccolor,
//       required this.name,
//       required this.desp,
//       required this.images});
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//         color: Ccolor,
//         child: Padding(
//           padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
//           child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(top: 12, bottom: 7),
//                   child: Image(
//                     image: AssetImage(images),
//                     height: 120,
//                     width: 120,
//                   ),
//                 ),
//                 Expanded(
//                     child: SizedBox(
//                         child: Text(
//                   '${name}',
//                   style: GoogleFonts.poppins(
//                       fontSize: 15,
//                       color: Color.fromARGB(255, 65, 48, 79),
//                       fontWeight: FontWeight.w600),
//                 ))),
//                 Text(
//                   '${desp}',
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(
//                     color: Color.fromARGB(255, 86, 65, 104),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 ElevatedButton(
//                   onPressed: () {},
//                   child: Text('Order Now',
//                       style: TextStyle(
//                         color: Colors.black,
//                       )),
//                   style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.white,
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 30, vertical: 0)),
//                 ),
//                 SizedBox(
//                   height: 8,
//                 )
//               ]),
//         ));
//   }
// }

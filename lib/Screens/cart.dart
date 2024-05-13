import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixzzaapp/Screens/BottomModal.dart';
import 'package:pixzzaapp/Provider/CartProv.dart';
import 'package:pixzzaapp/Screens/order.dart';
import 'package:provider/provider.dart';

class cart extends StatefulWidget {
  const cart({super.key});
  // static List cartItems = [];
  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  CartProv cp = CartProv();
  double tPrice = 0;
  double itemqty = 0;
  
  @override
  void initState() {
    super.initState();
    final crp = Provider.of<CartProv>(context, listen: false);
    
    for (int i = 0; i < crp.cartItems.length; i++) {
      tPrice = tPrice + crp.cartItems[i][3];
      itemqty = itemqty + crp.cartItems[i][4];
    }
    print(tPrice);
  }
 
  @override
  Widget build(BuildContext context) {
    final crp = Provider.of<CartProv>(context, listen: true);
    // for (int i = 0; i < crp.cartItems.length; i++) {
    //   tPrice = tPrice + crp.cartItems[i][3];
    //   itemqty = itemqty + crp.cartItems[i][4];
    // }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Cart',
          style: GoogleFonts.poppins(
              fontSize: 40,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 65, 48, 79)),
        ),
        actions: [
          crp.cartItems.length != 0
              ? IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete_rounded,
                    size: 35,
                  ))
              : SizedBox()
        ],
      ),
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
              child: Column(
                children: [
                  crp.cartItems.length == 0
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              Padding(
                                  padding: EdgeInsets.symmetric(vertical: 40),
                                  child: Image.asset('images/empty-cart.webp')),
                              Container(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 50,
                                        child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Color.fromARGB(
                                                    255, 65, 48, 79)),
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  top: 7, left: 10),
                                              child: Text(
                                                'Get Tasty Food, Order now',
                                                style: GoogleFonts.poppins(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255)),
                                              ),
                                            ))),
                                    // Padding(padding: EdgeInsets.only(top: 10)),

                                    for (int i = 0, c = 0; i < 2; i++)
                                      Row(
                                        children: [
                                          for (int j = 0; j < 3; j++, c++)
                                            Expanded(
                                                child: Container(
                                                    child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0, horizontal: 2),
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                        top: 25,
                                                      ),
                                                      child: Image(
                                                        image: AssetImage(
                                                            'images/pizza-png-15.png'),
                                                        height: 110,
                                                        width: 110,
                                                      ),
                                                    ),
                                                    Text(
                                                      '${'Maghrita Pizza'}',
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 14,
                                                        color: Color.fromRGBO(
                                                            65, 48, 79, 1),
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    )
                                                  ]),
                                            )))
                                        ],
                                      ),
                                  ]))
                            ])
                      : SingleChildScrollView(
                          child: Column(children: [
                          SizedBox(
                            height: 680,
                            child: Consumer<CartProv>(
                                builder: (context, value, child) {

                              return ListView.builder(
                                itemBuilder: (context, index) {
                                  final item = value.cartItems[index];
                                  return Dismissible(
                                      direction: DismissDirection.horizontal,

                                      // Each Dismissible must contain a Key. Keys allow Flutter to
                                      // uniquely identify widgets.
                                      key: Key(item.toString()),
                                      // Provide a function that tells the app
                                      // what to do after an item has been swiped away.
                                      onDismissed: (direction) {
                                        // Remove the item from the data source.
                                          tPrice = tPrice -
                                              value.cartItems[index][3];
                                          itemqty = itemqty -
                                              value.cartItems[index][4];
                                          value.removeItem(index);
                                  
                                        // Then show a snackbar.
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text('Item Removed')));
                                                // setState(() {
                                                  
                                                // });
                                      },
                                      // Show a red background as the item is swiped away.
                                      background: Container(
                                          color: Color.fromRGBO(65, 48, 79, 1)),
                                      child: Padding(
                                          padding: EdgeInsets.only(bottom: 10),
                                          child: ListTile(
                                            leading: Image(
                                                image: AssetImage(
                                                    value.cartItems[index][1])),
                                            title:
                                                Text(value.cartItems[index][0]),
                                            subtitle: Text(
                                                value.cartItems[index][2],
                                                maxLines: 2,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                            trailing: Column(
                                              children: [
                                                Text(
                                                  '${value.cartItems[index][4]} Quantity',
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color.fromARGB(
                                                          255, 0, 0, 0)),
                                                ),

                                                Text(
                                                  '\$${value.cartItems[index][3]}',
                                                  style: TextStyle(
                                                      fontSize: 23,
                                                      color: Colors.black),
                                                )
                                                // ])
                                                // ]
                                                //   )
                                              ],
                                            ),
                                          )));
                                },
                                itemCount: value.cartItems.length,
                              );
                            }),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(children: [
                                  Text(
                                    '${itemqty.toInt()} items',
                                    style: GoogleFonts.poppins(fontSize: 15),
                                  ),
                                  Text('\$$tPrice',
                                      style: GoogleFonts.poppins(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500))
                                ]),
                                ElevatedButton(
                                    onPressed: () {
                                      order_placed(context, itemqty.toInt(),
                                          tPrice.toInt());
                                      // showModalBottomSheet(
                                      //     context: context,
                                      //     isDismissible: true,
                                      //     enableDrag: true,
                                      //     // showDragHandle: true,
                                      //     useSafeArea: true,
                                      //     shape: RoundedRectangleBorder(
                                      //         borderRadius: BorderRadius.only(
                                      //             topLeft: Radius.circular(20),
                                      //             topRight:
                                      //                 Radius.circular(20))),
                                      //     builder: (BuildContext context) {
                                      //       return Container(
                                      //         color: Color.fromARGB(
                                      //             255, 255, 255, 255),
                                      //         child: Column(
                                      //           children: [
                                      //             Center(
                                      //               child: Text(
                                      //                 'Order Summary',
                                      //                 style: TextStyle(
                                      //                   color: Color.fromRGBO(65, 48, 79, 1)
                                      //                 ),
                                      //               ),
                                      //             ),
                                      //           ],
                                      //         ),
                                      //       );
                                      //     });
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromARGB(255, 65, 48, 79),
                                        foregroundColor: Colors.white,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 12, horizontal: 25)),
                                    child: Text(
                                      'Place Order',
                                      style: GoogleFonts.poppins(fontSize: 18),
                                    ))
                              ])
                        ]))
                ],
              ))),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:pixzzaapp/AddressPage.dart';
import 'package:pixzzaapp/cart.dart';
import 'package:http/http.dart' as http;

order_placed(BuildContext context, int itemqty, int tPrice) {
  showCupertinoModalPopup(
    context: context,
    builder: (context) {
      return BottomModal(itemqty: itemqty, tPrice: tPrice);
    },
  );
}

class BottomModal extends StatefulWidget {
  BottomModal({required this.itemqty, required this.tPrice});
  List<dynamic> cartItems = cart.cartItems;
  int itemqty, tPrice;

  @override
  State<BottomModal> createState() => _BottomModalState();
}

class _BottomModalState extends State<BottomModal> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            child: CupertinoActionSheet(
              title: Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  'Order Summary',
                  style: GoogleFonts.poppins(
                      fontSize: 30, color: Color.fromRGBO(65, 48, 79, 1)),
                ),
              ),
              message: Column(children: [
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Material(
                              child: ListTile(
                            leading: Image(
                                image: AssetImage(cart.cartItems[index][1])),
                            title: Text(cart.cartItems[index][0]),
                            subtitle: Text(cart.cartItems[index][2],
                                maxLines: 2, overflow: TextOverflow.ellipsis),
                            trailing: Column(
                              children: [
                                Text(
                                  '${cart.cartItems[index][4]} Quantity',
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                ),

                                Text(
                                  '\$${cart.cartItems[index][3]}',
                                  style: TextStyle(
                                      fontSize: 23, color: Colors.black),
                                )
                                // ])
                                // ]
                                //   )
                              ],
                            ),
                          )));
                    },
                    itemCount: widget.cartItems.length,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${widget.itemqty} items',
                      style: GoogleFonts.poppins(
                          color: Colors.black, fontSize: 18),
                    ),
                    Text(
                      'Total Price \$${widget.tPrice}',
                      style: GoogleFonts.poppins(
                          color: Colors.black, fontSize: 18),
                    )
                  ],
                )
              ]),

              actions: [
                TextButton(
                    onPressed: () {
                      print('hi');
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return AddressPage();
                      }));
                    },
                    child: Text(
                      'Add Address',
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Color.fromRGBO(65, 48, 79, 1),
                          fontWeight: FontWeight.w500),
                    ))
              ],
              // cancelButton: TextButton(
              //   child: Text('fg'),
              //   onPressed: () {},
              // ),
            ),
          ),
        )
      ],
    );
  }
}

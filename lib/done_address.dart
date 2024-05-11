import 'dart:async';
import 'package:pixzzaapp/navigationcustom.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:pixzzaapp/cart.dart';
import 'package:lottie/lottie.dart';

// import 'package:http/http.dart' as http;

order_address(BuildContext context, String addr) {
  showCupertinoModalPopup(
    context: context,
    builder: (context) {
      return done_address(addr: addr);
    },
  );
}

class done_address extends StatefulWidget {
  done_address({required this.addr});
  List<dynamic> cartItems = cart.cartItems;
  String addr;

  @override
  State<done_address> createState() => _done_addressState();
}

class _done_addressState extends State<done_address> {
  showmess() {
    Timer(Duration(seconds: 2), () {
      return showorderdialog(context);
    });
  }

  bool ani = false;
  // late ConfettiController _controllerBottomCenter;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            child: CupertinoActionSheet(
              // title: Padding(
              //   padding: EdgeInsets.only(bottom: 10),
              //   child: Text(
              //     'Order Summary',
              //     style: GoogleFonts.poppins(
              //         fontSize: 30, color: Color.fromRGBO(65, 48, 79, 1)),
              //   ),
              // ),
              message: Column(children: [
                SizedBox(
                  height: 200,
                  child: Column(children: [
                    Text(
                      'Your order will be delivered within 30 minutes',
                      style: GoogleFonts.poppins(
                          color: Color.fromARGB(255, 20, 20, 20), fontSize: 17),
                    ),
                    Text(
                      'At ${widget.addr}',
                      style: GoogleFonts.poppins(
                          color: Color.fromARGB(255, 83, 83, 83), fontSize: 17),
                    ),
                  ]),
                )
              ]),

              actions: [
                TextButton(
                    onPressed: () {
                      print('hi');
                      setState(() {
                        ani = true;
                        print(ani);
                      });
                      showmess();
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (BuildContext context) {
                      //   return cart();
                      // }));
                    },
                    child: Text(
                      'Place order',
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
        ),
        Positioned(
          top: -80,
          child: LottieBuilder.asset(
            "images/lottie_ani.json",
            animate: ani,
            // fit: BoxFit.fill,
            repeat: false,
            height: MediaQuery.of(context).size.height * 0.4,
            width: 450,
            options: LottieOptions(enableApplyingOpacityToLayers: true),
          ),
        ),
      ],
    );
  }
}

showorderdialog(BuildContext context) {
  return QuickAlert.show(
    context: context,
    type: QuickAlertType.confirm,
    text: 'Your Order has been placed Successfully !',
    confirmBtnText: 'Track Order',
    cancelBtnText: "Shop More",
    confirmBtnColor: Color.fromRGBO(65, 48, 79, 1),
    title: "Success",
    onConfirmBtnTap: () {
      // GoRouter.of(context).pushNamed(Routers.mappage.name,
      //     pathParameters: {'flag': 'true', 'pad': '20'});
    },
    onCancelBtnTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>navigationcustom()));
      // GoRouter.of(context).pushNamed(Routers.navigation.name);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Color.fromRGBO(65, 48, 79, 1),
          content: Text(
            "Thanks for Ordering 😄",
            style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontFamily: 'Urbanist-Italic'),
          )));
    },
    barrierColor: Colors.grey.shade400.withOpacity(0.7),
  );
}

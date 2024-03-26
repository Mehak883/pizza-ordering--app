import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class cart extends StatefulWidget {
  const cart({super.key});

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  List cartItems = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Your Cart',
                        style: GoogleFonts.poppins(
                            fontSize: 40,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 65, 48, 79)),
                      ),
                    ],
                  ),
                  cartItems.length == 0
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              Padding(
                                  padding: EdgeInsets.symmetric(vertical: 50),
                                  child: Image.asset('images/empty-cart.webp')),
                              Container(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                    Text(
                                      'Get Tasty Food, Order now',
                                      style: GoogleFonts.poppins(
                                          fontSize: 23,
                                          color:
                                              Color.fromARGB(255, 65, 48, 79)),
                                    ),
                                    Padding(padding: EdgeInsets.only(top: 10)),
                                    SizedBox(
                                        height: 300,
                                        child: GridView.builder(
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2),
                                          itemBuilder: (context, index) {
                                            return SizedBox(
                                                height:80,
                                                width: 80,
                                                child: Card(
                                                  child: Column(
                                                    children: [
                                                      Image.asset('images/pizza-png-15.png'),
                                                      Text('$index'),                
                                                    ],
                                                  ),
                                                ));
                                          },
                                          itemCount: 6,
                                          scrollDirection: Axis.horizontal,
                                        ))
                                  ]))
                            ])
                      : Text('type something here')
                ],
              ))),
    );
  }
}

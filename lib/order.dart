import 'package:flutter_add_to_cart_button/flutter_add_to_cart_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixzzaapp/Provider/LikesProv.dart';
import 'package:pixzzaapp/cart.dart';
import 'package:provider/provider.dart';
// import 'package:carousel_indicator/carousel_indicator.dart';

// import 'package:cupertino_icons/cupertino_icons.dart';

class order extends StatefulWidget {
  order(
      {required this.Pdesp,
      required this.Pimage,
      required this.Pname,
      required this.Pprice});
  String Pname;
  String Pdesp;
  String Pimage;
  int Pprice;
  int sml = 0;
  @override
  State<order> createState() =>
      _orderState(Pname: Pname, Pdesp: Pdesp, Pimage: Pimage, Pprice: Pprice);
}

class _orderState extends State<order> {
  _orderState(
      {required this.Pname,
      required this.Pdesp,
      required this.Pimage,
      required this.Pprice}) {
    viewimage.add(Pimage);
    viewimage.add(Pimage);
    viewimage.add(Pimage);
    spizza = Pprice;
    mpizza = (Pprice * 2) - 5;
    lpizza = (Pprice * 3) - 15;
    price = Pprice;
  }
  String Pname;
  int price = 0;
  String Pdesp;
  String Pimage;
  int Pprice;
  int selectedIndex = 1;
  int pageIndex = 1;
  int quantity = 1;
  int spizza = 0, mpizza = 0, lpizza = 0;
  AddToCartButtonStateId stateId = AddToCartButtonStateId.idle;
  List<String> viewimage = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: 430,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(221, 235, 218, 247)),
              child: Padding(
                padding: const EdgeInsets.only(top: 20, right: 20),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, right: 15, left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.popAndPushNamed(
                                  context, '/Navigation Custom');
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              size: 30,
                              color: Colors.black,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          cart()));
                            },
                            icon: SvgPicture.asset(
                              'images/shopping-bag.svg',
                              height: 30,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 420,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              // clipBehavior: Clip.antiAlias,
              // height: MediaQuery.of(context).size.height * 0.7,
              // width: 300,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(55),
                      topRight: Radius.circular(55))),
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                  children: [
                    // child:
                    Row(children: [
                      Padding(
                        padding: EdgeInsets.only(left: 27),
                        child: Text(
                          Pname,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 65, 48, 79),
                            fontSize: 27,
                            fontWeight: FontWeight.w700,
                          ),
                          // ),
                        ),
                      )
                    ]),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 27,
                        ),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                quantity = 1;
                                price = spizza;
                                selectedIndex = 1;
                                Pprice = spizza;
                              });
                            },
                            child: Text(
                              'Small',
                              style: GoogleFonts.poppins(
                                  color: Color.fromARGB(255, 65, 48, 79)),
                            ),
                            style: ButtonStyle(
                                side: MaterialStateProperty.all<BorderSide>(
                                  BorderSide(
                                      color: Color.fromARGB(221, 235, 218,
                                          247)), // Set the border color here
                                ),
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.symmetric(
                                        horizontal: 23, vertical: 7)),
                                backgroundColor: selectedIndex == 1
                                    ? MaterialStateProperty.all<Color>(
                                        Color.fromARGB(221, 235, 218, 247))
                                    : MaterialStateProperty.all<Color>(
                                        Colors.white))),
                        SizedBox(
                          width: 27,
                        ),
                        TextButton(
                            onPressed: () {
                              quantity = 1;
                              setState(() {
                                price = mpizza;
                                Pprice = mpizza;
                                selectedIndex = 2;
                              });
                            },
                            child: Text(
                              'Medium',
                              style: GoogleFonts.poppins(
                                  color: Color.fromARGB(255, 65, 48, 79)),
                            ),
                            style: ButtonStyle(
                                side: MaterialStateProperty.all<BorderSide>(
                                  BorderSide(
                                      color: Color.fromARGB(221, 235, 218,
                                          247)), // Set the border color here
                                ),
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.symmetric(
                                        horizontal: 23, vertical: 7)),
                                backgroundColor: selectedIndex == 2
                                    ? MaterialStateProperty.all<Color>(
                                        Color.fromARGB(221, 235, 218, 247))
                                    : MaterialStateProperty.all<Color>(
                                        Colors.white))),
                        SizedBox(
                          width: 27,
                        ),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                quantity = 1;
                                price = lpizza;
                                Pprice = lpizza;
                                selectedIndex = 3;
                              });
                            },
                            child: Text(
                              'Large',
                              style: GoogleFonts.poppins(
                                  color: Color.fromARGB(255, 65, 48, 79)),
                            ),
                            style: ButtonStyle(
                                side: MaterialStateProperty.all<BorderSide>(
                                  BorderSide(
                                      color: Color.fromARGB(221, 235, 218,
                                          247)), // Set the border color here
                                ),
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.symmetric(
                                        horizontal: 23, vertical: 7)),
                                backgroundColor: selectedIndex == 3
                                    ? MaterialStateProperty.all<Color>(
                                        Color.fromARGB(221, 235, 218, 247))
                                    : MaterialStateProperty.all<Color>(
                                        Colors.white))),
                      ],
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 10, right: 20, left: 30),
                        child: SizedBox(
                          height: 70,
                          child: Text(
                            Pdesp,
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: const Color.fromARGB(255, 130, 130, 130),
                              // fontWeight: FontWeight.w800,
                            ),
                            overflow: TextOverflow.fade,
                            // maxLines: 3,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Text(
                              'Delivery Time',
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 65, 48, 79),
                                  fontWeight: FontWeight.w500),
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.access_time_rounded,
                          size: 20,
                          color: Color.fromARGB(255, 65, 48, 79),
                        ),
                        Text('15min',
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Color.fromARGB(255, 65, 48, 79),
                                fontWeight: FontWeight.w500))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 30,
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    quantity += 1;
                                    price += Pprice;
                                  });
                                },
                                style: ButtonStyle(
                                  side: MaterialStateProperty.all<BorderSide>(
                                    BorderSide(
                                        color: Color.fromARGB(221, 189, 169,
                                            204)), // Set the border color here
                                  ),
                                ),
                                icon: const Icon(
                                  CupertinoIcons.add,
                                  size: 25,
                                  color: Color.fromARGB(255, 65, 48, 79),
                                )),
                            SizedBox(
                              height: 50,
                              width: 50,
                              child: Center(
                                child: Text(
                                  quantity.toString(),
                                  style: const TextStyle(
                                      fontSize: 25,
                                      color: Color.fromARGB(255, 65, 48, 79),
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Urbanist-Italic'),
                                ),
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (quantity > 1) {
                                      quantity -= 1;
                                      price -= Pprice;
                                    }
                                  });
                                },
                                style: ButtonStyle(
                                  side: MaterialStateProperty.all<BorderSide>(
                                    BorderSide(
                                        color: Color.fromARGB(221, 189, 169,
                                            204)), // Set the border color here
                                  ),
                                ),
                                icon: const Icon(
                                  CupertinoIcons.minus,
                                  size: 25,
                                  color: Color.fromARGB(255, 65, 48, 79),
                                )),
                          ],
                        ),

                        const SizedBox(
                          width: 110,
                        ),
                        // GestureDetector(
                        //   onTap: () {
                        // if (!flag) {
                        //   setState(() {
                        //     getadddata();
                        //     dataprovider.setlist(adddata);
                        //     flag = true;
                        //     ScaffoldMessenger.of(context)
                        //         .showSnackBar(const SnackBar(
                        //             backgroundColor: Colors.green,
                        //             content: Text(
                        //               "Item Added Successfully 🙂",
                        //               style: TextStyle(
                        //                   fontSize: 16,
                        //                   color: Colors.white,
                        //                   fontWeight: FontWeight.w500,
                        //                   fontFamily: 'Urbanist-Italic'),
                        //             )));
                        //   });
                        // } else {
                        //   ScaffoldMessenger.of(context)
                        //       .showSnackBar(const SnackBar(
                        //           backgroundColor: Colors.red,
                        //           content: Text(
                        //             "This item has already added 🙃 ",
                        //             style: TextStyle(
                        //                 fontSize: 16,
                        //                 color: Colors.white,
                        //                 fontWeight: FontWeight.w500,
                        //                 fontFamily: 'Urbanist-Italic'),
                        //           )));
                        // }
                        // },
                        // child:

                        FittedBox(
                          child: Text(
                            '\$' + price.toString() + '.00',
                            style: GoogleFonts.poppins(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    // SizedBox(width: 370,height: 55,child: ElevatedButton(onPressed: (){}, child: Text('Add to cart', textAlign: TextAlign.center,
                    //       style: GoogleFonts.poppins(
                    //           fontSize: 20, color: Colors.white),)),),
                    SizedBox(
                      width: 370,
                      height: 55,
                      //   child: AddToCartButton(
                      //     // trolley: SvgPicture.asset(
                      //     //   'images/shopping-bag.svg',
                      //     //   width: 24,
                      //     //   height: 24,
                      //     //   color: Color.fromARGB(255, 255, 255, 255),
                      //     // ),
                      //     trolley: Icon(
                      //       Icons.shopping_cart_outlined,
                      //       color: Colors.white,
                      //       size: 25,
                      //     ),
                      //     text: Text(
                      //       'Add to cart',
                      //       textAlign: TextAlign.center,
                      //       style: GoogleFonts.poppins(
                      //           fontSize: 20, color: Colors.white),
                      //       maxLines: 1,
                      //       overflow: TextOverflow.fade,
                      //     ),
                      //     check: SizedBox(
                      //       width: 48,
                      //       height: 48,
                      //       child: Icon(
                      //         Icons.check,
                      //         color: Colors.white,
                      //         size: 24,
                      //       ),
                      //     ),
                      //     borderRadius: BorderRadius.circular(30),
                      //     backgroundColor: Color.fromARGB(255, 65, 48, 79),
                      //     onPressed: (id) {
                      //       if (id == AddToCartButtonStateId.idle) {
                      //         //handle logic when pressed on idle state button.
                      //         setState(() {
                      //           stateId = AddToCartButtonStateId.loading;
                      //           Future.delayed(Duration(seconds: 3), () {
                      //             setState(() {
                      //               stateId = AddToCartButtonStateId.done;
                      //             });
                      //           });
                      //         });
                      //       } else if (id == AddToCartButtonStateId.done) {
                      //         //handle logic when pressed on done state button.
                      //         setState(() {
                      //           stateId = AddToCartButtonStateId.idle;
                      //         });
                      //       }
                      //       cart.cartItems.add([
                      //         Pname,
                      //         Pimage,
                      //         Pdesp,
                      //         Pprice * quantity,
                      //         quantity
                      //       ]);
                      //     },
                      //     stateId: stateId,
                      //   ),
                      // )
                      child: ElevatedButton(
                          onPressed: () {
                            cart.cartItems.add([
                              Pname,
                              Pimage,
                              Pdesp,
                              Pprice * quantity,
                              quantity
                            ]);
                            setState(() {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                      backgroundColor: Colors.green,
                                      content: Text(
                                        "Item Added Successfully 🙂",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Urbanist-Italic'),
                                      )));
                              // ););
                            });
                          },
                          child: Text(
                            'Add to Cart',
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 130),
                            backgroundColor: Color.fromARGB(255, 65, 48, 79),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 80,
            bottom: 450,
            right: 80,
            child: Container(
              height: 400,
              width: 400,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: PageView(
                children: [
                  Image.asset(Pimage),
                  Image.asset(Pimage),
                  Image.asset(Pimage)
                ],
                onPageChanged: (index) {
                  setState(() {
                    pageIndex = index;
                  });
                },
              ),
              // child: Hero(
              //   tag: '24',
              //   child: Image.asset(
              //     "images/pizza-png-15.png",
              //     fit: BoxFit.contain,
              //   ),
              // ),
            ),
          ),
          //  SizedBox(height: 0,),
          Positioned(
              top: 360,
              left: 157,
              child: SizedBox(
                  height: 4,
                  width: 225,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            print('hi');
                          },
                          child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: SizedBox(
                                  height: 3,
                                  width: index == pageIndex ? 28 : 16,
                                  child: (Container(
                                    // color: Color.fromARGB(255, 22, 16, 76),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15.0),
                                      ),
                                      color: index == pageIndex
                                          ? Color.fromARGB(255, 65, 48, 79)
                                          : Color.fromARGB(255, 123, 107, 137),
                                    ),
                                  )))));
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                  ))
              //       child:CarouselIndicator(
              //   count: 3,
              // activeColor: Color.fromARGB(255, 65, 48, 79),
              // color:Color.fromARGB(255, 65, 48, 79) ,
              // width:30,
              //   index: pageIndex,

              // ),
              ),
          Positioned(
              // top: 0,
              left: 260,
              bottom: 445,
              right: 10,
              child: Consumer<LikesProv>(builder: (context, value, child) {
                return GestureDetector(
                  onTap: () {
                    
                  },
                  child: Container(
                    height: 55,
                    width: 55,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 65, 48, 79)),
                    child: Center(
                        child: SvgPicture.asset(
                      "images/fav.svg",
                      height: 25,
                      width: 25,
                      color: Colors.white,
                    )
                        // fit: BoxFit.contain,
                        ),
                  ),
                );
              }))
        ],
      ),
    );
  }
}

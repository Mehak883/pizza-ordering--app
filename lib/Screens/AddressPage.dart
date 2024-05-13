import 'dart:convert';
import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:pixzzaapp/Screens/done_address.dart';
import 'package:uuid/uuid.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  TextEditingController _searchCont = TextEditingController();
  var uuid = Uuid();
  // String _sessionToken = '123456';
  List<dynamic> _placesList = [];
  String addr = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _searchCont.addListener(() {
      onChange();
    });
  }

  void onChange() {
    // if (_sessionToken == null) {
    //   setState(() {
    //     _sessionToken = uuid.v4();
    //   });
    // }
    getSuggestion(_searchCont.text);
  }

  Future<List<dynamic>> getSuggestion(String input) async {
    print(input);
    // String kPLACES_API_KEY = 'AIzaSyA98Y4NU51yAOkF8O6V3kClNn7ayVVzuu4';
    String kPLACES_API_KEY = 'AIzaSyC3gr9TOUlUD4L_QLlrzFxnAVpU8-cvvNo';

    // String baseURL =
    // 'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    // String request =
    // '$baseURL?input=$input&key=$kPLACES_API_KEY&sessiontoken=$_sessionToken';
    final request = "http://www.postalpincode.in/api/pincode/$input";
    var response = await http.get(Uri.parse(request));
    print(response.body.toString());
    if (response.statusCode == 200) {
      
       final jsonRes= jsonDecode(response.body);
        if (jsonRes['Status'] == 'Error') {}
        else{
        print("hloooo");
          setState(() {
          _placesList =jsonRes['PostOffice'] as List;
            });
      print(_placesList[0]['Name']);

        }
      return _placesList;
    } else {
      throw Exception('Failed to load data');
    }
  }
// 69dd39b634994a5a91c12f99bd1d932a
// https://api.geoapify.com/v2/places?categories=commercial.supermarket&filter=rect%3A10.716463143326969%2C48.755151258420966%2C10.835314015356737%2C48.680903341613316&limit=20&apiKey=69dd39b634994a5a91c12f99bd1d932a

  // Future<List<dynamic>> _fetchSupermarkets(String query) async {
  //   final response = await http.get(Uri.parse(
  //       'https://api.geoapify.com/v2/places?categories=commercial.supermarket&filter=rect%3A10.716463143326969%2C48.755151258420966%2C10.835314015356737%2C48.680903341613316&limit=20&apiKey=69dd39b634994a5a91c12f99bd1d932a&text=$query'));

  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> jsonResponse = json.decode(response.body);
  //     List<dynamic> results = jsonResponse['features'];
  //     print(results[0]);
  //     return results;
  //   } else {
  //     throw Exception('Failed to load supermarkets');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 300,
                            child: TextField(
                                controller: _searchCont,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Search for your delivery location',
                                  isDense: true,
                                  isCollapsed: true,
                                  hintStyle: GoogleFonts.poppins(
                                      color: Color.fromARGB(255, 108, 108, 108),
                                      fontSize: 18),
                                )),
                          ),
                          Icon(Icons.search),
                        ])))),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
            child: Container(
                color: Color.fromRGBO(65, 48, 79, 1),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(children: [
                    Container(
                      height: 35,
                      width: 35,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 132, 110, 146)),
                      child: Center(
                          child: Icon(
                        Icons.location_on,
                        color: Colors.white,
                      )
                          // fit: BoxFit.contain,
                          ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 132,
                      child: Text(
                        'Give us your exact location for seamless delivery',
                        maxLines: 3,
                        style: GoogleFonts.poppins(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: 11,
                    ),
                    TextButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(65, 48, 79, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                                side: BorderSide(color: Colors.white))),
                        child: Text(
                          'Use Current Location',
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 15.5),
                        ))
                  ]),
                ))),
        SizedBox(
            height: 500,
            child: _searchCont.text.length < 6 && _searchCont.text.length > 1
                ? Center(
                    child: SizedBox(
                        height: 40,
                        child: CircularProgressIndicator(
                          strokeWidth: 5,
                        )))
                : SingleChildScrollView(
                    child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _placesList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: GestureDetector(
                          onTap: () {
                            order_address(context,
                                '${_placesList[index]['Name']}, ${_placesList[index]['District']}, ${_placesList[index]['State']}');
                          },
                          child: Text(_placesList[index]['Name'] +
                              ', ' +
                              _placesList[index]['District'] +
                              ', ' +
                              _placesList[index]['State']),
                        ),
                      );
                    },
                  )))
      ]))),
    );
  }
}

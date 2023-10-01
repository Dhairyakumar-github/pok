import 'dart:convert';

// import 'package:first/Api3/pokDataModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pok/pokDataModel.dart';

class PokTrialHome extends StatefulWidget {
  const PokTrialHome({super.key});

  @override
  State<PokTrialHome> createState() => _PokTrialHomeState();
}

class _PokTrialHomeState extends State<PokTrialHome> {
  Future<List<PokData2>>? _dataFuture;
  List<PokData2> products = [];
  final api = "https://dhairyakumar-github.github.io/trial/trial.json";
  Future<List<PokData2>> getData() async {
    var response = await http.get(Uri.parse(api));
    var data = await jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        products.add(PokData2.fromJson(index));
      }
      // print(products);
      return products;
    } else {
      return products;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dataFuture = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 43, 41, 41),
      body: SafeArea(
        child: FutureBuilder(
          future: _dataFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: Text("Waighting"));
            } else {
              return SingleChildScrollView(
                // physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "Explore",
                        style: TextStyle(fontSize: 32, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          return Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: Color.fromARGB(255, 156, 178, 209),
                                width: 100,
                                height: 200,
                              ),
                            ),
                          );
                        })
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

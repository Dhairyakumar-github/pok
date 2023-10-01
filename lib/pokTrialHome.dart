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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "Explore",
                        style: TextStyle(
                            fontSize: 32,
                            color: Color.fromARGB(255, 225, 214, 214)),
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
                            child: Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 230,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      products[index].poster.toString(),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromARGB(255, 156, 178, 209),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6),
                                      child: Text(
                                        "Season: ${products[index].seasonNum}",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                            color: Color.fromARGB(
                                                255, 255, 255, 255)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        "Ep: ${products[index].totalEp}",
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                            color: Color.fromARGB(
                                                222, 239, 237, 237)),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    )
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

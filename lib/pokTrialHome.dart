import 'dart:convert';

// import 'package:first/Api3/pokDataModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pok/episodPage.dart';
import 'package:pok/pokDataModel.dart';

class PokTrialHome extends StatefulWidget {
  const PokTrialHome({super.key});

  @override
  State<PokTrialHome> createState() => _PokTrialHomeState();
}

class _PokTrialHomeState extends State<PokTrialHome> {
  bool isOffline = false;
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
    // checkConnectivity();
    // Connectivity().onConnectivityChanged.listen((result) {
    //   setState(() {
    //     isOffline = (result == ConnectivityResult.none);
    //   });
    // });
  }

  // Future<void> checkConnectivity() async {
  //   final connectivityResult = await Connectivity().checkConnectivity();
  //   setState(() {
  //     isOffline = (connectivityResult == ConnectivityResult.none);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 43, 41, 41),
      body: SafeArea(
        child: FutureBuilder(
          future: _dataFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "Explore",
                        style: TextStyle(
                            fontSize: 32,
                            color: Color.fromARGB(255, 225, 214, 214)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EpisodsPage(
                                          data: products[index],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 230,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color.fromARGB(
                                          255, 156, 178, 209),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            child: Image.network(
                                              products[index].poster.toString(),
                                              fit: BoxFit.cover,
                                              width: double.infinity,
                                              height: double.infinity,
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 0.0,
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.3,
                                              decoration: const BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Color.fromARGB(
                                                        0, 39, 29, 29),
                                                    Color.fromARGB(
                                                        224, 27, 25, 25),
                                                  ],
                                                  stops: [0.1, 0.9],
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  // transform:
                                                  //     GradientRotation(5 / 10),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            width: 350,
                                            left: 10,
                                            bottom: 20,
                                            child: Text(
                                              products[index]
                                                  .seasonTitle
                                                  .toString(),
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
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
                                        style: const TextStyle(
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
                                        style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                            color: Color.fromARGB(
                                                222, 239, 237, 237)),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
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

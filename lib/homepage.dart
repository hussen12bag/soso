import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_finder/components/gridview.dart';
import 'package:hotel_finder/components/textform.dart';
import 'package:hotel_finder/theme/colors.dart';
import 'package:hotel_finder/theme/fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> rooms = [];

  @override
  void initState() {
    super.initState();
    fetchRooms();
    Rooms();
  }

  Future<void> fetchRooms() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8000/api/getRooms'));
    print(response.statusCode);
    if (response.statusCode == 200) {
      setState(() {
        rooms = json.decode(response.body);
      });
    } else {
      // Handle error
      ('Failed to load rooms');
    }
  }

  Future<void> Rooms() async {
    final response = await http
        .get(Uri.parse('http://10.0.2.2:8000/api/getMostPopularRooms'));
    print(response.statusCode);
    if (response.statusCode == 200) {
      setState(() {
        rooms = json.decode(response.body);
      });
    } else {
      // Handle error
      ('Failed to load rooms');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 310,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/6.png")),
              color: Colors.black,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          child: SvgPicture.asset(
                            "assets/images/location.svg",
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Norway",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          child: SvgPicture.asset(
                            "assets/images/user.svg",
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 50,
              ),
              Text(
                textAlign: TextAlign.center,
                "Hey, Martin! Tell us where you ",
                style: mainwfont,
              ),
              Text(
                textAlign: TextAlign.center,
                "want to go ",
                style: mainwfont,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomFormField(
                  hint: 'Data Range',
                  cursor_color: maincolor,
                  prefix_icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  label: Text(
                    "search places",
                    style: subwfont,
                  ),
                  index: 1,
                  style: subwfont,
                  hintStyle: subwfont,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "The most relevant",
            style: titleb,
          ),
        ),
        Container(
            height: 300,
            child: FutureBuilder(
              future: fetchRooms(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data['id']['hotel_id'].length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final room = rooms[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                        height: 200,
                                        width: 300,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(snapshot
                                                    .data['image'][index])),
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            color: Colors.grey),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                        )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(snapshot.data['name'][index]
                                        .split(" ")
                                        .first),
                                    SizedBox(
                                      width: 80,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.black,
                                        ),
                                        Text("4.96"),
                                      ],
                                    ),
                                  ],
                                ),
                                Text("price : ${room['price']}")
                              ],
                            ),
                          ),
                        );
                      });
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Text("ssssssssss");
                }
              },
            )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Most Popular Rooms",
            style: titleb,
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder(
              future: Rooms(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12.0,
                      mainAxisSpacing: 12.0,
                      mainAxisExtent: 310,
                    ),
                    itemCount: snapshot.data['rooms'].length,
                    itemBuilder: (_, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            16.0,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(16.0),
                                topRight: Radius.circular(16.0),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data['rooms'][index]['name'],
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  Text(
                                    snapshot.data['rooms'][index]['desc'],
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Text("");
                }
              },
            ))
      ])),
    ));
  }
}

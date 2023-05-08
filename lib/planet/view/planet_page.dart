import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planet/planet/controller/planet_controller.dart';

class PlanetViewPage extends StatefulWidget {
  const PlanetViewPage({Key? key}) : super(key: key);

  @override
  State<PlanetViewPage> createState() => _PlanetViewPageState();
}

class _PlanetViewPageState extends State<PlanetViewPage>
    with TickerProviderStateMixin {
  HomeController homeController = Get.put(HomeController());
  AnimationController? animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Container(
                    child: Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height + 20,
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset(
                            "${homeController.h1.value.view_image}",
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 30,
                  ),
                  color: Color(0xff413b6b),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 120,
                          left: 20,
                        ),
                        child: Text(
                          "OVERVIEW",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        height: 3,
                        width: 120,
                        margin: EdgeInsets.only(
                          top: 7,
                          left: 20,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      Container(
                        height: 200,
                        width: 420,
                        margin: EdgeInsets.only(
                          top: 15,
                          left: 20,
                          right: 20,
                        ),
                        child: Text(
                          "${homeController.h1.value.overview}",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Center(
              child: Container(
                height: 200,
                width: 300,
                decoration: BoxDecoration(
                  color: Color(0xFF4A488C),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 15,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 70,
                      ),
                      child: Text(
                        "${homeController.h1.value.name}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      "Milkyway Glaxey",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 3,
                      width: 120,
                      margin: EdgeInsets.only(
                        top: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 25,
                        left: 25,
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            child: Image.asset(
                              "assets/image/ic_distance.png",
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "${homeController.h1.value.distance} km",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 20,
                            width: 20,
                            child: Image.asset(
                              "assets/image/ic_gravity.png",
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "${homeController.h1.value.gravity} m/s²",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                  padding: EdgeInsets.only(
                    bottom: 230,
                  ),
                  child: AnimatedBuilder(
                    animation: animationController!,
                    child: Container(
                      height: 140,
                      width: 140,
                      child: Image.asset(
                        "${homeController.h1.value.image}",
                      ),
                    ),
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: animationController!.value * 2 * pi,
                        child: child,
                      );
                    },
                  )),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        height: MediaQuery.of(context).size.height,
                        color: Color(0xff3b368f),
                        child: Column(
                          children: [
                            Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Colors.blue.shade800,
                                  Colors.blue.shade300,
                                ]),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                "WELCOME TO ${homeController.h1.value.name}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 130,
                              width: 130,
                              child: Image.asset(
                                "${homeController.h1.value.image}",
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Distance To Sun",
                              style: TextStyle(
                                color: Colors.white60,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "${homeController.h1.value.distance_sun} km",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Distance To Earth",
                              style: TextStyle(
                                color: Colors.white60,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "${homeController.h1.value.distance_earth} km",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue.shade800,
                        Colors.blue.shade300,
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Container(
                          height: 50,
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white70,
                                size: 21,
                              ),
                              Text(
                                "BACK",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
import 'dart:developer';

import 'package:appmigo_f/component/cuntom_shape.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  Widget _buildGradientContailner(double width, double height) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: width * .8,
        height: height / 1.4,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFFfbfcfd),Color(0xFFf2f3f8) ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.5, 1.0]
          ),
        ),
      ),
    );
  }

  Widget _bluidShapeTopContainer() {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomClipShape(),
          child:  Container(
            height: 430,
            color: Colors.deepPurple,
            child: Column(
              children: <Widget>[
                SizedBox(height: 50.0),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.location_on, color: Colors.white),
                            onPressed: () {

                            },
                          ),
                          SizedBox(width: 16),
                          PopupMenuButton(
                            child: Row(
                              children: <Widget>[
                                Text("Yo", style: TextStyle(color: Colors.white)),
                                Icon(Icons.person_outline, color: Colors.white)
                              ],
                            ),
                              itemBuilder: (BuildContext contex) => <PopupMenuItem<int>> [
                                PopupMenuItem(
                                    child: Text("Yo"),
                                ),
                                PopupMenuItem(
                                  child: Text("Mi Casa"),
                                ),
                                PopupMenuItem(
                                  child: Text("Lugar de Trabajo"),
                                ),
                                PopupMenuItem(
                                  child: Row(
                                    children: <Widget>[
                                      Icon(Icons.add),
                                      Text("Agregar")
                                    ],
                                  ),
                                )
                              ]
                          )
                        ],
                      ),

                      IconButton(
                        icon: Icon(Icons.settings, color: Colors.white),
                        onPressed: () {
                          log('Press');
                        },
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(60),
                  child: Text(
                    "Por el momento todo esta en orden",
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: "Comforta",
                      color: Colors.white
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),

                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrain) {
        var width = constrain.maxWidth;
        var height = constrain.maxHeight;
        return Stack(
          fit: StackFit.expand,
          children: <Widget>[
            _buildGradientContailner(width, height),
            _bluidShapeTopContainer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: height * .35,
                child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 35.0, bottom: 60.0),
                      child: SizedBox(
                        width: 150,
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 40.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12.0),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black12,
                                          offset: Offset(0.0, 10.0),
                                          blurRadius: 10.0
                                      )]
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 50.0),
                                    child: Text("$index"),
                                  )
                              ],
                            )
                          ],
                        ),
                      ),
                    );},
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
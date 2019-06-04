import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'component/cuntom_shape.dart';
import 'component/radial_painter.dart';



class HomePage extends StatefulWidget {

  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  var selectedvigiaAppmigo = 1;
  var covert = [];
  double widthbox = 150;

  var fire_covert = Firestore.instance.collection('LOCATION').document("10000").collection("COVERT");

  void _dataInitial() {
    List data = [
      {'name': 'Mi Ubicacion',
        'value': 1,'id': '001' ,'icon': 59391},
      {'name': 'Mi Casa', 'icon': 59530,
        'value': 2,'definido': false },
      {'name': 'Lugar de Trabajo', 'icon': 59530,
        'value': 3,'definido': false },
      { 'name': 'Agregar',
        'value': 0,'icon': 57669},
    ];
    data.forEach((e) {
      fire_covert.document('${e['value']}').setData(e);
    });
  }
  void _registrarData() {
    print("Carogoo");
    var snap = fire_covert.getDocuments();
    snap.then((docs) {
      setState(() {
        covert = docs.documents.toList();
      });
    });
  }

  @override
  void initState() {
    _dataInitial();
    _registrarData();
    super.initState();
  }

  void _changeSelecteItem(int index) {
    if (index == 0) {
      print("Eso");
      fire_covert.document('${covert.length}').setData({
        'name': 'Otra',
        'value': covert.length,'icon': 59391}
      );
      _registrarData();
    } else {
      setState(() {
        selectedvigiaAppmigo = index;
      });
    }
  }

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
                          SizedBox(width: 10),
                          PopupMenuButton(
                              onSelected: (index) {
                                _changeSelecteItem(index);
                              },
                              child: Row(
                                children: <Widget>[
                                  Text( covert.length != 0 ? covert[selectedvigiaAppmigo].data['name'] : 'load' , style: TextStyle(color: Colors.white)), SizedBox(width: 10),
                                  Icon( covert.length != 0 ? IconData(covert[selectedvigiaAppmigo].data['icon'], fontFamily: 'MaterialIcons') : Icons.cached , color: Colors.white)
                                ],
                              ),
                              itemBuilder: (BuildContext contex) {
                                if (covert.length != 0) {
                                  return covert.map((item) {
                                    return PopupMenuItem(
                                      value: item.data['value'],
                                      child:  item.data['icon'] == 57669 ? Row(
                                        children: <Widget>[
                                          Icon(IconData(item.data['icon'], fontFamily: 'MaterialIcons')),
                                          Text(item.data['name'])
                                        ],
                                      ) : Text(item.data['name']),
                                    );
                                  }).toList();
                                }
                              }
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

  _renderBoxItems(int index, double heigbox) {
    switch(index) {
      case 0:
        return RadialGrade();
      case 1:
        return null;
      default:
        return Text(index.toString());
    }
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
                        width: widthbox,
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
                                  child: _renderBoxItems(index, height),
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




import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedFood = 'BURGER';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: <Widget>[
          new Stack(
            children: <Widget>[
              new Container(
                height: 400,
              ),
              new ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.black, Colors.transparent])
                      .createShader(
                          Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: new Image.asset(
                  "images/tokyo2.jpg",
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
              new RotatedBox(
                quarterTurns: 3,
                child: new Text(
                  "JAPAN",
                  style: new TextStyle(
                      fontSize: 85,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.25),
                      letterSpacing: 10),
                ),
              ),
              new Positioned(
                  top: 15,
                  right: 15,
                  child: new Container(
                    height: 40,
                    width: 40,
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: new Center(
                      child: new Icon(Icons.menu),
                    ),
                  )),
              new Positioned(
                  top: 15,
                  right: 15,
                  child: new Container(
                    height: 12,
                    width: 12,
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Color(0xFFFD3664)),
                  )),
              new Positioned(
                  top: 190.0,
                  left: 40.0,
                  child: Column(
                    children: <Widget>[
                      Text('WELCOME TO',
                          style: TextStyle(
                              fontFamily: 'Oswald',
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))
                    ],
                  )),
              new Positioned(
                  top: 220,
                  left: 40,
                  child: new Column(
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          new Text(
                            "TOKYO",
                            style: new TextStyle(
                                fontSize: 65,
                                fontFamily: 'Oswald',
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFD3664)),
                          ),
                          new Text(
                            ", ",
                            style: new TextStyle(
                                fontSize: 65,
                                fontFamily: 'Oswald',
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          new Text(
                            "JAPAN",
                            style: new TextStyle(
                                fontSize: 65,
                                fontFamily: 'Oswald',
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )
                        ],
                      )
                    ],
                  )),
              new Positioned(
                  top: 330,
                  left: 30,
                  right: 30,
                  child: new Container(
                    height: 50,
                    decoration: new BoxDecoration(
                      color: Color(0xFF262626),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: new TextField(
                      decoration: new InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Lets explore some food here...',
                          hintStyle:
                              new TextStyle(color: Colors.grey, fontSize: 18),
                          contentPadding: new EdgeInsets.only(top: 13),
                          prefixIcon:
                              new Icon(Icons.search, color: Colors.grey)),
                    ),
                  ))
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildMenuItem('BURGER', 'images/burger.png'),
              _buildMenuItem('TEA', 'images/tea.png'),
              _buildMenuItem('BEER', 'images/beer.png'),
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildMenuItem('CAKE', 'images/cake.png'),
              _buildMenuItem('COFFEE', 'images/coffee.png'),
              _buildMenuItem('MEAT', 'images/meat.png'),
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildMenuItem('ICE', 'images/ice-cream.png'),
              _buildMenuItem('FISH', 'images/fish.png'),
              _buildMenuItem('DONUTS', 'images/donut.png'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String foodName, iconData) {
    return InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          selectMenuOption(foodName);
        },
        child: Container(
            height: 86,
            width: 100,
            color: selectedFood == foodName
                ? Color(0xFFFD3566)
                : Colors.transparent,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(iconData,
                  width: 35,
                  height: 35,
                  fit: BoxFit.cover,
                  color: Colors.white),
              SizedBox(height: 12.0),
              Text(foodName,
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontSize: 12.0))
            ])));
  }

  selectMenuOption(String foodName) {
    setState(() {
      selectedFood = foodName;
    });
  }
}

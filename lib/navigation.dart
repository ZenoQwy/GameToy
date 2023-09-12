import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<NavigationPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<NavigationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.red,
            height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.asset(
                    'assets/images/gametoy.png', // logo de l'appli
                  ),
                )
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(0,15,0,30),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text(
                  "Let's play !",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Monoton',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
              ])),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.all(5),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.30,
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/route2');
                        },
                        child: const Text(
                          "Morpion",
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.red))),
                  )),
              Padding(
                  padding: EdgeInsets.all(5),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.30,
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/route3');
                        },
                        child: const Text(
                          "Puissance 4",
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.red))),
                  )),
              Padding(
                  padding: EdgeInsets.all(5),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.30,
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/route4');
                        },
                        child: const Text(
                          "test",
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.red))),
                  )),
            ],
          )
        ],
      ),
    );
  }
}

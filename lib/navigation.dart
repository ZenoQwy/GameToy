import 'package:flutter/material.dart';
import 'package:game_toy/MillesBornes/millesBornesSplashScreen.dart';
import 'package:game_toy/Morpion/morpionSplashScreen.dart';
import 'package:game_toy/Puissance4/puissance4SplashScreen.dart';

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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/gametoy_logo.png',
                    height: 120,
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home,size: 30,), // Icône de maison
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
                // Actions à effectuer lorsque "Home" est sélectionné
              },
            ),
            IntrinsicWidth(
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.fromLTRB(0, 25, 0, 0)),
                  Text('Les jeux disponibles',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
                  Divider(
                    color: Colors.black,
                    thickness: 2,
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10)),
                ],
              ),
            ),
            ListTile(
              leading: Image.asset('assets/images/morpion.png',height: 30,), // Icône de maison
              title: Text('Morpion'),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => MorpionSplashScreen(), // Nouvelle page de splashscreen pour le morpion
                  ),
                );
              },
            ),
            ListTile(
              leading: Image.asset('assets/images/puissance4.png',height: 30,), // Icône de maison
              title: Text('Puissance 4'),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => PuissanceIVSplashScreenState(), // Nouvelle page de splashscreen pour le morpion
                  ),
                );
              },
            ),
            ListTile(
              leading: Image.asset('assets/images/1000bornes.png',height: 30,), // Icône de maison
              title: Text('1000 bornes'),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => MillesBornesSplashScreen() , // Nouvelle page de splashscreen pour le morpion
                  ),
                );
              },
            ),
          ],
        ),
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
                    'assets/images/gametoy_logo.png', // logo de l'appli
                  ),
                )
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(0, 15, 0, 30),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => MorpionSplashScreen(), // Nouvelle page de splashscreen pour le morpion
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/morpion.png',
                          height: 60,
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 7)),
                        const Text(
                          "Morpion",
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize:15  ),
                        ),
                      ],
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.30,
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => PuissanceIVSplashScreenState(), // Nouvelle page de splashscreen pour le morpion
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/puissance4.png',
                          height: 60,
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 7)),
                        const Text(
                          "Puissance4",
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize:15),
                        ),
                      ],
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.30,
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => MillesBornesSplashScreen(), // Nouvelle page de splashscreen pour le morpion
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/1000bornes.png',
                          height: 60,
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 7)),
                        const Text(
                          "1000 bornes",
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ],
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

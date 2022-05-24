import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Widget titleSection = Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text("Pizza facile",
                          style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    ),
                    Text("Par Smy",
                        style: TextStyle(color: Colors.grey, fontSize: 16)),
                  ],
                )),
            Icon(Icons.favorite, color: Colors.red),
            Text("55")
          ],
        ));

    Widget buttonSection = Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(Colors.blue, Icons.comment, 'COMMENT'),
          _buildButtonColumn(Colors.blue, Icons.share, 'SHARE')
        ],
      ),
    );

    Widget descriptionSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text("Faire cuire dans une poêle les lardons et les champignons.\n\nDans un bol, verser la boîte de concentré de tomate, y ajouter un demi verre d'eau, ensuite mettre un carré de sucre (pour enlever l'acidité de la tomate) une pincée de sel, de poivre, et une pincée d'herbe de Provence.",
      softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Formation Flutter',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
          appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text("Mes recettes"),
          ),
          body: Column(children: [
            titleSection,
            buttonSection,
            descriptionSection,
          ])),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 8),
          child: Icon(icon, color: color),
        ),
        Text(label,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w400, color: color))
      ],
    );
  }
}

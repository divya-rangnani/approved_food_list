import 'package:flutter/material.dart';
import 'package:quovantis_test/ui/approvedfood/approved_food_list.dart';
import 'package:quovantis_test/utils/SlideRightRoute.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quovantis Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        pageTransitionsTheme: PageTransitionsTheme(
        builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        }),
      ),
      home: MyHomePage(title: 'Launch Screen'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: OutlinedButton(
        onPressed: () {
          /*Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ApprovedFoodList(
                      title: 'Approved Foods List',
                    )),
          );*/
          Navigator.push(context, FadeRoute(page: ApprovedFoodList(
            title: 'Approved Foods List',
          )));
        },
        child: Text('Present Approved Foods List'),
      )),
    );
  }
}


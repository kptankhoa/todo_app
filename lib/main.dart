import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/routes/routes.dart';
import 'package:todo_app/screens/home/home_screen.dart';
import 'package:todo_app/common/const.dart';

void main() => runApp(const Main());

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        textTheme: GoogleFonts.nunitoSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      routes: getRoutes(),
      onGenerateRoute: (settings) => getGeneratedRoute(settings),
      home: HomeScreen(toDoList: dummyToDoList),
    );
  }
}


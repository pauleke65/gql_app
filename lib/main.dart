import 'package:flutter/material.dart';
import 'package:gql_app/pages/home_page.dart';
import 'package:gql_app/services/gql_client.dart';

void main() async {
  GQLClient.initializeClient();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

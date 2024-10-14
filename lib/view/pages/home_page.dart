import 'package:flutter/material.dart';
import 'package:flutter_machine_test_alisons/controller/home_provider.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/Logo 2.png"),
        actions: const [
          Icon(
            Icons.search,
            size: 35,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.favorite_border,
            size: 35,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.badge_outlined,
            size: 35,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: FutureBuilder(
        future: provider.fetchData(),
        builder: (context, snapshot) {
          final data = snapshot.data;

          return ListView(
            children: [],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.refresh),
      ),
    );
  }
}

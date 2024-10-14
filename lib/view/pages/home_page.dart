import 'package:flutter/material.dart';
import 'package:flutter_machine_test_alisons/controller/home_provider.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/Logo 2.png"),
        actions: const [
          Icon(Icons.search, size: 35),
          SizedBox(width: 10),
          Icon(Icons.favorite_border, size: 35),
          SizedBox(width: 10),
          Icon(Icons.badge_outlined, size: 35),
          SizedBox(width: 10),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<HomeProvider>(context, listen: false).fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final productData = snapshot.data;
            print(productData); // Assuming this is a ProductModel

            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: productData?.banner1.length ?? 0,
              itemBuilder: (context, index) {
                final banner = productData!.banner1[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image.network(banner.image,
                          width: 100,
                          height: 100), // Adjust dimensions as needed
                      Text(banner.title,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(banner.subTitle),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('No data available.'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.refresh),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Actions/connector.dart';

class LandingPage extends StatelessWidget {
  final List fetchProducts;
  final bool isloading;

  const LandingPage({required this.fetchProducts, required this.isloading});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        backgroundColor: Colors.grey,
      ),
      body: isloading && fetchProducts.isEmpty
          ? Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => APIConnector()));
                },
                child: Text("No Data Found !!!!"),
              ),
            )
          : fetchProducts.isNotEmpty
              ? ListView.builder(
                  itemCount: fetchProducts.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        trailing: CircleAvatar(
                          radius: 25,
                          backgroundImage:
                              NetworkImage(fetchProducts[index].image),
                        ),
                        title: Text(
                          fetchProducts[index].title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(fetchProducts[index].description),
                      ),
                    );
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
    );
  }
}

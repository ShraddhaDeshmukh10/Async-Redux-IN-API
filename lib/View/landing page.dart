import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  final List fetchProducts;

  const LandingPage({required this.fetchProducts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        backgroundColor: Colors.grey,
      ),
      body: fetchProducts.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: fetchProducts.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    trailing: CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(fetchProducts[index].image),
                    ),
                    title: Text(
                      fetchProducts[index].title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(fetchProducts[index].description),
                  ),
                );
              },
            ),
    );
  }
}

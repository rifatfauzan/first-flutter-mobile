// item_list.dart
import 'package:flutter/material.dart';
import 'package:first_project/widgets/left_drawer.dart';
import 'package:first_project/widgets/shop_card.dart';

class ItemListPage extends StatelessWidget {
  const ItemListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Replace with your actual data source
    final List<String> items = ["Item 1", "Item 2", "Item 3"]; // Example item list

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Item'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            // Add other item properties and widgets as needed
          );
        },
      ),
    );
  }
}

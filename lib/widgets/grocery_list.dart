import 'package:flutter/material.dart';
import 'package:shopping_list/data/dummy_items.dart';
import 'package:shopping_list/widgets/new_item.dart';

class GroceryList extends StatelessWidget {
  const GroceryList({super.key});

  void _addItem(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return const NewItem();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grocery List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              _addItem(context);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(groceryItems[index].name),
            leading: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: groceryItems[index].category.color,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            trailing: Text('${groceryItems[index].quantity}x'),
          );
        },
        itemCount: groceryItems.length,
      ),
    );
  }
}

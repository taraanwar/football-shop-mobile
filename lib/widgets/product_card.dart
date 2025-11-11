import 'package:flutter/material.dart';
import 'package:football_shop/screens/product_form.dart';
import 'package:football_shop/screens/menu.dart';

class ProductCard extends StatelessWidget {
  final ItemHomepage item;

  const ProductCard(this.item, {super.key});

  Color _bgColorFor(String name) {
    if (name == "All Products") return Colors.blue;
    if (name == "My Products") return Colors.green;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _bgColorFor(item.name),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("You have pressed the ${item.name} button")),
            );
          if (item.name == "Add Product") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProductFormPage()),
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(item.icon, color: Colors.white, size: 30.0),
                const SizedBox(height: 3),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

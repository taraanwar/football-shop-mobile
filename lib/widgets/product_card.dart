import 'package:flutter/material.dart';
import 'package:football_shop/screens/product_form.dart';
import 'package:football_shop/screens/menu.dart';
import 'package:football_shop/screens/product_entry_list.dart';
import 'package:football_shop/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

const String baseUrl = "https://tara-nirmala-footballshop.pbp.cs.ui.ac.id";


class ProductCard extends StatelessWidget {
  final ItemHomepage item;

  const ProductCard(this.item, {super.key});

  Color _bgColorFor(String name) {
    if (name == "All Products") return Colors.blue;
    if (name == "My Products") return Colors.green;
    if (name == "Add Product") return Colors.red;
    if (name == "Logout") return Colors.grey.shade800;
    return Colors.blueGrey;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Material(
      color: _bgColorFor(item.name),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () async {
          // Optional feedback
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("You pressed ${item.name}")),
            );

          // --- ALL PRODUCTS ---
          if (item.name == "All Products") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductEntryListPage(),
              ),
            );
          }

          // --- MY PRODUCTS (FILTERED) ---
          else if (item.name == "My Products") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const ProductEntryListPage(onlyMine: true),
              ),
            );
          }

          // --- ADD PRODUCT ---
          else if (item.name == "Add Product") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductFormPage(),
              ),
            );
          }

          // --- LOGOUT ---
          else if (item.name == "Logout") {
            final response = await request.logout("$baseUrl/auth/logout/");
            final message = response["message"] ?? "Logout failed.";

            if (!context.mounted) return;

            if (response['status'] == true) {
              final uname = response["username"] ?? "";
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("$message See you again, $uname."),
                ),
              );

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message)),
              );
            }
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

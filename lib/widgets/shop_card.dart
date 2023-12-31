import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:first_project/screens/login.dart';
import 'package:first_project/screens/shoplist_form.dart';
import 'package:first_project/screens/list_item.dart';

class ShopItem {
  final String name;
  final IconData icon;
  final Color color;

  ShopItem(this.name, this.icon, this.color);
}

class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    
    return Provider(
      create: (_) {
          CookieRequest request = CookieRequest();
          return request;
      },
      child: Material(
          color: item.color,
          child: InkWell(
            // Area responsive terhadap sentuhan
            onTap: () async {
              // Show the SnackBar immediately
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                  content: Text("Kamu telah menekan tombol ${item.name}!"),
                ));
              
              // Check the button pressed and act accordingly
              if (item.name == "Tambah Item") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShopFormPage(),
                  ),
                );
              } else if (item.name == "Lihat Item") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ItemPage(),
                  ),
                );
              } else if (item.name == "Logout") {
                // Make sure to await the logout call
                final response = await request.logout("http://127.0.0.1:8000/auth/logout/");
                String message = response["message"];
                if (response['status']) {
                  if (context.mounted) {
                    String uname = response["username"];
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("$message Sampai jumpa, $uname."),
                    ));
                  }
                } else {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(message),
                    ));
                  }
                }
              }
            },
            child: Container(
              // Container untuk menyimpan Icon dan Text
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      item.icon,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    const Padding(padding: EdgeInsets.all(3)),
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
      )
    );
  }
}
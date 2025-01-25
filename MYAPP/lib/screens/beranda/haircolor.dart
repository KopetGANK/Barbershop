import 'package:flutter/material.dart';
import '../../utils/cartprovider.dart';
import '../../utils/cartitem.dart';

class HaircolorPage extends StatelessWidget {
  final CartProvider cartProvider;

  const HaircolorPage({super.key, required this.cartProvider});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> colors = [
      {'name': 'Natural Black', 'price': 30000},
      {'name': 'Dark Brown', 'price': 35000},
      {'name': 'Light Brown', 'price': 40000},
      {'name': 'Blonde', 'price': 40000},
      {'name': 'Red', 'price': 30000},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Haircolor', style: TextStyle(color: Colors.yellow)),
      ),
      body: ListView.builder(
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(colors[index]['name'], style: const TextStyle(color: Colors.yellow)),
            trailing: Text('Rp ${colors[index]['price']}'),
            onTap: () {
              // Menambahkan haircolor ke keranjang
              cartProvider.addItem(
                CartItem(name: colors[index]['name'], category: 'Haircolor', price: colors[index]['price']),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Ditambahkan ke keranjang')),
              );
            },
          );
        },
      ),
    );
  }
}

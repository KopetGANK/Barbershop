import 'package:flutter/material.dart';
import '../../utils/cartprovider.dart';
import '../../utils/cartitem.dart';

class HaircutPage extends StatelessWidget {
  final CartProvider cartProvider;

  const HaircutPage({super.key, required this.cartProvider});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> haircutStyles = [
      {'name': 'Undercut', 'price': 50000},
      {'name': 'Pompadour', 'price': 60000},
      {'name': 'Buzz Cut', 'price': 40000},
      {'name': 'Crew Cut', 'price': 45000},
      {'name': 'French Crop', 'price': 55000},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Haircut', style: TextStyle(color: Colors.yellow)),
      ),
      body: ListView.builder(
        itemCount: haircutStyles.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(haircutStyles[index]['name'], style: const TextStyle(color: Colors.yellow)),
            trailing: Text('Rp ${haircutStyles[index]['price']}'),
            onTap: () {
              // Menambahkan haircut ke keranjang
              cartProvider.addItem(
                CartItem(name: haircutStyles[index]['name'], category: 'Haircut', price: haircutStyles[index]['price']),
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

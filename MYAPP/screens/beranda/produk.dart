import 'package:flutter/material.dart';
import '../../utils/cartprovider.dart';
import '../../utils/cartitem.dart';

class ProdukPage extends StatelessWidget {
  final CartProvider cartProvider;

  const ProdukPage({super.key, required this.cartProvider});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> products = [
      {'name': 'Pomade', 'price': 50000},
      {'name': 'Hair Tonic', 'price': 40000},
      {'name': 'Shampoo', 'price': 80000},
      {'name': 'Vitamin Rambut', 'price': 75000},
      {'name': 'Hair Wax', 'price': 90000},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Produk', style: TextStyle(color: Colors.yellow)),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index]['name'], style: const TextStyle(color: Colors.yellow)),
            trailing: Text('Rp ${products[index]['price']}'),
            onTap: () {
              // Menambahkan produk ke keranjang
              cartProvider.addItem(
                CartItem(name: products[index]['name'], category: 'Produk', price: products[index]['price']),
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

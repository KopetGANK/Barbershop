import 'package:flutter/material.dart';
import '../../utils/cartprovider.dart';
import '../../utils/cartitem.dart';
import '../pembayaran.dart';

class KeranjangPage extends StatelessWidget {
  final CartProvider cartProvider;

  const KeranjangPage({super.key, required this.cartProvider});

  @override
  Widget build(BuildContext context) {
    final cartItems = cartProvider.items;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang', style: TextStyle(color: Colors.yellow)),
      ),
      body: cartItems.isEmpty
          ? const Center(
              child: Text(
                'Keranjang kosong',
                style: TextStyle(color: Colors.yellow, fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    cartItems[index].name,
                    style: const TextStyle(color: Colors.yellow),
                  ),
                  subtitle: Text(
                    cartItems[index].category,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () {
                          // Mengedit pesanan
                          _showEditDialog(context, cartProvider, index);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          // Menghapus pesanan
                          cartProvider.removeItem(cartItems[index]);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Pesanan dihapus')),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
      bottomNavigationBar: cartItems.isNotEmpty
          ? Container(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Navigasi ke halaman pembayaran
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PembayaranPage(cartProvider: cartProvider),
                    ),
                  );
                },
                child: const Text('Checkout'),
              ),
            )
          : null,
    );
  }

  // Dialog untuk mengedit pesanan
  void _showEditDialog(BuildContext context, CartProvider cartProvider, int index) {
    final TextEditingController nameController =
        TextEditingController(text: cartProvider.items[index].name);
    final double price = cartProvider.items[index].price;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Pesanan'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Nama Pesanan'),
              ),
              // Add a field for price if needed, or just display the price.
              Text('Harga: Rp $price', style: TextStyle(color: Colors.yellow)),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                cartProvider.items[index] = CartItem(
                  name: nameController.text,
                  category: cartProvider.items[index].category,
                  price: price, // Set the correct price
                );
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Pesanan berhasil diubah')),
                );
              },
              child: const Text('Simpan'),
            ),
          ],
        );
      },
    );
  }
}

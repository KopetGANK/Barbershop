import 'package:flutter/material.dart';
import 'haircut.dart';
import 'haircolor.dart';
import 'produk.dart';
import 'keranjang.dart';
import '../../utils/cartprovider.dart';

class Beranda extends StatelessWidget {
  final CartProvider cartProvider = CartProvider();

  Beranda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beranda', style: TextStyle(color: Colors.yellow)),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          _buildFeatureTile(context, 'Haircut', const Icon(Icons.cut), () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HaircutPage(cartProvider: cartProvider)),
            );
          }),
          _buildFeatureTile(context, 'Haircolor', const Icon(Icons.color_lens), () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HaircolorPage(cartProvider: cartProvider)),
            );
          }),
          _buildFeatureTile(context, 'Produk', const Icon(Icons.store), () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProdukPage(cartProvider: cartProvider)),
            );
          }),
          _buildFeatureTile(context, 'Keranjang', const Icon(Icons.shopping_cart), () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => KeranjangPage(cartProvider: cartProvider)),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildFeatureTile(BuildContext context, String title, Icon icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            Text(title),
          ],
        ),
      ),
    );
  }
}

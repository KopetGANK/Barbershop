import 'package:flutter/material.dart';

class Promo extends StatefulWidget {
  const Promo({super.key});

  @override
  State<Promo> createState() => _PromoState();
}

class _PromoState extends State<Promo> {
  final List<Map<String, String>> promotions = [
    {'title': 'Haircut Discount', 'description': 'Get 20% off on your first haircut!'},
    {'title': 'Special Combo', 'description': 'Haircut + Beard Trim at a special price!'},
    {'title': 'Weekend Offer', 'description': '50% off on all services every Saturday!'},
    {'title': 'Loyalty Program', 'description': 'Earn points for every visit and redeem them for discounts!'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Promo', style: TextStyle(color: Colors.yellow)),
      ),
      body: ListView.builder(
        itemCount: promotions.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            color: Colors.blueGrey[50],
            child: ListTile(
              title: Text(
                promotions[index]['title']!,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              subtitle: Text(
                promotions[index]['description']!,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ),
          );
        },
      ),
    );
  }
}

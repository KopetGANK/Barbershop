// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import '../utils/cartprovider.dart';
import '../utils/cartitem.dart';

class PembayaranPage extends StatefulWidget {
  final CartProvider cartProvider;

  const PembayaranPage({super.key, required this.cartProvider});

  @override
  _PembayaranPageState createState() => _PembayaranPageState();
}

class _PembayaranPageState extends State<PembayaranPage> {
  // Variabel untuk memilih metode pembayaran
  String? _selectedPaymentMethod;
  bool _isLoading = false; // Untuk menampilkan indikator loading
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cartItems = widget.cartProvider.items;
    double totalPrice = 0;
    for (var item in cartItems) {
      totalPrice += item.price;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pembayaran', style: TextStyle(color: Colors.yellow)),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator()) // Menampilkan indikator loading
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
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
                        trailing: Text(
                          'Rp ${cartItems[index].price.toString()}',
                          style: const TextStyle(color: Colors.yellow),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Total: Rp $totalPrice',
                    style: const TextStyle(color: Colors.yellow, fontSize: 18),
                  ),
                ),
                // Pilihan Metode Pembayaran
                ListTile(
                  title: const Text('Pilih Metode Pembayaran', style: TextStyle(color: Colors.yellow)),
                ),
                RadioListTile<String>(
                  title: const Text('MBanking', style: TextStyle(color: Colors.yellow)),
                  value: 'MBanking',
                  groupValue: _selectedPaymentMethod,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedPaymentMethod = value;
                    });
                  },
                ),
                if (_selectedPaymentMethod == 'MBanking') ...[
                  RadioListTile<String>(
                    title: const Text('BRI', style: TextStyle(color: Colors.yellow)),
                    value: 'BRI',
                    groupValue: _selectedPaymentMethod,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedPaymentMethod = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('BCA', style: TextStyle(color: Colors.yellow)),
                    value: 'BCA',
                    groupValue: _selectedPaymentMethod,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedPaymentMethod = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('BNI', style: TextStyle(color: Colors.yellow)),
                    value: 'BNI',
                    groupValue: _selectedPaymentMethod,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedPaymentMethod = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('Mandiri', style: TextStyle(color: Colors.yellow)),
                    value: 'Mandiri',
                    groupValue: _selectedPaymentMethod,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedPaymentMethod = value;
                      });
                    },
                  ),
                ],
                RadioListTile<String>(
                  title: const Text('E-Wallet', style: TextStyle(color: Colors.yellow)),
                  value: 'E-Wallet',
                  groupValue: _selectedPaymentMethod,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedPaymentMethod = value;
                    });
                  },
                ),
                if (_selectedPaymentMethod == 'E-Wallet') ...[
                  RadioListTile<String>(
                    title: const Text('Dana', style: TextStyle(color: Colors.yellow)),
                    value: 'Dana',
                    groupValue: _selectedPaymentMethod,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedPaymentMethod = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('ShopeePay', style: TextStyle(color: Colors.yellow)),
                    value: 'ShopeePay',
                    groupValue: _selectedPaymentMethod,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedPaymentMethod = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('GoPay', style: TextStyle(color: Colors.yellow)),
                    value: 'GoPay',
                    groupValue: _selectedPaymentMethod,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedPaymentMethod = value;
                      });
                    },
                  ),
                ],
                if (_selectedPaymentMethod != null) ...[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: _accountController,
                      decoration: const InputDecoration(labelText: 'Nomor Akun'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: _pinController,
                      decoration: const InputDecoration(labelText: 'PIN / Password'),
                      obscureText: true,
                    ),
                  ),
                ],
                ElevatedButton(
                  onPressed: () async {
                    if (_selectedPaymentMethod != null &&
                        _accountController.text.isNotEmpty &&
                        _pinController.text.isNotEmpty) {
                      setState(() {
                        _isLoading = true;
                      });

                      // Simulasi pembayaran
                      await Future.delayed(const Duration(seconds: 3));

                      setState(() {
                        _isLoading = false;
                      });

                      // Setelah pembayaran berhasil, tampilkan nota
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Nota Pembayaran'),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Metode Pembayaran: $_selectedPaymentMethod'),
                                Text('Akun: ${_accountController.text}'),
                                Text('Total: Rp $totalPrice'),
                                const SizedBox(height: 20),
                                const Text('Pembayaran Berhasil!'),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context); // Kembali ke halaman sebelumnya
                                },
                                child: const Text('Tutup'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: const Text('Bayar', style: TextStyle(color: Colors.yellow)),
                ),
              ],
            ),
    );
  }
}

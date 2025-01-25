import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _addressController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _addressController = TextEditingController();
    _loadProfileData();
  }

  // Load saved profile data from shared preferences
  void _loadProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _nameController.text = prefs.getString('name') ?? 'Jo';
      _emailController.text = prefs.getString('email') ?? 'jo@email.com';
      _phoneController.text = prefs.getString('phone') ?? '+62 812 3456 7890';
      _addressController.text = prefs.getString('address') ?? 'Jl.Surakartans No. 123, Solo';
    });
  }

  // Save profile data to shared preferences
  void _saveProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', _nameController.text);
    prefs.setString('email', _emailController.text);
    prefs.setString('phone', _phoneController.text);
    prefs.setString('address', _addressController.text);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile saved successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Customer'),
        backgroundColor: const Color.fromARGB(255, 30, 31, 31),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Profile Picture (simulated as a CircleAvatar)
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/customer.jpg'), // Replace with actual image
                  ),
                  const SizedBox(height: 16),

                  // Profile Info
                  _buildProfileCard('Nama Lengkap', _nameController),
                  _buildProfileCard('Email', _emailController),
                  _buildProfileCard('Nomor Telepon', _phoneController),
                  _buildProfileCard('Alamat', _addressController),

                  const SizedBox(height: 20),

                  // Save Button
                  ElevatedButton(
                    onPressed: _saveProfileData,
                    child: const Text('Simpan Profil'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50), backgroundColor: const Color.fromARGB(220, 4, 4, 4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Function to create the profile fields in a card-like layout
  Widget _buildProfileCard(String title, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            '$title: ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

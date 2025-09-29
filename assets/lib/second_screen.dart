import 'package:flutter/material.dart';
import 'package:flutter_application_2/navbar pages/home.dart';
import 'package:flutter_application_2/navbar pages/settings.dart';
import 'package:flutter_application_2/navbar pages/profile.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int selectedindex = 0;

  // ✅ HomePage replaces the old dummy home()
  List<Widget> pages = [
    const HomePage(),
    SettingsPage(),
    const ProfilePage(fullName: '', email: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 100,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 133, 86, 213),
                ),
                child: Text('Menu'),
              ),
            ),
            ListTile(
              title: const Text('Contact us'),
              subtitle: const Text('01010101010'),
              trailing: const Icon(Icons.phone),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pop(); // close drawer
                Navigator.of(context).pop(); // log out
              },
              title: const Text('Log out'),
              trailing: const Icon(Icons.logout),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Center(
          child: SizedBox(
            width: 170,
            child: Text(
              'UrShop',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: pages[selectedindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedindex,
        onTap: onItemTapped,
        items: const [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(
            label: "Settings",
            icon: Icon(Icons.settings),
          ),
          BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.person)),
        ],
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedindex = index;
    });
  }
}

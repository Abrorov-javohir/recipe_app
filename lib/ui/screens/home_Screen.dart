import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/data/models/user/user.dart';
import 'package:recipe_app/ui/screens/add_screen.dart';
import 'package:recipe_app/ui/screens/home_content.dart';
import 'package:recipe_app/ui/screens/notification_screen.dart';
import 'package:recipe_app/ui/screens/profile_screen.dart';
import 'package:recipe_app/ui/screens/search_screen.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final User user = User(
    id: 1,
    name: 'Amelia Melanes',
    email: 'amelia@example.com',
    phone: '123-456-7890',
    photo: 'assets/images/profile.png',
  );

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      const HomeContent(),
      const SearchScreen(),
      const AddScreen(),
      const NotificationsActiveScreen(),
      ProfileScreen(
        userId: 1,
      ),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String _getAppBarTitle() {
    switch (_selectedIndex) {
      case 0:
        return "Home";
      case 1:
        return "Search";
      case 2:
        return "Add";
      case 3:
        return "Notifications";
      case 4:
        return "Profile";
      default:
        return "Home";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getAppBarTitle()), // Dynamic title
      ),
      body: _pages[_selectedIndex], // Use the selected page
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.teal,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add, size: 40), // Centered "+" button
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_active),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white54,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          backgroundColor: Colors.teal,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_chain_app/constants.dart';
import 'package:pharma_chain_app/views/chat_screen.dart';
import 'package:pharma_chain_app/views/home_screen.dart';
import 'package:pharma_chain_app/views/profile_screen.dart';
import 'package:pharma_chain_app/views/pharmacy/pyarmacy_screen.dart';
import 'package:pharma_chain_app/views/search_screen.dart';
import 'package:pharma_chain_app/widgets/custom_appbar.dart';
import 'package:pharma_chain_app/widgets/custom_drawer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const HomeScreen(),
    const PharmacyScreen(),
    const ChatScreen(),
    const SearchScreen(),
    const ProfileScreen(),
  ];

  final List _screenData = [
    {
      "title": "Home",
      "icon": "assets/images/Property.png",
    },
    {
      "title": "Pharmacy",
      "icon": "assets/images/Pharmacy.png",
    },
    {
      "title": "Chat",
      "icon": "assets/images/Chat.png",
    },
    {
      "title": "Search",
      "icon": "assets/images/Search.png",
    },
    {
      "title": "Profile",
      "icon": "assets/images/Profile.png",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: [0, 1].contains(_currentIndex)
          ? customAppbar(context,
              title: _currentIndex == 0
                  ? Text(
                      "Abdullah",
                      style: TextStyle(
                        fontFamily: 'Mansalva',
                        fontSize: 24.sp,
                        color: appbarTitleColor,
                      ),
                    )
                  : null,
              action: [
                  Padding(
                    padding: EdgeInsets.only(right: 35.w),
                    child: Image.asset(
                      "assets/images/Cart.png",
                      width: 50.w,
                    ),
                  )
                ])
          : null,
      drawer: [0, 1].contains(_currentIndex) ? const CustomDrawer() : null,
      body: _screens.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: _currentIndex,
        elevation: 10,
        unselectedIconTheme: const IconThemeData(color: Colors.black),
        selectedItemColor: primaryGreen,
        showSelectedLabels: true,
        items: _screenData.map((e) {
          return BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Image.asset(
              e['icon'],
              width: 20.w,
              color:
                  _screenData.indexOf(e) == _currentIndex ? primaryGreen : null,
            ),
            label: e['title'],
          );
        }).toList(),
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
    );
  }
}

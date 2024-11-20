import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:uber_shop_app/views/screens/home_screen.dart';
import 'package:uber_shop_app/views/screens/category_screen.dart';
import 'package:uber_shop_app/views/screens/cart_screen.dart';
import 'package:uber_shop_app/views/screens/favourite_screen.dart';
import 'package:uber_shop_app/views/screens/account_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;

  List<Widget> _pages = [
    const HomeScreen(),
    const CategoryScreen(),
    const CartScreen(),
    const FavouriteScreen(),
    const AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        } ,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.pink,
        currentIndex: pageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/store-1.png',
              width: 20,
            ),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/explore.svg'),
            label: 'CATEGORIES',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/cart.svg'),
            label: 'CART',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/favorite.svg'),
            label: 'FAVOURITE',
          ),
        ],
      ),
      body: _pages[pageIndex],
    );
  }
}

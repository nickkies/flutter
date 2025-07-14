import 'package:behboolun_meenjoke/home/add_product_screen.dart';
import 'package:behboolun_meenjoke/home/widgets/home_widget.dart';
import 'package:behboolun_meenjoke/home/widgets/seller_widget.dart';
import 'package:behboolun_meenjoke/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _menuIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('배부른 민족'),
        centerTitle: true,
        actions: [
          if (_menuIndex == 0)
            IconButton(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.search),
            ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.logout)),
        ],
      ),
      body: IndexedStack(
        index: _menuIndex,
        children: const [HomeWidget(), SellerWidget()],
      ),
      floatingActionButton: switch (_menuIndex) {
        0 => FloatingActionButton(
          onPressed: () {
            final uid = userCredential?.user?.uid;
            if (uid == null) return;
            context.go('/cart/$uid');
            //   Navigator.of(
            //   context,
            // ).push(MaterialPageRoute(builder: (context) => CartScreen('')));
          },
          child: const Icon(Icons.shopping_cart_outlined),
        ),
        1 => FloatingActionButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AddProductScreen()),
          ),
          child: const Icon(Icons.add),
        ),
        _ => Container(),
      },
      bottomNavigationBar: NavigationBar(
        selectedIndex: _menuIndex,
        onDestinationSelected: (idx) => setState(() => _menuIndex = idx),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.store_outlined), label: '홈'),
          NavigationDestination(
            icon: Icon(Icons.storefront),
            label: '사장님(판매자)',
          ),
        ],
      ),
    );
  }
}

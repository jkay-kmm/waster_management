import 'package:flutter/material.dart';
import 'package:waste_managament/ui/home/widgets/blog_home.dart';
import 'package:waste_managament/ui/home/widgets/category_home.dart';
import 'package:waste_managament/ui/home/widgets/process_point.dart';
import 'package:waste_managament/ui/home/widgets/user_points_card.dart';


import '../profile_screen/profile_screen.dart';
import '../shop_screen/shop_screen.dart';
import '../trash_screen/trash_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late PageController _pageController;

  Widget _buildNavIcon(IconData iconData, int index) {
    bool isSelected = index == _currentIndex;
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: isSelected
          ? BoxDecoration(
        color: const Color(0xFF4CAF50).withOpacity(0.2),
        shape: BoxShape.circle,
      )
          : null,
      child: Icon(
        iconData,
        color: isSelected ? const Color(0xFF4CAF50) : Colors.grey,
      ),
    );
  }


  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: const [
          HomeBody(),        // Trang chủ
          TrashScreen(),     // Màn hình Rác
          ShopScreen(),      // Màn hình Shop
          ProfileScreen(),   // Màn hình Cá nhân
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xFF4CAF50),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.jumpToPage(index);
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: _buildNavIcon(Icons.home, 0),
            label: 'Trang chủ',
            
          ),
          BottomNavigationBarItem(
            icon: _buildNavIcon(Icons.delete, 1),
            label: 'Rác',
          ),
          BottomNavigationBarItem(
            icon: _buildNavIcon(Icons.shopping_cart, 2),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: _buildNavIcon(Icons.person, 3),
            label: 'Tôi',
          ),
        ],
      ),

    );
  }
}

// Trang chủ tách thành 1 Widget cho gọn:
class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF038E4C), Color(0xFF81C784)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(height: 16),
                          Text("Chào mừng", style: TextStyle(color: Colors.white70)),
                          Text(
                            "Trung Nguyen",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 60),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: -120,
                  left: 16,
                  right: 16,
                  child: Material(
                    elevation: 8,
                    borderRadius: BorderRadius.circular(16),
                    child: const UserPointsCard(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 140),
            const CategoryHome(),
            const SizedBox(height: 16),
            const ProcessPoint(),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: const [
                  Text(
                    "Bài viết mới nhất",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF535353),
                      fontFamily: "Poppins",
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 300,
              child: SingleChildScrollView(
                child: BlogListScreen(),
              ),
            ),
          ],
        ),
      ),
    );
  }

}

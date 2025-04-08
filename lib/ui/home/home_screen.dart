import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:waste_managament/ui/home/widgets/blog_home.dart';
import 'package:waste_managament/ui/home/widgets/category_home.dart';
import 'package:waste_managament/ui/home/widgets/process_point.dart';
import 'package:waste_managament/ui/home/widgets/user_points_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  // Gradient Header
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
                                  color: Colors.white),
                            ),
                            SizedBox(height: 60),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Floating Card
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

              // Section title
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

              // Blog cards
             // SizedBox(
             //   height: 400,
             //     child: BlogListScreen()),
              SizedBox(
                height: 300,
                child: SingleChildScrollView(
                  child: BlogListScreen(),
                ),
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF4CAF50),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang chủ'),
          BottomNavigationBarItem(icon: Icon(Icons.delete), label: 'Rác'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Shop'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Tôi'),
        ],
      ),
    );
  }
}

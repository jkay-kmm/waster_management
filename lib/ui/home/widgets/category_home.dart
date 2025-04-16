import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CategoryHome extends StatelessWidget {
  const CategoryHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1, // độ dày viền
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildFeatureIcon(
              icon: LucideIcons.list,
              label: "Danh mục",
              onTap: () {
                Navigator.pushNamed(context, '/category');
              },

            ),
            buildFeatureIcon(
              icon: LucideIcons.shoppingBag,
              label: "Mua sắm",
              onTap: () {
                Navigator.pushNamed(context, '/shop');
              },
            ),
            buildFeatureIcon(
              icon: LucideIcons.mapPin,
              label: "Điểm thả",
              onTap: () {
                Navigator.pushNamed(context, '/drop_point');
              },
            ),
            buildFeatureIcon(
              icon: LucideIcons.truck,
              label: "Pick Up",
              onTap: () {
                Navigator.pushNamed(context, '/pickup');
              },
            ),
          ],
        ),
      ),
    );
  }
  Widget buildFeatureIcon({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.green),
          ),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }


}

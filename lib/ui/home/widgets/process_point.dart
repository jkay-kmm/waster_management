import 'package:flutter/material.dart';

class ProcessPoint extends StatelessWidget {
  const ProcessPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey.shade300, // hoặc Colors.grey nếu muốn đậm hơn
            width: 1, // độ dày viền
          ),
        ),
        child: Row(
          children: [
            const Icon(Icons.star, color: Colors.amber),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("80 XP lagi menjadi penyelamat negara!"),
                  SizedBox(height: 4),
                  LinearProgressIndicator(value: 0.8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

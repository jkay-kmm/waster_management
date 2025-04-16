import 'package:flutter/material.dart';

class PointBanner extends StatelessWidget {
  final Color color;
  final int totalPoints;
  const PointBanner({
    super.key,
    required this.color,
    required this.totalPoints,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tổng số điểm hiện tại',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          SizedBox(width: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.stars, color: Colors.white, size: 24),
              SizedBox(width: 8),
              Text(
                '$totalPoints Điểm',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

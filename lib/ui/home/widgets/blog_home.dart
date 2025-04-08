import 'package:flutter/material.dart';

class BlogListScreen extends StatelessWidget {
  final List<Map<String, String>> blogList = [
    {
      "imageUrl": "assets/icons/garbage.png",
      "title": "Hướng dẫn phân loại rác đúng cách",
      "date": "08/04/2025"
    },
    {
      "imageUrl": "assets/icons/garbage1.png",
      "title": "Tái chế nhựa: Tại sao lại quan trọng?",
      "date": "06/04/2025"
    },
    {
      "imageUrl": "assets/icons/garbage1.png",
      "title": "Giảm thiểu rác thải tại nhà với 5 mẹo đơn giản",
      "date": "03/04/2025"
    },
    {
      "imageUrl": "assets/icons/garbage1.png",
      "title": "Giảm thiểu rác thải tại nhà với 5 mẹo đơn giản",
      "date": "03/04/2025"
    },
    {
      "imageUrl": "assets/icons/garbage1.png",
      "title": "Giảm thiểu rác thải tại nhà với 5 mẹo đơn giản",
      "date": "03/04/2025"
    },
    {
      "imageUrl": "assets/icons/garbage1.png",
      "title": "Giảm thiểu rác thải tại nhà với 5 mẹo đơn giản",
      "date": "03/04/2025"
    },
  ];

  BlogListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: blogList.length,
      itemBuilder: (context, index) {
        final blog = blogList[index];
        return BlogCard(
          imageUrl: blog['imageUrl']!,
          title: blog['title']!,
          date: blog['date']!,
        );
      },
    );
  }
}

class BlogCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String date;

  const BlogCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5),
              bottomLeft: Radius.circular(5),
            ),
            child: Image.asset(
              imageUrl,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4CAF50).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      "Blog & Bài viết",
                      style: TextStyle(fontSize: 10, color: Color(0xFF4CAF50)),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 12, color: Colors.grey),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          date,
                          style: const TextStyle(fontSize: 12, color: Colors.grey),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

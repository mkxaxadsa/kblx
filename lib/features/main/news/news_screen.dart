import 'package:flutter/material.dart';
import 'package:king/core/data/news_data.dart';
import 'package:king/core/extensions/padding_extension_on_widget.dart';
import 'package:king/features/main/news/components/news_item.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      children: [
        const Text(
          "News",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ).paddingOnly(bottom: 30),
        const Text(
          "Popular News 📰",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ).paddingOnly(bottom: 8),
        ...List.generate(
          popularNews.length,
          (index) {
            return NewsItem(item: popularNews[index]).paddingOnly(bottom: 16);
          },
        ),
      ],
    );
  }
}

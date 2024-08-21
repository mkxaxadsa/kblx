// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:king/app/global_navigator/global_navigator.dart';
import 'package:king/core/extensions/expanded_ext_on_widget.dart';
import 'package:king/core/extensions/format_ext_on_datetime.dart';
import 'package:king/core/extensions/padding_extension_on_widget.dart';

import 'package:king/data/models/news_item_model.dart';
import 'package:king/features/main/news/detail_news/detail_news_screen.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({
    Key? key,
    required this.item,
  }) : super(key: key);
  final NewsItemModel item;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GlobalNavigator.push(context, page: DetailNewsScreen(item: item));
      },
      child: Container(
        width: double.maxFinite,
        height: 100,
        decoration: BoxDecoration(
          color: const Color(0xff333333),
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.network(
                item.imageUrl,
                height: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ).expanded(),
            const SizedBox(
              width: 14,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ).paddingOnly(bottom: 5),
                Text(
                  item.text,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white.withOpacity(.48),
                    height: 1,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ).paddingOnly(bottom: 2),
                Text(
                  item.creationDate.simpleReversedSlashFormat,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Color(0xffFFA20D),
                  ),
                ),
              ],
            ).expanded(flex: 2)
          ],
        ),
      ),
    );
  }
}

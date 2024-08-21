// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:king/core/constants/app_icons.dart';
import 'package:king/core/extensions/align_ext_on_widget.dart';
import 'package:king/core/extensions/expanded_ext_on_widget.dart';
import 'package:king/core/extensions/padding_extension_on_widget.dart';
import 'package:king/data/models/news_item_model.dart';

class DetailNewsScreen extends StatefulWidget {
  const DetailNewsScreen({
    Key? key,
    required this.item,
  }) : super(key: key);
  final NewsItemModel item;
  @override
  State<DetailNewsScreen> createState() => _DetailNewsScreenState();
}

class _DetailNewsScreenState extends State<DetailNewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.16),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Image.asset(
                    AppIcons.back,
                    width: 16,
                  ),
                ),
              ).paddingOnly(bottom: 10).align(Alignment.centerLeft),
              ListView(padding: const EdgeInsets.symmetric(vertical: 20),
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: CachedNetworkImage(
                      imageUrl: widget.item.imageUrl,
                      cacheKey: widget.item.imageUrl,
                      width: double.maxFinite,
                    ),
                  ).paddingOnly(bottom: 20),
                  Text(
                    widget.item.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ).paddingOnly(bottom: 20),
                  Text(
                    widget.item.text,
                    style: TextStyle(color: Colors.white.withOpacity(.48)),
                  ),
                ],
              ).expanded(),
            ],
          ).paddingSymetric(horizontal: 20, vertical: 10),
        ),
      ),
    );
  }
}

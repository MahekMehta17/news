import 'package:blur/blur.dart';
import 'package:breaking_news/models/article_model.dart';
import 'package:breaking_news/utils/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import 'full_screen_photo.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({super.key});

  final NewsArticle news = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.startToEnd,
        confirmDismiss: (direction) async {
          if (direction == DismissDirection.startToEnd) {
            final Uri url = Uri.parse(news.url);
            if (!await launchUrl(url)) {
              throw Exception('Could not launch $url');
            }
          }
          await Future.delayed(const Duration(seconds: 2));
          return false;
        },
        onDismissed: (direction) async {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ///Image
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FullScreenPhoto(url: news.urlToImage),
                        ),
                      );
                    },
                    onVerticalDragUpdate: (details) {
                      if (details.primaryDelta! > 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FullScreenPhoto(url: news.urlToImage),
                          ),
                        );
                      }
                    },
                    child: Stack(
                      children: [
                        Image.network(
                          news.urlToImage,
                          errorBuilder: (context, obj, stack) => const Center(child: Icon(Icons.error)),
                          fit: BoxFit.cover,
                          height: Get.height * 0.4,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(100),
                              ),
                              color: Colors.black.withOpacity(0.6),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    DateFormat('dd').format(DateTime.parse(news.time)),
                                    style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    DateFormat('MMM yyyy').format(DateTime.parse(news.time)),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 2)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Source : ${news.source}',
                    style: AppTextStyle.montserrat12W500Grey,
                  ),
                  Text(
                    'Author : ${news.author}',
                    style: AppTextStyle.montserrat12W500Grey,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    news.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.montserrat18W600,
                  ),
                  const SizedBox(height: 14),
                  SizedBox(
                    height: Get.height / 2.3,
                    child: Text(
                      news.description,
                      style: AppTextStyle.montserrat14W500,
                    ),
                  )
                ],
              ),
            ),

            /// Bottom

            Image.network(
              news.urlToImage,
              height: MediaQuery.of(context).size.height * 0.0591,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth,
              errorBuilder: (context, obj, stack) => const Center(child: Icon(Icons.error)),
            ).blurred(
              borderRadius: const BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
              colorOpacity: 0.2,
              blur: 3,
              overlay: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(CupertinoIcons.arrow_left_circle_fill),
                        Text(
                          ' Swipe Right To Read Full Article ',
                          style: AppTextStyle.montserrat12W500,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            // final box = context.findRenderObject() as RenderBox?;
                            // Share.share(
                            //   news.url,
                            //   sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
                            // );
                          },
                          icon: const CircleAvatar(
                            backgroundColor: Colors.black,
                            child: Icon(
                              Icons.share,
                              color: Colors.white,
                              size: 10,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const CircleAvatar(
                            backgroundColor: Colors.black,
                            child: Icon(
                              Icons.bookmark,
                              color: Colors.white,
                              size: 14,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

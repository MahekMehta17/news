import 'package:breaking_news/utils/app_text_styles.dart';
import 'package:breaking_news/utils/custom_widgets.dart';
import 'package:breaking_news/utils/strings_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_time_ago/get_time_ago.dart';

import '../models/article_model.dart';

class NewsItem extends StatelessWidget {
  final NewsArticle article;

  const NewsItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: article.urlToImage.isEmpty || article.urlToImage == ''
            ? Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(8)),
                height: 80,
                width: 80,
                child: const Icon(Icons.image_not_supported),
              )
            : Image.network(
                article.urlToImage,
                fit: BoxFit.fitHeight,
                height: 80,
                width: 80,
                errorBuilder: (context, url, error) {
                  return const Icon(Icons.error);
                },
              ),
      ),
      leadingSize: 100,
      title: Text(
        article.title,
        maxLines: 2,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 6),
          Text(
            '${article.source}  |  ${GetTimeAgo.parse(DateTime.parse(article.time))}',
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.montserrat12W500Grey,
          ),
        ],
      ),
    );
  }
}

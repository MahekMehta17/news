import 'package:breaking_news/utils/app_colors.dart';
import 'package:breaking_news/utils/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/news_controller.dart';
import '../utils/app_text_styles.dart';
import '../utils/routes.dart';
import '../widgets/news_list_item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'NEWS',
          style: AppTextStyle.montserrat28W700,
        ),
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() {
              return TextFormField(
                controller: controller.searchController,
                onChanged: (value) {
                  controller.searchedText.value = value;
                  controller.newsList.clear();
                  controller.getNews(query: value);
                },
                decoration: InputDecoration(
                  focusedBorder: CustomWidgets.customBorder,
                  disabledBorder: CustomWidgets.customBorder,
                  enabledBorder: CustomWidgets.customBorder,
                  border: CustomWidgets.customBorder,
                  label: Text(
                    'Search NEWS',
                    style: AppTextStyle.montserrat14W500Grey,
                  ),
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: controller.searchedText.value == ''
                      ? const SizedBox(width: 0)
                      : InkWell(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            controller.searchedText.value = '';
                            controller.category.value = 'general';
                            controller.page.value = 1;
                            controller.searchController.clear();
                            controller.getNews();
                          },
                          child: Icon(
                            Icons.cancel,
                            color: AppColors.black,
                          ),
                        ),
                ),
              );
            }),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: PopupMenuButton(
              child: const Icon(
                Icons.tune,
                color: Colors.black,
              ),
              onSelected: (value) {
                controller.category.value = value;
                controller.newsList.clear();
                controller.getNews();
              },
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(value: 'general', child: Text('General')),
                  const PopupMenuItem(value: 'business', child: Text('Business')),
                  const PopupMenuItem(value: 'entertainment', child: Text('Entertainment')),
                  const PopupMenuItem(value: 'health', child: Text('Health')),
                  const PopupMenuItem(value: 'science', child: Text('Science')),
                  const PopupMenuItem(value: 'sports', child: Text('Sports')),
                  const PopupMenuItem(value: 'technology', child: Text('Technology')),
                ];
              },
            ),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return CustomWidgets.loader;
        } else {
          return ListView.builder(
            itemCount: controller.newsList.length,
            itemBuilder: (context, index) {
              if (index == controller.newsList.length - 1) {
                controller.loadMore();

                return controller.isLoadingMore.value == false ? null : CustomWidgets.loader;
              } else {
                return InkWell(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    Get.toNamed(Routes.detailScreen, arguments: controller.newsList[index]);
                  },
                  child: NewsItem(
                    article: controller.newsList[index],
                  ),
                );
              }
            },
          );
        }
      }),
    );
  }
}

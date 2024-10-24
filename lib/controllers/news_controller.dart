import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/article_model.dart';
import '../services/new_api_service.dart';
import '../utils/strings_util.dart';

class HomeController extends GetxController {
  RxList<NewsArticle> newsList = <NewsArticle>[].obs;
  RxBool isLoading = true.obs;
  RxBool isLoadingMore = false.obs;
  RxInt page = 1.obs;
  RxString category = 'general'.obs;
  RxString searchedText = ''.obs;
  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    getNews();
    super.onInit();
  }

  void getNews({String? query}) async {
    try {
      if (page.value == 1) {
        isLoading.value = true;
      } else {
        isLoadingMore.value = true;
      }
      List<NewsArticle>? newsListFromAPI = (query == null
          ? await NewsApiService.fetchNews('top-headlines?category=${category.value}&page=${page.value}&pageSize=${StringUtils.newsCount}')
          : await NewsApiService.fetchNews('everything?q=$query'));

      if (newsListFromAPI != null) {
        newsList.addAll(newsListFromAPI);
      }
    } catch (e) {
      // CustomWidgets.toastValidation(msg: 'Failed to load news');
    } finally {
      if (page.value == 1) {
        isLoading.value = false;
      } else {
        isLoadingMore.value = false;
      }
    }
  }

  void loadMore() {
    page.value += 1;
    isLoadingMore.value = true;
    getNews();
  }
}

import 'dart:io';

import 'package:daily_satori/app/modules/articles/controllers/articles_controller.dart';
import 'package:daily_satori/app/routes/app_pages.dart';
import 'package:daily_satori/global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_time_ago/get_time_ago.dart';

class ArticlesView extends GetView<ArticlesController> {
  const ArticlesView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.loadArticles();

    return Scaffold(
      appBar: AppBar(
        title: const Text('收藏的文章'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            Get.toNamed(Routes.SETTINGS);
          },
        ),
      ),
      body: Obx(() {
        if (controller.articles.isEmpty) {
          return const Center(
            child: Text(
              '还没有收藏内容',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          );
        }
        return ListView.builder(
          controller: controller.scrollController,
          itemCount: controller.articles.length + (controller.isLoading.value ? 1 : 0), // 如果正在加载，增加一个加载项
          itemBuilder: (context, index) {
            if (index == controller.articles.length) {
              return Center(child: CircularProgressIndicator());
            }
            final article = controller.articles[index];
            return ArticleCard(article: article);
          },
        );
      }),
    );
  }
}

class ArticleCard extends StatelessWidget {
  final dynamic article;

  const ArticleCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              (article.aiTitle ?? article.title),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Text(
              article.aiContent ?? article.content,
              maxLines: 10,
              style: const TextStyle(fontSize: 16, letterSpacing: 1.2, height: 1.6),
            ),
            const SizedBox(height: 15),
            if (article.imagePath != null && article.imagePath!.isNotEmpty)
              Container(
                constraints: BoxConstraints(
                  maxHeight: 300, // 设置最大高度为 500px
                ),
                width: double.infinity, // 设置宽度为无限
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15), // 设置圆角半径
                  child: Image.file(
                    File(article.imagePath!),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  getTopLevelDomain(Uri.parse(article.url).host),
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(width: 15),
                Text(
                  (GetTimeAgo.parse(article.pubDate ?? article.createdAt)),
                  style: const TextStyle(color: Colors.grey),
                ),
                Spacer(), // 使用 Spacer 使按钮靠右对齐
                IconButton(
                  icon: const Icon(Icons.favorite_border),
                  onPressed: () {
                    // 收藏按钮的逻辑
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: () {
                    // 分享按钮的逻辑
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

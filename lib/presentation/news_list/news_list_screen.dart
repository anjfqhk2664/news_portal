import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:news_portal/presentation/app/widget/app_logo.dart';
import 'package:news_portal/presentation/app/widget/app_scaffold.dart';
import 'package:news_portal/presentation/news_list/widget/hot_topic.dart';
import 'package:news_portal/presentation/news_list/widget/lastest_news.dart';

class NewsListScreen extends StatelessWidget {
  const NewsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: AppLogo(),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(LucideIcons.search)),
          IconButton(onPressed: () {}, icon: Icon(LucideIcons.menu)),
        ],
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(spacing: 25, children: [HotTopic(), LastestNews()]),
        ),
      ),
    );
  }
}

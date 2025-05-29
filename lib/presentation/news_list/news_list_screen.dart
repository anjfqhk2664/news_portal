import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:news_portal/presentation/app/widget/app_scaffold.dart';
import 'package:news_portal/presentation/news_list/widget/hot_topic.dart';

class NewsListScreen extends StatelessWidget {
  const NewsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(LucideIcons.search)),
          IconButton(onPressed: () {}, icon: Icon(LucideIcons.menu)),
        ],
      ),
      child: Column(children: [HotTopic()]),
    );
  }
}

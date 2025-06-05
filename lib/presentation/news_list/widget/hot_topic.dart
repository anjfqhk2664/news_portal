import 'dart:math';

import 'package:easy_extension/easy_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:news_portal/api/models/news_api.dart';
import 'package:news_portal/api/models/news_data.dart';
import 'package:news_portal/presentation/app/translations/app_trans.dart';

class HotTopic extends StatelessWidget {
  const HotTopic({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          AppTrans.newsList.hotTopic.tr(),
          style: GoogleFonts.jua(
            fontSize: 40, //
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 250,
          child: FutureBuilder(
            future: NewsApi.getTopic(),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(year2023: false),
                  ),
                );
              }

              final topicNews = snapshot.data ?? <NewsData>[];

              if (topicNews.isEmpty) {
                return Center(child: Text(AppTrans.newsList.noData.tr()));
              }

              return CarouselView.weighted(
                flexWeights: [1, 6, 1],
                children: List.generate(topicNews.length, (i) {
                  final topic = topicNews[i];
                  return Card(
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Image.network(
                            fit: BoxFit.cover,
                            topic.imageUrl!,
                            errorBuilder: (context, error, StackTrace) {
                              return Center(
                                child: Icon(LucideIcons.imageOff, size: 25),
                              );
                            },
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [Colors.black, Colors.transparent],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 10,
                          right: 10,
                          bottom: 0,
                          child: Text(
                            topic.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              );
            },
          ),
        ),
      ],
    );
  }
}

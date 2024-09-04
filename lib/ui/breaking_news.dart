import 'package:flutter/material.dart';
import '../components/news_item_list.dart';
import '../model/news_model.dart';
import '../service/api_service.dart';


class BreakingNews extends StatefulWidget {
  const BreakingNews({super.key});

  @override
  State<BreakingNews> createState() => _BreakingNewsState();
}

class _BreakingNewsState extends State<BreakingNews> {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<NewsModel>>(
        future: apiService.getBreakingNews(),
        builder: (context, snapshot) {
          // Check for loading state
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          // Check for errors
          else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          // Check if there is no data
          else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No news available at the moment.'),
            );
          }
          // If data is available
          else {
            List<NewsModel> articleList = snapshot.data!;
            return ListView.builder(
              itemCount: articleList.length,
              itemBuilder: (context, index) {
                return NewsItemsList(newsModel: articleList[index]);
              },
            );
          }
        },
      ),
    );
  }
}

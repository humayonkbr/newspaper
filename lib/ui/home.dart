import 'package:flutter/material.dart';
import 'package:news_project1/ui/all_news.dart';
import 'package:news_project1/ui/breaking_news.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomePageState();
}

class _HomePageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,

        child: Scaffold(

          appBar: AppBar(
            title: const Text('News app'),
            backgroundColor: Colors.blue,
            bottom: const TabBar(
              tabs: [
                Tab(text: 'BreakingNews'),
                Tab(text: 'AllNews'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              BreakingNews(),
              AllNews(),
            ],
          ),
        ));
  }
}
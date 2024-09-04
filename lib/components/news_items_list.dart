import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/news_model.dart';

class NewsItemsList extends StatelessWidget {
  final NewsModel newsModel;

  // Pass the key to the superclass constructor
  const NewsItemsList({Key? key, required this.newsModel})
      : super(key: key); // Correct

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // image section
          CachedNetworkImage(
            height: 120,
            width: 120,
            fit: BoxFit.fill,
            imageUrl:
            ' "https://media.wired.com/photos/6696630a5d2d61e4805c3175/191:100/w_1280,c_limit/GettyImages-1979197796.jpg',
            //imageUrl: newsModel.url.toString(),
            placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),

          const SizedBox(
            width: 16,
          ),

          // content section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1st section
                Text(
                  newsModel.title.toString(),
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                // 2nd section
                Text(
                  newsModel.author.toString(),
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                // 3rd section
                Text(
                  newsModel.content ?? 'Nothing found',
                  maxLines: 4,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(children: [StoryArea(), FeedList()]),
    );
  }
}

class StoryArea extends StatelessWidget {
  const StoryArea({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          10,
          (i) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade300,
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                Text('User $i'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FeedData {
  final String userName;
  final int likeCount;
  final String content;

  FeedData({
    required this.userName,
    required this.likeCount,
    required this.content,
  });
}

final feedDataList = [
  FeedData(
      userName: 'User1',
      likeCount: 50,
      content:
          '오늘 점심은 맛있었다.오늘 점심은 맛있었다.오늘 점심은 맛있었다.오늘 점심은 맛있었다.오늘 점심은 맛있었다.오늘 점심은 맛있었다.'),
  FeedData(userName: 'User2', likeCount: 24, content: '오늘 아침은 맛있었다.'),
  FeedData(userName: 'User3', likeCount: 82, content: '오늘 저녁은 맛있었다.'),
  FeedData(userName: 'User4', likeCount: 92, content: '어제 점심은 맛있었다.'),
  FeedData(userName: 'User5', likeCount: 43, content: '어제 아침은 맛있었다.'),
  FeedData(userName: 'User6', likeCount: 72, content: '어제 저녁은 맛있었다.'),
  FeedData(userName: 'User7', likeCount: 3, content: '오늘 점심은 맛있었다.'),
  FeedData(userName: 'User8', likeCount: 0, content: '오늘 점심은 맛있었다.'),
  FeedData(userName: 'User9', likeCount: 24, content: '오늘 점심은 맛있었다.'),
];

class FeedList extends StatelessWidget {
  const FeedList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: feedDataList.length,
      itemBuilder: (ctx, i) => FeedItem(feedDataList[i]),
    );
  }
}

class FeedItem extends StatelessWidget {
  final FeedData data;

  const FeedItem(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: Row(
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue.shade300,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(data.userName)
                ],
              ),
              const Icon(Icons.more_vert),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          height: 280,
          color: Colors.indigo.shade300,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border_outlined),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(CupertinoIcons.chat_bubble),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(CupertinoIcons.paperplane),
                  )
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.bookmark),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            '좋아요 ${data.likeCount}개',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: data.userName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const WidgetSpan(child: SizedBox(width: 8)),
                TextSpan(text: data.content),
              ],
              style: const TextStyle(color: Colors.black54),
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}

import 'package:material_ui/material_ui.dart';
import '../widgets/newsfeed_card.dart';

class Post {
  Post({
    required this.authorName,
    required this.date,
    required this.text,
    required this.likes,
    this.imageAsset,
    this.avatarAsset,
  });

  final String authorName;
  final String date;
  final String text;
  int likes;
  final String? imageAsset;
  final String? avatarAsset;
}

class NewsFeedScreen extends StatefulWidget {
  const NewsFeedScreen({super.key});

  @override
  State<NewsFeedScreen> createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  final List<Post> _posts = [
    Post(
      authorName: 'Claryze Kate Paggabao',
      date: 'October 11',
      text: 'hi hello',
      likes: 100,
      imageAsset: 'assets/images/claryze.jpg',
      avatarAsset: 'assets/images/claryze.jpg',
    ),
    Post(
      authorName: 'Alex Alejandro',
      date: 'December 2',
      text: 'walang kanin busseng?',
      likes: 200,
      imageAsset: 'assets/images/alex.jpg',
      avatarAsset: 'assets/images/alex.jpg',
    ),
  ];

  void _likePost(int index) {
    setState(() {
      _posts[index].likes += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _posts.length,
      itemBuilder: (context, index) {
        final post = _posts[index];
        return NewsFeedCard(
          authorName: post.authorName,
          date: post.date,
          text: post.text,
          likes: post.likes,
          imageAsset: post.imageAsset,
          avatarAsset: post.avatarAsset,
          onLike: () => _likePost(index),
        );
      },
    );
  }
}

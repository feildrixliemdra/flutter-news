import 'package:flutter/material.dart';
import 'package:flutternews/screens/article_screen.dart';

class ArticleCard extends StatelessWidget {
  final String imgUrl, title, desc, content, posturl;

  ArticleCard(
      {this.imgUrl,
      this.title,
      this.desc,
      this.content,
      @required this.posturl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Article(articleUrl: posturl)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
              child: Image.network(imgUrl),
              borderRadius: BorderRadius.circular(10.0),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              title,
              softWrap: true,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              desc,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black38,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

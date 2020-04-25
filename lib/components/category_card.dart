import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CategoryCard extends StatelessWidget {
  final String imageUrl, categoryName;
  final Function ontapFunc;
  CategoryCard({this.imageUrl, this.categoryName, this.ontapFunc});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontapFunc,
      child: Container(
        margin: EdgeInsets.only(right: 14.0),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                width: 120.0,
                height: 60.0,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 120.0,
              height: 60.0,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                categoryName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );
  }
}

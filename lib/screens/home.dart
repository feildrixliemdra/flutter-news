import 'package:flutter/material.dart';
import 'package:flutternews/components/article_card.dart';
import 'package:flutternews/components/category_card.dart';
import 'package:flutternews/models/article_model.dart';
import 'package:flutternews/models/category_model.dart';
import 'package:flutternews/helpers/news_helper.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

List<CategoryModel> categories;
List<ArticleModel> articles = [];
bool _loading = true;

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    categories = CategoryModel().getCategories();
    getArticles('all');
  }

  void getArticles(String category) async {
    News newsClass = News();
    await newsClass.getNews(category);
    setState(() {
      articles = newsClass.articles;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Flutter',
              style: TextStyle(color: Colors.black),
            ),
            Text('News', style: TextStyle(color: Colors.blue))
          ],
        ),
      ),
      body: _loading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              child: Column(
                children: <Widget>[
                  //CATEGORY
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    height: 70,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CategoryCard(
                          ontapFunc: () {
                            getArticles(categories[index].categoryName);
                          },
                          categoryName: categories[index].categoryName,
                          imageUrl: categories[index].imageUrl,
                        );
                      },
                      itemCount: categories.length,
                    ),
                  ),
                  //ARTICLES
                  Expanded(
                    child: Container(
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        itemCount: articles.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ArticleCard(
                            title: articles[index].title,
                            imgUrl: articles[index].urlToImage,
                            desc: articles[index].description,
                            posturl: articles[index].articleUrl,
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}

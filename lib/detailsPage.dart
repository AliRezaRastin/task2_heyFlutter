import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String url;

  DetailsPage({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_rounded),
        ),
        title: Text('Details Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Hero(
          tag: 'image-$url',
          child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(url),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

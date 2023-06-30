import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';

class imageSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List images = [
      'assets/images/s1.jpg',
      'assets/images/s2.jpg',
      'assets/images/s3.jpg'
    ];
    return Scaffold(
      appBar: AppBar(title: Text('Image slider')),
      body: Center(
          child: ListView(children: [
        SizedBox(
          height: 30,
        ),
        CarouselSlider(
          options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 1),
              height: 186,
              aspectRatio: 16 / 9,
              enlargeCenterPage: true),
          items: images
              .map((imgurl) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    child: Image.asset(
                      imgurl,
                      fit: BoxFit.fill,
                    ),
                  ))
              .toList(),
        ),
        SizedBox(
          height: 30,
        ),
        CarouselSlider.builder(
            itemCount: images.length,
            itemBuilder: (context, index, realIndex) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: Image.asset(
                  images[index],
                  fit: BoxFit.fill,
                ),
              );
            },
            options: CarouselOptions(
                height: 186, aspectRatio: 16 / 9, initialPage: 1))
      ])),
    );
    throw UnimplementedError();
  }
}

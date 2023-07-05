import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';

class imageSlider extends StatefulWidget {
  @override
  State<imageSlider> createState() => _imageSliderState();
}

class _imageSliderState extends State<imageSlider> {
  var backgroudColor = Color.fromARGB(255, 255, 255, 255);
  @override
  Widget build(BuildContext context) {
    List images = [
      'assets/images/s1.jpg',
      'assets/images/s2.jpg',
      'assets/images/s3.jpg'
    ];

    bool? cSharpBool = true;
    return Scaffold(
      appBar: AppBar(title: Text('Image slider')),
      body: Container(
          alignment: Alignment.center,
          color: backgroudColor,
          child: StatefulBuilder(builder:
              (BuildContext context, void Function(void Function()) setState) {
            return ListView(children: [
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
              Text('Guess the answer of 1+1:'),
              RadioListTile(
                value: Color.fromARGB(255, 255, 255, 255),
                groupValue: backgroudColor,
                onChanged: (value) {
                  setState(() {
                    backgroudColor = value!;
                  });
                },
                title: Text('White'),
              ),
              RadioListTile(
                value: Color.fromARGB(255, 41, 41, 41),
                groupValue: backgroudColor,
                onChanged: (value) {
                  setState(() {
                    backgroudColor = value!;
                  });
                },
                title: Text('Black'),
              ),
              CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text('C#'),
                  value: cSharpBool,
                  onChanged: (bool? value) {
                    setState(() {
                      cSharpBool = value!;
                      print(cSharpBool);
                    });
                  }),
              Switch(
                  value: cSharpBool!,
                  onChanged: (val) {
                    setState(
                      () {
                        cSharpBool = val;
                      },
                    );
                  })
            ]);
          })),
    );
    throw UnimplementedError();
  }
}

import 'dart:io';

import 'package:bmi_demo/drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

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
    String hiint = '';
    bool? cSharpBool = true;
    ImagePicker imgpick = ImagePicker();
    File? pickedimage;
    fetchimg() async {
      final XFile? image = await imgpick.pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      }
      setState(() {
        pickedimage = File(image.path);
      });
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {}),
      drawer: drawer(),
      appBar: AppBar(
        title: Text('Image slider'),
      ),
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
                  }),
              DropdownButton(
                  value: images[1],
                  items: images.map((e) {
                    return DropdownMenuItem(
                      child: Text('${e}'),
                      value: e,
                    );
                  }).toList(),
                  onChanged: (zzz) {
                    setState(() {
                      hiint = zzz.toString();
                    });
                  }),
              ExpansionTile(
                title: Text('Section A'),
                collapsedBackgroundColor: Color.fromARGB(255, 60, 117, 150),
                backgroundColor: Color.fromARGB(255, 123, 173, 202),
                children: [
                  Divider(color: Color.fromARGB(255, 148, 148, 148)),
                  ListTile(
                    tileColor: Color.fromARGB(255, 60, 117, 150),
                    title: Text('Group 1'),
                    subtitle: Text('hiiiiiiiii'),
                  ),
                  Text('Group 2')
                ],
              ),
              SizedBox(
                height: 40.0,
                child: Card(
                  color: Color.fromARGB(255, 60, 117, 150),
                  child: Marquee(
                    text: 'Text()',
                    blankSpace: 20,
                    velocity: 100,
                    accelerationDuration: Duration(seconds: 2),
                    accelerationCurve: Curves.easeInExpo,
                  ),
                ),
              ),
              pickedimage == null ? Text('data') : Image.file(pickedimage!),
              Form(
                  child: SingleChildScrollView(
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'username'),
                ),
              ))
            ]);
          })),
    );
    throw UnimplementedError();
  }
}

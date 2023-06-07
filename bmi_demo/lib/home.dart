import 'dart:math';

import 'package:bmi_demo/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

const interSpace = 10.0;
const framePadding = 15.0;
const elementSpacing = 10.0;
const Color offSelectedColor = Color.fromARGB(255, 140, 173, 162);

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isMale = false;
  int weight = 60;
  int age = 18;
  double height = 170;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(framePadding),
        child: Column(children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isMale = true;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: isMale
                              ? Theme.of(context).primaryColor
                              : offSelectedColor),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.male,
                            size: 40,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            height: elementSpacing,
                          ),
                          Text(
                            "Male",
                            style:
                                Theme.of(context).primaryTextTheme.bodyMedium,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: interSpace, height: interSpace),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isMale = false;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: !isMale
                              ? Theme.of(context).primaryColor
                              : offSelectedColor),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.female,
                            size: 40,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            height: elementSpacing,
                            width: 70,
                          ),
                          Text(
                            "Female",
                            style:
                                Theme.of(context).primaryTextTheme.bodyMedium,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(width: interSpace, height: interSpace),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: offSelectedColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height:',
                    style: Theme.of(context).primaryTextTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: elementSpacing,
                    width: 70,
                  ),
                  Text(
                    '${height}cm',
                    style: Theme.of(context).primaryTextTheme.bodyMedium,
                  ),
                  Slider(
                      value: height,
                      min: 0,
                      max: 300,
                      label: '${height}cm',
                      onChanged: (newValue) {
                        setState(() {
                          height = double.parse(newValue.toStringAsFixed(2));
                        });
                      }),
                ],
              ),
            ),
          ),
          SizedBox(width: interSpace, height: interSpace),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: offSelectedColor),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight:',
                          style: Theme.of(context).primaryTextTheme.bodyMedium,
                        ),
                        const SizedBox(
                          height: elementSpacing,
                        ),
                        Text(
                          '${weight}',
                          style: Theme.of(context).primaryTextTheme.bodyMedium,
                        ),
                        const SizedBox(
                          height: elementSpacing,
                        ),
                        amountButtons('weight')
                      ],
                    ),
                  ),
                ),
                SizedBox(width: interSpace, height: interSpace),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: offSelectedColor),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age:',
                          style: Theme.of(context).primaryTextTheme.bodyMedium,
                        ),
                        const SizedBox(
                          height: elementSpacing,
                        ),
                        Text(
                          '${age}',
                          style: Theme.of(context).primaryTextTheme.bodyMedium,
                        ),
                        const SizedBox(
                          height: elementSpacing,
                        ),
                        amountButtons('age')
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: interSpace),
          ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)))),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Result(
                          result: bmiValue(), isMale: isMale, age: age)));
            },
            child: Container(
                alignment: Alignment.center,
                height: 40,
                width: double.infinity,
                child: Text('Calculate')),
          )
        ]),
      ),
    );
  }

  Row amountButtons(String varr) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton(
          heroTag: '$varr -',
          onPressed: () {
            showToast('mainAxisAlignment/FloatingActionButton',
                context: context,
                borderRadius: BorderRadius.circular(40),
                textPadding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                animation: StyledToastAnimation.scale,
                reverseAnimation: StyledToastAnimation.fade,
                position: StyledToastPosition(
                    align: Alignment.bottomCenter, offset: 100.0),
                animDuration: Duration(milliseconds: 500),
                duration: Duration(seconds: 2),
                curve: Curves.elasticOut,
                reverseCurve: Curves.linear,
                backgroundColor: Color.fromARGB(244, 66, 66, 66));
            setState(() {
              switch (varr) {
                case 'weight':
                  weight--;
                  break;
                case 'age':
                  age--;
                  break;
                default:
              }
            });
          },
          child: Icon(Icons.remove),
          mini: true,
        ),
        SizedBox(
          width: elementSpacing,
        ),
        FloatingActionButton(
          heroTag: '$varr +',
          onPressed: () {
            setState(() {
              switch (varr) {
                case 'weight':
                  weight++;
                  break;
                case 'age':
                  age++;
                  break;
                default:
              }
            });
          },
          child: Icon(Icons.add),
          mini: true,
        ),
      ],
    );
  }

  double bmiValue() {
    return weight / pow(height / 100, 2);
  }
}

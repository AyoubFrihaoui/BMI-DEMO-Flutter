import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final double result;
  final bool isMale;
  final int age;

  const Result(
      {super.key,
      required this.result,
      required this.isMale,
      required this.age});

  String get resultPhrase {
    String resultText = '';
    if (result < 18.5)
      resultText = 'Underweight';
    else if (result >= 18.5 && result < 25)
      resultText = 'Normalweight';
    else if (result >= 25 && result < 30)
      resultText = 'Overweight';
    else if (result >= 30) resultText = 'Obese';

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Result')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Gender: ${this.isMale ? 'Male' : 'Female'}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Age: ${this.age}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Result: ${this.result.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Health: ${resultPhrase}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)))),
                onPressed: () {
                  final AlertDialog alert = AlertDialog(
                    icon: Icon(Icons.account_balance_rounded),
                    title: Text('data'),
                    content: Container(
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: Text('close'))),
                  );
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return alert;
                      });
                },
                child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: double.infinity,
                    child: Text('Dialog')),
              )
            ],
          ),
        ),
      ),
    );

    // TODO: implement build
    // ignore: dead_code
    throw UnimplementedError();
  }
}

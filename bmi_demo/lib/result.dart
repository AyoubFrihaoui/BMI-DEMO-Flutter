import 'package:flutter/material.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';

class Result extends StatefulWidget {
  final double result;
  final bool isMale;
  final int age;

  const Result(
      {super.key,
      required this.result,
      required this.isMale,
      required this.age});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  String get resultPhrase {
    String resultText = '';
    if (widget.result < 18.5)
      resultText = 'Underweight';
    else if (widget.result >= 18.5 && widget.result < 25)
      resultText = 'Normalweight';
    else if (widget.result >= 25 && widget.result < 30)
      resultText = 'Overweight';
    else if (widget.result >= 30) resultText = 'Obese';

    return resultText;
  }

  String appBarTitle = 'Result';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(appBarTitle)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Gender: ${this.widget.isMale ? 'Male' : 'Female'}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Age: ${this.widget.age}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Result: ${this.widget.result.toStringAsFixed(2)}',
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
              ),
              SizedBox(
                height: 10,
              ),
              snackbar(context),
              SizedBox(
                height: 10,
              ),
              flushbar(context)
            ],
          ),
        ),
      ),
    );

    // TODO: implement build
    // ignore: dead_code
    throw UnimplementedError();
  }

  ElevatedButton snackbar(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            appBarTitle = 'hi';
          });
          final snk = SnackBar(
            action: SnackBarAction(
                textColor: Color.fromARGB(255, 218, 218, 218),
                label: 'Undo',
                onPressed: () {
                  setState(() {
                    appBarTitle = 'Result';
                  });
                }),
            content: Text(
              'data',
            ),
            duration: Duration(milliseconds: 1500),
            backgroundColor: Color.fromARGB(255, 223, 105, 105),
          );
          ScaffoldMessenger.of(context).showSnackBar(snk);
        },
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('snackbar'),
        ));
  }

  ElevatedButton flushbar(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          final flush = Flushbar(
            mainButton: TextButton(
              child: Icon(
                Icons.close,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: 'warning',
            message: 'hhhh',
            icon: Icon(
              Icons.warning,
              color: Colors.white,
            ),
          );
          flush.show(context);
        },
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('flush bar'),
        ));
  }
}

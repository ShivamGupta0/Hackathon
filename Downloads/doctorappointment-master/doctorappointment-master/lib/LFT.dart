import 'package:docappointmentnew/colorScheme.dart';
import 'package:flutter/material.dart';
import 'package:ml_algo/ml_algo.dart';
import 'package:ml_dataframe/ml_dataframe.dart';
import 'package:ml_preprocessing/ml_preprocessing.dart';
import 'package:flutter/services.dart' show rootBundle;

class LFT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "LFT",
      home: lft(),
    );
  }
}
//class docInfoPage extends StatefulWidget {
//  @override
//  _docInfoPageState createState() => _docInfoPageState();
//}
//
//class _docInfoPageState extends State<docInfoPage> {
//  @override
//  Widget build(BuildContext context) {
//
//  }
//}
//
//
//void main() => runApp(MyApp());
//
//class MyApp extends StatefulWidget {
//  @override
//  _MyAppState createState() => _MyAppState();
//}
//
//class _MyAppState extends State<MyApp> {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: "FormValidation",
//      home: MyHomePage(),
//    );
//  }
//}

class lft extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<lft> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String email = "";
  String password = "";
  String a, b, c, d, e, f, g, h, i, j, x = "";

  void _submit() async {
    print("hello ttr");
    final rawCsvContent =
        await rootBundle.loadString('assets/images/indian_liver_patient.csv');
    final samples = DataFrame.fromRawCsv(rawCsvContent);
    final targetColumnName = 'Dataset';
    final splits = splitData(samples, [0.7]);
    final validationData = splits[0];
    final testData = splits[1];
    final validator = CrossValidator.kFold(validationData, numberOfFolds: 5);
    final createClassifier = (DataFrame samples) => LogisticRegressor(
          samples,
          targetColumnName,
          optimizerType: LinearOptimizerType.gradient,
          iterationsLimit: 90,
          learningRateType: LearningRateType.decreasingAdaptive,
          batchSize: samples.rows.length,
          probabilityThreshold: 0.7,
        );
    final scores =
        await validator.evaluate(createClassifier, MetricType.accuracy);
    final accuracy = scores.mean();
    print('accuracy on k fold validation: ${accuracy.toStringAsFixed(2)}');
    final testSplits = splitData(testData, [0.8]);
    final classifier = createClassifier(testSplits[0]);
    // final finalScore = classifier.assess(testSplits[1], MetricType.accuracy);
    //await classifier.saveAsJson('diabetes_classifier.json');
    String raw = a +
        ',' +
        c +
        ',' +
        d +
        ',' +
        e +
        ',' +
        f +
        ',' +
        g +
        ',' +
        h +
        ',' +
        i +
        ',' +
        j +
        '\n';
    final rawContent =
        'Age,Total_Bilirubin,Direct_Bilirubin,Alkaline_Phosphotase,Alamine_Aminotransferase,Aspartate_Aminotransferase,Total_Protiens,Albumin,Albumin_and_Globulin_Ratio\n' +
            raw;
    // 'column_1,column_2,column_3\n' +
    // '100,200,300\n' +
    // '400,500,600\n' +
    // '700,800,900\n';
    final df = DataFrame.fromRawCsv(rawContent);
    final prediction = classifier.predict(df);
    // String x = prediction.rows.toString();
    setState(() {
      x = prediction.rows.toString();
      if (x == '((2.0))') {
        x = 'Something is not right, Consult your Doctor';
      } else {
        x = 'Everything seems right';
      }
    });
    print(x);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liver Function Test"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Total_Protiens'),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (value) {
                        setState(() {
                          h = value;
                        });
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Albumin'),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (value) {
                        setState(() {
                          i = value;
                        });
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Albumin and Globulin Ratio'),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (value) {
                        setState(() {
                          j = value;
                        });
                      },
                    ),
                    // this is where the
                    // input goes
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Total_Bilirubin'),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (value) {
                        setState(() {
                          c = value;
                        });
                      },
                    ),
                    TextFormField(
                      decoration:
                          InputDecoration(labelText: 'Alkaline_Phosphotase'),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (value) {
                        setState(() {
                          e = value;
                        });
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Alamine_Aminotransferase'),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (value) {
                        setState(() {
                          f = value;
                        });
                      },
                    ),
                    TextFormField(
                      decoration:
                          InputDecoration(labelText: 'Direct_Bilirubin'),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (value) {
                        setState(() {
                          d = value;
                        });
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Aspartate_Aminotransferase'),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (value) {
                        setState(() {
                          g = value;
                        });
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Age'),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (value) {
                        setState(() {
                          a = value;
                        });
                      },
                    ),

                    RaisedButton(
                      onPressed: _submit,
                      child: Text("submit"),
                    ),
                  ],
                ),
              ),
              // this is where
              // the form field
              // are defined
              SizedBox(
                height: 20,
              ),
              Column(
                children: <Widget>[
                  x == '' ? Text('Enter') : Text(x),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

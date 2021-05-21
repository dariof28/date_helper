import 'package:date_helper/date_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter DateTimeHelpers Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(title: 'Flutter DateTimeHelpers Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title!)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Center(
              child: ElevatedButton(
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: new DateTime(2021, 01, 01),
                    lastDate: new DateTime(2100, 12, 31),
                  ).then((value) => setState(() {
                        if (value != null) {
                          selectedDate = value;
                        }
                      }));
                },
                child: Text('Select a date'),
              ),
            ),
            Text('Selected date is ${DateFormat.yMd().format(selectedDate)}'),
            Text(
              'Day after will be ${DateFormat.yMd().format(selectedDate.tomorrow)}',
            ),
            Text(
              'Day before was ${DateFormat.yMd().format(selectedDate.yesterday)}',
            ),
            Text(
              'Day starts at ${DateFormat.yMd().add_jm().format(selectedDate.dayStart)}',
            ),
            Text(
              'Day ends at ${DateFormat.yMd().add_jm().format(selectedDate.dayEnd)}',
            ),
            Text(
              'Right now (${DateFormat.jm().format((DateTime.now()))}) is ${DateTime.now().isAM ? 'AM' : 'PM'}',
            ),
            Text(
              'Selected date next sunday will be ${DateFormat.yMd().format(selectedDate.following(DateTime.sunday))}',
            ),
            Text(
              'Selected date previous sunday was ${DateFormat.yMd().format(selectedDate.previous(DateTime.sunday))}',
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime firstDay = DateTime.now();
  late SharedPreferences prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPrefs();
  }

  Future initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    final String? _firstDay = prefs.getString('firstDay');
    if (_firstDay != null) {
      setState(() {
        firstDay = DateTime.parse(_firstDay);
      });
    }
  }

  void onHeartPressed() async {
    await showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.white,
            height: 300,
            child: CupertinoDatePicker(
              initialDateTime: firstDay,
              maximumDate: DateTime.now(),
              onDateTimeChanged: (DateTime date)  {
                setState(() {
                  firstDay = date;
                });
              },
              mode: CupertinoDatePickerMode.date,
            ),
          ),
        );
      },
      barrierDismissible: true,
    );
    await prefs.setString('firstDay', firstDay.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        top: true,
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _DdayBox(
              onHeartPressed: onHeartPressed,
              firstDay: firstDay,
            ),
            _CoupleImageBox(),
          ],
        ),
      ),
    );
  }
}

class _DdayBox extends StatelessWidget {
  final DateTime firstDay;
  final GestureTapCallback onHeartPressed;

  const _DdayBox(
      {super.key, required this.firstDay, required this.onHeartPressed});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final now = DateTime.now();

    return Column(
      children: [
        SizedBox(
          height: 16,
        ),
        Text(
          'U&I',
          style: textTheme.displayLarge,
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          '우리 처음 만난 날',
          style: textTheme.bodyLarge,
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          '${firstDay.year}.${firstDay.month}.${firstDay.day}',
          style: textTheme.bodyMedium,
        ),
        SizedBox(
          height: 16,
        ),
        IconButton(
          iconSize: 60.0,
          onPressed: onHeartPressed,
          icon: Icon(
            Icons.favorite,
            color: Colors.red,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          'D+${DateTime(now.year, now.month, now.day).difference(firstDay).inDays + 1}',
          style: textTheme.displayMedium,
        ),
      ],
    );
  }
}

class _CoupleImageBox extends StatelessWidget {
  const _CoupleImageBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Image.asset(
          'assets/imgs/cute-couple.png',
          height: MediaQuery.of(context).size.height,
        ),
      ),
    );
  }
}

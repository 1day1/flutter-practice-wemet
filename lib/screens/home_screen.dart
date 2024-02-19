import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            _DdayBox(),
            _CoupleImageBox(),
          ],
        ),
      ),
    );
  }
}

class _DdayBox extends StatelessWidget {
  const _DdayBox({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        SizedBox(height: 16,),
        Text(
          'U&I',
          style: textTheme.displayLarge,
        ),
        SizedBox(height: 16,),
        Text(
          '우리 처음 만난 날',
          style: textTheme.bodyLarge,
        ),
        SizedBox(height: 16,),
        Text(
          '2024.2.20',
          style: textTheme.bodyMedium,
        ),
        SizedBox(height: 16,),
        IconButton(
          iconSize: 60.0,
          onPressed: () {},
          icon: Icon(
            Icons.favorite,
            color: Colors.red,
          ),
        ),
        SizedBox(height: 16,),
        Text(
          'D+365',
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

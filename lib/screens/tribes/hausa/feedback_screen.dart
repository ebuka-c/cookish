import 'package:cookish/constants/colors.dart';
import 'package:cookish/utilities/extensions.dart';
import 'package:flutter/material.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        actions: [const Icon(Icons.more_horiz), SizedBox(width: 10.0.w)],
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 10.0.h),
          child: Column(
            children: [
              Row(
                children: [],
              )
            ],
          )),
    );
  }
}

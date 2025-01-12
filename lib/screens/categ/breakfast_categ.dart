import 'package:cookish/constants/custom_textstyles.dart';
import 'package:cookish/utilities/extensions.dart';
import 'package:cookish/widgets/search_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';

final _search = TextEditingController();

class BreakfastCateg extends StatelessWidget {
  const BreakfastCateg({super.key});

  @override
  Widget build(BuildContext context) {
    var priColor = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 11.0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchTextField(controller: _search),
            SizedBox(height: 52.0.h),
            Text(
              'Breakfast',
              style: titleLarge.copyWith(
                  color: priColor, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}

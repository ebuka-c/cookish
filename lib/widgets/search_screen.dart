import 'package:cookish/widgets/search_textfield.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final searchCntrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Filter the search items based on the query

    return Scaffold(
      backgroundColor: AppColors.appBackground,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.white,
        centerTitle: false,
        title: SearchTextField(
          controller: searchCntrl,
          autofocus: true,
        ),
      ),
    );
  }
}

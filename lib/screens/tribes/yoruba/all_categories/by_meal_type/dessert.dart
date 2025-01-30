import 'package:cookish/constants/custom_textstyles.dart';
import 'package:cookish/screens/tribes/hausa/details_screen.dart';
import 'package:cookish/utilities/extensions.dart';
import 'package:cookish/widgets/search_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/colors.dart';
import '../../../../app_data/yoruba_data.dart';

class YorubaDessertCateg extends StatefulWidget {
  const YorubaDessertCateg(
      {super.key, required this.priColor, required this.title});
  final Color priColor;
  final String title;

  @override
  State<YorubaDessertCateg> createState() => _yorubaDessertCategState();
}

class _yorubaDessertCategState extends State<YorubaDessertCateg>
    with SingleTickerProviderStateMixin {
  final TextEditingController _search = TextEditingController();
  List<Map<String, dynamic>> filteredSoupList = [];

  late AnimationController _controller;
  late List<Animation<Offset>> animations;
  late Animation<double> fadeAnimation;
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    animations = List.generate(
      yorubaDessertList.length,
      (index) => Tween<Offset>(
        begin: const Offset(0, 1),
        end: const Offset(0, 0),
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(index * 0.2, 1.0, curve: Curves.easeOut),
        ),
      ),
    );

    _controller.forward();
    fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    // Initialize filtered list with all items
    filteredSoupList = List.from(yorubaDessertList);

    // Listen to search input
    _search.addListener(_filterSoupList);
  }

  @override
  void dispose() {
    _controller.dispose();
    _search.removeListener(_filterSoupList);
    _search.dispose();
    super.dispose();
  }

  void _filterSoupList() {
    String query = _search.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        filteredSoupList = List.from(yorubaDessertList);
      } else {
        filteredSoupList = yorubaDessertList.where((soup) {
          return soup['name']!.toLowerCase().contains(query);
        }).toList();
      }
    });
  }

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
            SearchTextField(
              controller: _search,
              hintText: "Search",
            ),
            SizedBox(height: 20.0.h),
            Text(
              widget.title,
              style: titleLarge.copyWith(
                color: priColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 30.0.h),
            Expanded(
              child: filteredSoupList.isEmpty
                  ? Center(
                      child: Text(
                        "No related items for your search",
                        style: bodyLarge.copyWith(color: Colors.grey),
                      ),
                    )
                  : ListView.separated(
                      shrinkWrap: true,
                      itemCount: filteredSoupList.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10.0.h),
                      itemBuilder: (context, index) {
                        return SlideTransition(
                          position: animations[index % animations.length],
                          child: InkWell(
                            onTap: () {
                              final soupName = filteredSoupList[index]['name'];
                              final soupAlias =
                                  filteredSoupList[index]['alias'];
                              final soupIngredients =
                                  filteredSoupList[index]['ingredients'];
                              final preparationSteps =
                                  filteredSoupList[index]['steps'];
                              final image = filteredSoupList[index]['image'];
                              Get.to(DetailsScreen(
                                  name: soupName,
                                  alias: soupAlias,
                                  ingredients: soupIngredients,
                                  steps: preparationSteps,
                                  image: image));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: widget.priColor,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: widget.priColor, width: 1),
                              ),
                              child: Text(
                                filteredSoupList[index]['name']!,
                                style:
                                    bodyLarge.copyWith(color: AppColors.white),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

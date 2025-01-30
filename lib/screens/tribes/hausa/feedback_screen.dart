// import 'package:cookish/constants/colors.dart';
// import 'package:cookish/constants/custom_textstyles.dart';
// import 'package:cookish/constants/texts_and_strings.dart';
// import 'package:cookish/utilities/extensions.dart';
// import 'package:flutter/material.dart';

// import '../../../widgets/custom_tab_widget.dart';

// class FeedbackScreen extends StatelessWidget {
//   const FeedbackScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       initialIndex: 2,
//       length: 3,
//       child: Scaffold(
//         backgroundColor: AppColors.feedbackBg,
//         appBar: AppBar(
//           backgroundColor: AppColors.transparent,
//           actions: [const Icon(Icons.more_horiz), SizedBox(width: 16.0.w)],
//           bottom: PreferredSize(
//             preferredSize: Size.fromHeight(60.0.h),
//             child: Padding(
//               padding: EdgeInsets.symmetric(vertical: 10.0.h),
//               child: Builder(
//                 builder: (context) {
//                   return const TabBar(
//                     dividerColor: AppColors.transparent,
//                     indicator: BoxDecoration(),
//                     labelPadding: EdgeInsets.symmetric(horizontal: 10),
//                     tabs: [
//                       CustomTabWidget('Cookware', 0),
//                       CustomTabWidget('Ingredients', 1),
//                       CustomTabWidget('Instructions', 2),
//                     ],
//                   );
//                 },
//               ),
//             ),
//           ),
//         ),
//         body: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 16.0.w),
//           child: const TabBarView(
//             children: [
//               Center(
//                 child: Text('Cookware'),
//               ),
//               Center(
//                 child: Text('Ingredients'),
//               ),
//               InstructionsTab(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// /*
//   Widget _buildTabItem(BuildContext context, String text, int index) {
//     return Tab(
//       child: AnimatedBuilder(
//         animation: DefaultTabController.of(context),
//         builder: (context, child) {
//           bool isSelected = DefaultTabController.of(context).index == index;
//           return Container(
//             width: 110.0.w,
//             height: 45.0.h,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(16),
//               color: isSelected ? AppColors.activePVBtn : AppColors.white,
//               border: Border.all(
//                   color:
//                       isSelected ? AppColors.activePV : AppColors.inactivePV),
//             ),
//             child: Center(
//               child: Text(text,
//                   style: bodyLarge.copyWith(
//                     fontWeight: FontWeight.w700,
//                     color: AppColors.primaryText,
//                   )),
//             ),
//           );
//         },
//       ),
//     );
//   }
// */
// }

// class InstructionsTab extends StatelessWidget {
//   const InstructionsTab({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//         itemBuilder: (context, index) {
//           return Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('${index + 1}',
//                   style: titleMedium2.copyWith(color: AppColors.lightText2)),
//               SizedBox(width: 13.0.w),
//               Expanded(
//                   child: Column(
//                 children: [
//                   Text(instruction1, style: titleMedium2),
//                   SizedBox(height: 8.0.h),
//                   Text(
//                     ingredient1,
//                     style: titleSmall,
//                   )
//                 ],
//               ))
//             ],
//           );
//         },
//         separatorBuilder: (_, __) => SizedBox(height: 20.0.h),
//         itemCount: 3);
//   }
// }

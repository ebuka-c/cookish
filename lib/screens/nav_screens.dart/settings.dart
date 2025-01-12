import 'package:cookish/constants/colors.dart';
import 'package:cookish/constants/custom_textstyles.dart';
import 'package:cookish/controllers/auth_controller.dart';
import 'package:cookish/utilities/extensions.dart';
import 'package:cookish/widgets/button_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../dialogs/logout_dialog.dart';

final _authC = Get.find<AuthController>();

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground,
      body: Center(
        child: InkWell(
          onTap: () async {
            //
            final logOut = await logOutDialog(context: context);
            if (logOut ?? false) {
              await _authC.logoutwEmailPwd();
            }
          },
          child: Container(
            width: double.infinity,
            height: 65.0.h,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: AppColors.lightText2)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(() {
                      if (_authC.isLoading.value) {
                        return const AppLoadingIndicator();
                      }
                      return Text('Logout', style: titleSmall);
                    }),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.lightText2,
                      size: 15,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:cookish/utilities/extensions.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../constants/colors.dart';
// import '../../constants/custom_textstyles.dart';
// import '../../constants/images.dart';
// import '../../controllers/auth_controller.dart';
// import '../../page_routes/route_name.dart';
// import '../../utilities/validators.dart';
// import '../../widgets/app_button.dart';
// import '../../widgets/auth_textfield.dart';

// final _authC = Get.find<AuthController>();

// final _formKey = GlobalKey<FormState>();

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // values to track input & validity
//     final RxString emailInput = ''.obs;
//     final RxBool isEmailValid = false.obs;

//     void validateEmail(String value) {
//       emailInput.value = value;
//       isEmailValid.value =
//           value.isNotEmpty && AppValidators.validateMyEmail(value) == null;
//     }

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.transparent,
//         elevation: 0,
//         leading: GestureDetector(
//           onTap: () => Get.back,
//           child: const Icon(Icons.arrow_back),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 24.0.h),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('Login', style: titleLarge),
//                   SizedBox(height: 30.0.h),
//                   Obx(() {
//                     return AuthTextField(
//                         controller: _authC.emailController,
//                         keyboardType: TextInputType.emailAddress,
//                         title: 'Email address',
//                         suffixIcon: emailInput.value.isNotEmpty
//                             ? Icon(
//                                 isEmailValid.value
//                                     ? Icons.check_circle
//                                     : CupertinoIcons.exclamationmark_circle,
//                                 color: isEmailValid.value
//                                     ? Colors.green
//                                     : Colors.red,
//                               )
//                             : null,
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                         onChanged: validateEmail,
//                         validator: AppValidators.validateMyEmail,
//                         bottomMargin: 14.0.h,
//                         hasSubtitle: false,
//                         obscureText: false);
//                   }),
//                   Obx(() {
//                     return AuthTextField(
//                         controller: _authC.passwordController,
//                         title: 'Password',
//                         hasSubtitle: false,
//                         suffixIcon: GestureDetector(
//                           onTap: () {
//                             _authC.passwordObscure.value =
//                                 !_authC.passwordObscure.value;
//                           },
//                           child: Icon(
//                             _authC.passwordObscure.value
//                                 ? Icons.visibility_off
//                                 : Icons.visibility,
//                             color: AppColors.primaryText,
//                           ),
//                         ),
//                         bottomMargin: 16.0.h,
//                         obscureText: _authC.passwordObscure.value);
//                   }),
//                   GestureDetector(
//                     onTap: () {},
//                     child: Text(
//                       'Forgot Password?',
//                       style: bodyMedium.copyWith(fontWeight: FontWeight.w600),
//                     ),
//                   ),
//                   SizedBox(height: 20.0.h),
//                   AppButton(
//                     onTap: () {
//                       if (_formKey.currentState?.validate() ?? false) {
//                         print('login');
//                       }
//                     },
//                     text: 'Login',
//                     textColor: AppColors.lightText2,
//                     btnColor: AppColors.inactiveBtnState,
//                   ),
//                   SizedBox(height: 20.0.h),
//                   Row(
//                     children: <Widget>[
//                       Expanded(
//                         child: Divider(
//                             color: AppColors.inactiveBtnState,
//                             endIndent: 8.0.w),
//                       ),
//                       Text(
//                         'Or',
//                         style: bodyMedium.copyWith(color: AppColors.lightText2),
//                       ),
//                       Expanded(
//                         child: Divider(
//                             color: AppColors.inactiveBtnState, indent: 8.0.w),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 20.0.h),
//                   AppButton(
//                     onTap: () {},
//                     btnColor: AppColors.white,
//                     border:
//                         Border.all(width: 1, color: AppColors.textfieldBorder),
//                     btnChild: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Image.asset(
//                           AppImages.google,
//                           width: 18.0.w,
//                           height: 18.0.h,
//                         ),
//                         SizedBox(width: 10.0.w),
//                         Text(
//                           'Login with Google',
//                           style:
//                               titleSmall.copyWith(fontWeight: FontWeight.w500),
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 14.0.h),
//                   AppButton(
//                     onTap: () {},
//                     btnColor: AppColors.appBlue,
//                     border:
//                         Border.all(width: 1, color: AppColors.textfieldBorder),
//                     btnChild: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Image.asset(
//                           AppImages.facebook,
//                           width: 18.0.w,
//                           height: 18.0.h,
//                         ),
//                         SizedBox(width: 10.0.w),
//                         Text(
//                           'Login with Facebook',
//                           style: titleSmall.copyWith(
//                               fontWeight: FontWeight.w500,
//                               color: AppColors.white),
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 70.0.h),
//                   Center(
//                     child: RichText(
//                       text: TextSpan(
//                         text: 'Not a member? ',
//                         style: bodyLarge.copyWith(
//                             fontWeight: FontWeight.w500,
//                             color: AppColors.lightText),
//                         children: [
//                           TextSpan(
//                             text: 'Sign Up',
//                             style: bodyLarge.copyWith(
//                                 fontWeight: FontWeight.w500,
//                                 decoration: TextDecoration.underline,
//                                 color: AppColors.primaryText),
//                             recognizer: TapGestureRecognizer()
//                               ..onTap = () {
//                                 Get.offAllNamed(AppRoutes.signInScreen);
//                               },
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             )),
//       ),
//     );
//   }
// }

import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shark_mobile/core/helpers/app_regex.dart';
import 'package:shark_mobile/core/helpers/extensions.dart';
import 'package:shark_mobile/core/helpers/space_vector.dart';
import 'package:shark_mobile/core/themes/colors.dart';
import 'package:shark_mobile/core/themes/styles.dart';
import 'package:shark_mobile/core/widgets/custom_button.dart';
import 'package:shark_mobile/core/widgets/custom_text_field.dart';
import 'package:shark_mobile/features/auth/logic/register_cubit.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpCubit = BlocProvider.of<RegisterCubit>(context);
    return Form(
      key: signUpCubit.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets\images\app_logo.png',
            height: 56.h,
            width: 220.w,
            color: ColorsManager.primary,
          ),
          verticalSpace(24),
          Text('Sign Up'.tr(), style: TextStyles.font18DarkBlueSemiBold),
          verticalSpace(24),
          CustomTextFormField(
            labelText: '',
            width: context.width(),
            controller: signUpCubit.nameController,
            hintText: 'Name',
            prefixIcon: Icon(Icons.person),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Name is required'.tr();
              }
              return null;
            },
          ),
          verticalSpace(16),
          CustomTextFormField(
            labelText: '',
            width: context.width(),
            controller: signUpCubit.emailController,
            hintText: 'Email',

            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Email is required'.tr();
              } else if (!AppRegex.isEmailValid(value)) {
                return 'Enter a valid email'.tr();
              }
              return null;
            },
          ),
          verticalSpace(16),
          CustomTextFormField(
            labelText: '',
            controller: signUpCubit.phoneController,
            hintText: 'Phone Number'.tr(),

            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Phone number is required'.tr();
              } else if (!RegExp(r"^[0-9]{8,15}$").hasMatch(value)) {
                return 'Enter a valid phone number'.tr();
              }
              return null;
            },
          ),
          verticalSpace(16),
          CustomTextFormField(
            labelText: '',
            width: context.width(),
            controller: signUpCubit.passwordController,
            hintText: 'Password'.tr(),

            // suffexIcon: GestureDetector(
            //   onTap: () {
            //     loginCubit.togglePasswordVisibility();
            //   },
            //   child: Padding(
            //     padding: context.isArabic
            //         ? EdgeInsets.only(left: 16.w, top: 12.h, bottom: 12.h)
            //         : EdgeInsets.only(right: 16.w, top: 12.h, bottom: 12.h),
            //     child: Icon(
            //       size: 20.w,
            //       color: AppColors.kGray,
            //       loginCubit.isPasswordHidden
            //           ? Icons.visibility_off_outlined
            //           : Icons.visibility_outlined,
            //     ),
            //   ),
            // ),
            // obscureText: loginCubit.isPasswordHidden,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Password is required'.tr();
              } else if (value.length < 8) {
                return 'Password must be at least 8 characters'.tr();
              }
              return null;
            },
          ),

          verticalSpace(16),
          // BlocBuilder<LoginCubit, LoginState>(
          //   builder: (context, state) {
          //     final loginCubit = context.read<LoginCubit>();
          //     final signUpCubit = context.read<SignUpCubit>();

          //     return CustomTextFormField(
          //       isForLoginScreen: true,
          //       width: context.width(),
          //       controller: signUpCubit.confirmPasswordController,
          //       hintText: 'Confirm Password'.tr(),
          //       prefixImagePath: FlmadmonIcons.lockIcon,
          //       obscureText: loginCubit.isConfirmPassword,
          //       suffexIcon: GestureDetector(
          //         onTap: () {
          //           loginCubit.toggleconfirmPasswordVisibility();
          //         },
          //         child: Padding(
          //           padding: context.isArabic
          //               ? EdgeInsets.only(left: 16.w, top: 12.h, bottom: 12.h)
          //               : EdgeInsets.only(right: 16.w, top: 12.h, bottom: 12.h),
          //           child: Icon(
          //             size: 20.w,
          //             color: AppColors.kGray,
          //             loginCubit.isConfirmPassword
          //                 ? Icons.visibility_off_outlined
          //                 : Icons.visibility_outlined,
          //           ),
          //         ),
          //       ),
          //       validator: (value) {
          //         if (value == null || value.trim().isEmpty) {
          //           return 'Confirm your password'.tr();
          //         } else if (value != signUpCubit.passwordController.text) {
          //           return 'Passwords do not match'.tr();
          //         }
          //         return null;
          //       },
          //     );
          //   },
          // ),
          verticalSpace(16),

          verticalSpace(24),
          CustomButton(
            width: context.width(),
            onTap: () {
              // if (signUpCubit.formKey.currentState!.validate()) {
              //   signUpCubit.signUp(context);
              // } else {}
            },
            backgroundColor: ColorsManager.primary,
            borderRadius: 50,
            text: 'Sign Up'.tr(),
          ),
          verticalSpace(24),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Already Have Account?'.tr(),
                style: TextStyles.font12GrayRegular,
              ),
              horizontalSpace(5),
              // GestureDetector(
              //   onTap: () {
              //     GoRouter.of(context).push(Routes.kLogInScreen);
              //   },
              //   child: Text(
              //     'Log In'.tr(),
              //     style: FlmadmonStyles.textStyleNoorBoldW700S16.copyWith(
              //       fontWeight: FontWeight.w400,
              //       fontSize: 16.sp,
              //       color: AppColors.kPrimaryColor,
              //     ),
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}

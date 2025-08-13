import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shark_mobile/core/helpers/app_regex.dart';
import 'package:shark_mobile/core/helpers/extensions.dart';
import 'package:shark_mobile/core/helpers/space_vector.dart';
import 'package:shark_mobile/core/routing/routes.dart';
import 'package:shark_mobile/core/themes/colors.dart';
import 'package:shark_mobile/core/themes/styles.dart';
import 'package:shark_mobile/core/widgets/custom_button.dart';
import 'package:shark_mobile/core/widgets/custom_text_field.dart';
import 'package:shark_mobile/features/auth/logic/register_cubit.dart';
import 'package:shark_mobile/features/auth/logic/register_state.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final registerCubit = BlocProvider.of<RegisterCubit>(context);
    return Form(
      key: registerCubit.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/app_logo.png',
            height: 150.h,
            width: 220.w,
          ),
          verticalSpace(24),
          Text(
            'Sign Up'.tr(),
            style: TextStyles.font32BlueBold.copyWith(
              color: ColorsManager.darkBlue,
            ),
          ),
          verticalSpace(24),
          CustomTextFormField(
            borderRadius: 24.r,
            width: context.width(),
            controller: registerCubit.nameController,
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
            prefixIcon: Icon(Icons.email_outlined),
            borderRadius: 24.r,
            width: context.width(),
            controller: registerCubit.emailController,
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
            prefixIcon: Icon(Icons.phone_outlined),
            borderRadius: 24.r,
            controller: registerCubit.phoneController,
            hintText: 'Phone number'.tr(),
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
          BlocBuilder<RegisterCubit, RegisterState>(
            builder: (context, state) {
              return CustomTextFormField(
                borderRadius: 24.r,
                prefixIcon: Icon(Icons.lock_outlined),
                width: context.width(),
                controller: registerCubit.passwordController,
                hintText: 'Password'.tr(),

                suffixIcon: GestureDetector(
                  onTap: () {
                    registerCubit.togglePasswordVisibility();
                  },
                  child: Padding(
                    padding: context.isArabic
                        ? EdgeInsets.only(left: 16.w, top: 12.h, bottom: 12.h)
                        : EdgeInsets.only(right: 16.w, top: 12.h, bottom: 12.h),
                    child: Icon(
                      size: 20.w,
                      color: ColorsManager.gray,
                      registerCubit.isPasswordHidden
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                  ),
                ),
                obscureText: registerCubit.isPasswordHidden,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Password is required'.tr();
                  } else if (value.length < 8) {
                    return 'Password must be at least 8 characters'.tr();
                  }
                  return null;
                },
              );
            },
          ),
          verticalSpace(16),
          BlocBuilder<RegisterCubit, RegisterState>(
            builder: (context, state) {
              return CustomTextFormField(
                borderRadius: 24.r,
                prefixIcon: Icon(Icons.lock_outlined),
                width: context.width(),
                controller: registerCubit.confirmPasswordController,
                hintText: 'Confirm password'.tr(),
                suffixIcon: GestureDetector(
                  onTap: () {
                    registerCubit.toggleconfirmPasswordVisibility();
                  },
                  child: Padding(
                    padding: context.isArabic
                        ? EdgeInsets.only(left: 16.w, top: 12.h, bottom: 12.h)
                        : EdgeInsets.only(right: 16.w, top: 12.h, bottom: 12.h),
                    child: Icon(
                      size: 20.w,
                      color: ColorsManager.gray,
                      registerCubit.isConfirmPasswordHidden
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                  ),
                ),
                obscureText: registerCubit.isConfirmPasswordHidden,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Password is required'.tr();
                  } else if (value.length < 8) {
                    return 'Password must be at least 8 characters'.tr();
                  }
                  return null;
                },
              );
            },
          ),
          verticalSpace(24),
          CustomButton(
            width: context.width(),
            onTap: () {
              if (registerCubit.formKey.currentState!.validate()) {
                registerCubit.register(context);
              } else {}
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
                style: TextStyles.font14GrayMedium,
              ),
              horizontalSpace(5),
              GestureDetector(
                onTap: () {
                  context.pushNamed(Routes.loginScreen);
                },
                child: Text(
                  'Log In'.tr(),
                  style: TextStyles.font14BlueSemiBold.copyWith(
                    color: ColorsManager.primary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shark_mobile/core/helpers/extensions.dart';
import 'package:shark_mobile/core/helpers/space_vector.dart';
import 'package:shark_mobile/core/themes/colors.dart';
import 'package:shark_mobile/core/themes/styles.dart';
import 'package:shark_mobile/core/widgets/custom_button.dart';
import 'package:shark_mobile/core/widgets/custom_text_field.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: Text('contact_us'.tr(), style: TextStyles.font24BlackBold),
        backgroundColor: ColorsManager.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('send_us_an_email'.tr(), style: TextStyles.font24BlueBold),
              verticalSpace(16),
              CustomTextFormField(
                controller: TextEditingController(),
                labelText: 'name'.tr(),
                validator: (v) => v == null || v.trim().isEmpty
                    ? 'please_enter_your_name'.tr()
                    : null,
                prefixIcon: Icon(Icons.person, color: ColorsManager.primary),
                keyboardType: TextInputType.text,
                onChange: (_) {},
              ),

              verticalSpace(16),
              CustomTextFormField(
                controller: TextEditingController(),

                labelText: 'email'.tr(),

                validator: (v) {
                  if (v == null || v.trim().isEmpty)
                    return 'please_enter_your_email'.tr();
                  final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                  if (!regex.hasMatch(v)) return 'please_enter_a_valid_email'.tr();
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icon(Icons.email, color: ColorsManager.primary),

                onChange: (_) {},
              ),

              verticalSpace(16),
              CustomTextFormField(
                controller: TextEditingController(),
                labelText: 'phone'.tr(),
                validator: (v) => null,
                keyboardType: TextInputType.phone,
                prefixIcon: Icon(Icons.phone, color: ColorsManager.primary),
                onChange: (_) {},
              ),
              verticalSpace(16),
              CustomTextFormField(
                controller: TextEditingController(),
                labelText: 'subject'.tr(),
                validator: (v) => v == null || v.trim().isEmpty
                    ? 'please_enter_subject'.tr()
                    : null,
                prefixIcon: Icon(Icons.subject, color: ColorsManager.primary),
                onChange: (_) {},
              ),
              verticalSpace(16),
              SizedBox(
                child: CustomTextFormField(
                  controller: TextEditingController(),
                  labelText: 'message'.tr(),
                  validator: (v) => v == null || v.trim().isEmpty
                      ? 'please_enter_your_message'.tr()
                      : null,
                  maxLines: 5,
                  prefixIcon: Icon(Icons.message, color: ColorsManager.primary),
                  keyboardType: TextInputType.multiline,
                  onChange: (_) {},
                ),
              ),

              verticalSpace(48),
              SizedBox(
                width: double.infinity,
                height: 54.h,
                child: CustomButton(
                  onTap: () {},
                  text: 'send',
                  borderRadius: 16.r,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

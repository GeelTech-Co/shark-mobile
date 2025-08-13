import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shark_mobile/core/networking/api_error_model.dart';
import 'package:shark_mobile/core/widgets/custom_taost.dart';
import 'package:shark_mobile/features/auth/logic/register_cubit.dart';
import 'package:shark_mobile/features/auth/logic/register_state.dart';

class RegisterBlocListener extends StatelessWidget {
  const RegisterBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen: (previous, current) =>
          current is RegisterLoading ||
          current is RegisterSuccess ||
          current is RegisterError,
      listener: (context, state) {
        if (state is RegisterLoading) {
          _showLoadingDialog(context);
        }
        state.whenOrNull(
          registerSuccess: (signupResponse) {
            _showSuccessDialog(context, signupResponse);
          },
          registerError: (apiErrorModel) {
            _showErrorDialog(context, apiErrorModel);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  Widget _showLoadingDialog(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }

  void _showSuccessDialog(BuildContext context, registerResponse) {
    showCustomToast(
      'Sign up Successful',
      isSuccess: true,
      backendMessage: registerResponse,
    );
  }

  void _showErrorDialog(BuildContext context, ApiErrorModel apiErrorModel) {
    showCustomToast(
      'Sign up Failed',
      isSuccess: false,
      backendMessage: apiErrorModel.message,
    );
  }
}

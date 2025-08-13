import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:shark_mobile/features/auth/data/models/register/request/register_request_model.dart';
import 'package:shark_mobile/features/auth/data/repos/auth_repo_implementation.dart';
import 'package:shark_mobile/features/auth/logic/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._authRepo) : super(RegisterState.initial());

  final AuthRepoImplementation _authRepo;

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;
  void register(context) async {
    emit(RegisterState.registerLoading());

    final response = await _authRepo.register(
      RegisterRequestModel(
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text,
        passwordConfirmation: confirmPasswordController.text,
        phone: phoneController.text,
      ),
    );

    response.when(
      success: (registerResponse) {
        emit(RegisterState.registerSuccess(registerResponse));
      },
      failure: (apiErrorModel) {
        emit(RegisterState.registerError(apiErrorModel));
      },
    );
  }

  void togglePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    emit(RegisterState.passwordVisibilityChanged(isPasswordHidden));
  }

  void toggleconfirmPasswordVisibility() {
    isConfirmPasswordHidden = !isConfirmPasswordHidden;
    emit(RegisterState.passwordVisibilityChanged(isConfirmPasswordHidden));
  }
}

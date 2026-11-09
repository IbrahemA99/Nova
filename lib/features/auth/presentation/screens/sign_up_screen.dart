import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:navo/core/resources/assets_manager.dart';
import 'package:navo/core/resources/color_manager.dart';
import 'package:navo/core/resources/styles_manager.dart';
import 'package:navo/core/resources/values_manager.dart';
import 'package:navo/core/routes_manager/routes.dart';
import 'package:navo/core/widget/custom_elevated_button.dart';
import 'package:navo/core/widget/main_text_field.dart';
import 'package:navo/core/widget/validators.dart';
import 'package:navo/di.dart';
import 'package:navo/features/auth/data/models/signup_request.dart';
import 'package:navo/features/auth/presentation/bloc/auth_bloc.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: BlocProvider(
        create: (context) => getIt<AuthBloc>(),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {

            if (state.signUpRequestState == RequestState.success) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.mainRoute,
                (route) => false,
              );
            }
             else if (state.signUpRequestState == RequestState.error) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Error"),
                  content: Text(state.signUpFailure?.message ?? ""),
                ),
              );
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      //logo
                      Center(
                        child: Image.asset(
                          ImageAssets.logo,
                          width: 200.w,
                          height: 150.h,
                        ),
                      ),
                      
                       // Full Name 
                      BuildTextField(
                        backgroundColor: ColorManager.white,
                        hint: 'enter your full name',
                        label: 'Full Name',
                        controller: nameController,
                        textInputType: TextInputType.name,
                        validation: AppValidators.validateFullName,
                      ),
                      SizedBox(height: AppSize.s18.h),
                     
                      // Phone Number 
                      BuildTextField(
                        hint: 'enter your mobile no.',
                        backgroundColor: ColorManager.white,
                        label: 'Mobile Number',
                        controller: phoneController,

                        validation: AppValidators.validatePhoneNumber,
                        textInputType: TextInputType.phone,
                      ),
                      SizedBox(height: AppSize.s18.h),
                     
                      // Email 
                      BuildTextField(
                        hint: 'enter your email address',
                        backgroundColor: ColorManager.white,
                        label: 'E-mail address',
                        controller: emailController,

                        validation: AppValidators.validateEmail,
                        textInputType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: AppSize.s18.h),
                     
                      // Password 
                      BuildTextField(
                        hint: 'enter your password',
                        backgroundColor: ColorManager.white,
                        label: 'password',
                        controller: passwordController,

                        validation: AppValidators.validatePassword,
                        isObscured: true,
                        textInputType: TextInputType.text,
                      ),
                      SizedBox(height: AppSize.s50.h),
                     
                      //sign up button
                      Center(
                        child: SizedBox(
                          height: AppSize.s60.h,
                          width: MediaQuery.of(context).size.width * .9,
                          child: CustomElevatedButton(
                            // borderRadius: AppSize.s8,
                            label: 'Sign Up',
                            backgroundColor: ColorManager.white,
                            textStyle: getBoldStyle(
                              color: ColorManager.primary,
                              fontSize: AppSize.s20,
                            ),
                            onTap: () {
                              SignupRequest request = SignupRequest(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                rePassword: passwordController.text,
                                phone: phoneController.text,
                              );

                              BlocProvider.of<AuthBloc>(
                                context,
                              ).add(SignUpEvent(request));
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

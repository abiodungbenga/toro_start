import 'package:cached_query_flutter/cached_query_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:toro_start/entity/create_wallet_entity.dart';
import 'package:toro_start/routes/routes.dart';
import 'package:toro_start/themes/extensions/theme_extension.dart';
import 'package:toro_start/utils/validator.dart';
import 'package:toro_start/widget/app_text.dart';
import 'package:toro_start/widget/custom_app_bar.dart';
import 'package:toro_start/widget/custom_app_button.dart';
import 'package:toro_start/widget/custom_form_widget.dart';
import 'package:toro_start/widget/custom_list_view_scrollable.dart';
import 'package:toro_start/widget/custom_scaffold.dart';
import 'package:toronet/toronet.dart';

import '../../controllers/auth_controller.dart';
import '../../widget/app_text_form_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late TextEditingController _userNameC, _passwordC, _cPasswordC;
  bool _isPasswordObscure = true;
  bool _isConfirmPasswordObscure = true;

  final GlobalKey<FormState> signUpFormStateKey = GlobalKey<FormState>();

  var isSignUpComplete = false.obs;

  void onValidationChanged() {
    isSignUpComplete.value = signUpFormStateKey.currentState!.validate();
  }

  void _obscurePassword() {
    setState(() {
      _isPasswordObscure = !_isPasswordObscure;
    });
  } void _obscureConfirmPassword() {
    setState(() {
      _isConfirmPasswordObscure = !_isConfirmPasswordObscure;
    });
  }

  final AuthController _authController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    _userNameC = TextEditingController();
    _cPasswordC = TextEditingController();
    _passwordC = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _userNameC.dispose();
    _cPasswordC.dispose();
    _passwordC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: context.color.primary,
      body: Column(
        children: [
          CustomAppBar(hasLeading: false, title: "Sign up"),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme
                    .of(context)
                    .colorScheme
                    .surface,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: CustomListViewScrollable(
                padding: EdgeInsets.symmetric(horizontal: 24),
                children: [
                  CustomFormWidget(
                    formKey: signUpFormStateKey,
                    onChanged: () => onValidationChanged(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        AppText(
                          text: "Create Torostart address",
                          style: context.textTheme.titleMedium?.copyWith(
                            color: context.color.primaryTitle,
                            fontSize: 24.sp,
                          ),
                        ),
                        SizedBox(height: 10),
                        AppText(
                          text:
                          "You can create a Torostart address today by entering a secure password below and then, your wallet address is ready",
                          style: context.textTheme.titleSmall,
                        ),
                        SizedBox(height: 10),
                        AppText(
                          text: "Be careful do not loose your password",
                          style: context.textTheme.titleSmall?.copyWith(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        AppTextField(
                          hintText: "User name",
                          controller: _userNameC,
                          validator: (val) => Validator.validateName(val??"", "User name"),
                        ),
                        SizedBox(height: 20),
                        AppTextField(
                          obscureText: _isPasswordObscure,
                          controller: _passwordC,
                          validator: (val) => Validator.validatePassword(val??"",),
                          hintText: "Password",
                          suffix: IconButton(
                            onPressed: () => _obscurePassword(),

                            icon: Icon(
                              _isPasswordObscure
                                  ? CupertinoIcons.eye_fill
                                  : CupertinoIcons.eye_slash_fill,
                              size: 18.sp,
                              color: context.color.primaryText,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        AppTextField(
                          obscureText: _isConfirmPasswordObscure,
                          controller: _cPasswordC,
                          validator: (val) => Validator.validateConfirmPassword(_passwordC.text,val??"",),
                          hintText: "Confirm Password",
                          suffix: IconButton(
                            onPressed: () => _obscureConfirmPassword(),

                            icon: Icon(
                              _isConfirmPasswordObscure
                                  ? CupertinoIcons.eye_fill
                                  : CupertinoIcons.eye_slash_fill,
                              size: 18.sp,
                              color: context.color.primaryText,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            AppText(
                              text: "Have a wallet?",
                              style: context.textTheme.titleSmall,
                            ),
                            SizedBox(width: 5),
                            GestureDetector(
                              onTap:
                                  () => Get.toNamed(RouteHelpers.getSignIn()),
                              child: AppText(
                                text: "Sign In",
                                style: context.textTheme.titleSmall?.copyWith(
                                  color: context.color.primaryTitle,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            MutationBuilder<Wallet, CreateWalletEntity>(
                              builder: (context, state, mutate) {
                                return Obx(() {
                                  return CustomAppButton(
                                    text: "Create",
                                    isDisabled: isSignUpComplete.isFalse,
                                    isLoading: state.isLoading,
                                    onPressed:
                                        () =>
                                        mutate(
                                          CreateWalletEntity(
                                            password: _passwordC.text,
                                            username: _userNameC.text,
                                          ),
                                        ),
                                  );
                                });
                              },
                              mutation: _authController.createWallet(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

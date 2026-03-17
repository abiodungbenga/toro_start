import 'package:cached_query_flutter/cached_query_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:toro_start/entity/create_wallet_entity.dart';
import 'package:toro_start/entity/import_wallet_entity.dart';
import 'package:toro_start/routes/routes.dart';
import 'package:toro_start/themes/extensions/theme_extension.dart';
import 'package:toro_start/utils/validator.dart';
import 'package:toro_start/widget/app_text.dart';
import 'package:toro_start/widget/app_text_form_field.dart';
import 'package:toro_start/widget/custom_app_bar.dart';
import 'package:toro_start/widget/custom_app_button.dart';
import 'package:toro_start/widget/custom_form_widget.dart';
import 'package:toro_start/widget/custom_list_view_scrollable.dart';
import 'package:toro_start/widget/custom_scaffold.dart';
import 'package:toro_start/widget/top_space.dart';
import 'package:toronet/toronet.dart';

import '../../controllers/auth_controller.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  late TextEditingController _privateKeyC, _passwordC;
  bool _isPasswordObscure = true;

  void _obscurePassword() {
    setState(() {
      _isPasswordObscure = !_isPasswordObscure;
    });
  }

  final GlobalKey<FormState> signInFormStateKey = GlobalKey<FormState>();

  var isSignInComplete = false.obs;

  void onValidationChanged() {
    isSignInComplete.value = signInFormStateKey.currentState!.validate();
  }


  final AuthController _authController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    _privateKeyC = TextEditingController();
    _passwordC = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _privateKeyC.dispose();
    _passwordC.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: context.color.primary,
      body: Column(
        children: [
          CustomAppBar(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: CustomListViewScrollable(
                padding: EdgeInsets.symmetric(horizontal: 24),
                children: [
                  CustomFormWidget(
                    formKey: signInFormStateKey,
                    onChanged: () => onValidationChanged(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        AppText(
                          text: "Welcome Back",
                          style: context.textTheme.titleMedium?.copyWith(
                            color: context.color.primaryTitle,
                            fontSize: 24.sp,
                          ),
                        ),
                        SizedBox(height: 10),
                        AppText(
                          text: "Hello there, sign in to continue",
                          style: context.textTheme.titleSmall,
                        ),
                        SizedBox(height: 20),
                        AppTextField(hintText: "Private Key",   controller: _privateKeyC,
                          validator: (val) => Validator.validateName(val??"", "Private key"),),
                        SizedBox(height: 20),
                        AppTextField(
                          obscureText: _isPasswordObscure,
                          hintText: "Password",
                          controller: _passwordC,
                          validator: (val) => Validator.validatePassword(val??"",),

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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            AppText(
                              text: "Don't have a wallet?",
                              style: context.textTheme.titleSmall,
                            ),
                            SizedBox(width: 5),
                            GestureDetector(
                              onTap: () => Get.back(),
                              child: AppText(
                                text: "Sign up",
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
                          children: [MutationBuilder<Wallet, ImportWalletEntity>(
                            builder: (context, state, mutate) {
                              return Obx(() {
                                return CustomAppButton(
                                  text: "Sign In",
                                  isDisabled: isSignInComplete.isFalse,
                                  isLoading: state.isLoading,
                                  onPressed:
                                      () =>
                                      mutate(
                                        ImportWalletEntity(
                                          password: _passwordC.text,
                                          privateKey: _privateKeyC.text,
                                        ),
                                      ),
                                );
                              });
                            },
                            mutation: _authController.importWallet(),
                          ),],
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

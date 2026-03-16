import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:toro_start/routes/routes.dart';
import 'package:toro_start/themes/extensions/theme_extension.dart';
import 'package:toro_start/widget/app_text.dart';
import 'package:toro_start/widget/custom_app_bar.dart';
import 'package:toro_start/widget/custom_app_button.dart';
import 'package:toro_start/widget/custom_list_view_scrollable.dart';
import 'package:toro_start/widget/custom_scaffold.dart';

import '../../widget/app_text_form_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  bool _isPasswordObscure = true;

  void _obscurePassword() {
    setState(() {
      _isPasswordObscure = !_isPasswordObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: context.color.primary,
      body: Column(
        children: [
          CustomAppBar(
            hasLeading: false,
            title: "Sign up",
          ),
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
                  Column(
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
                        text: "You can create a Torostart address today by entering a secure password below and then, your wallet address is ready",
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
                      AppTextField(hintText: "User name"),
                      SizedBox(height: 20),
                      AppTextField(
                        obscureText: _isPasswordObscure,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AppText(
                            text: "Have a wallet?",
                            style: context.textTheme.titleSmall,
                          ),
                          SizedBox(width: 5),
                          GestureDetector(
                            onTap: () => Get.toNamed(RouteHelpers.getSignIn(),),
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
                        children: [CustomAppButton(text: "Create")],
                      ),
                    ],
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

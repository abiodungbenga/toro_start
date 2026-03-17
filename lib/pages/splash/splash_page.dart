import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:toro_start/routes/routes.dart';
import 'package:toro_start/themes/extensions/theme_extension.dart';
import 'package:toro_start/widget/custom_scaffold.dart';
import '../../generated/assets.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

   void _navigateTo(){
    Get.offNamed(RouteHelpers.getSignUp(),);
  }

  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );



    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastEaseInToSlowEaseOut,
      ),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        log("✅ animation finished!");
        Timer(const Duration(seconds: 2), () => _navigateTo(),);
      }
    });

    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.stop(canceled: true);
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: context.color.secondarySurfacesInputs,
      body: RepaintBoundary(
        child: Column(
          children: [
            Spacer(
              flex: 2,
            ),
            Center(
              child: SlideTransition(
                position: _slideAnimation,
                child: Assets.images.icLogoRemovedBg.image(
                  width: 35.w,
                  fit: BoxFit.cover,
                  height: 35.h
                ),
              ),
            ),
            Spacer(
              flex: 3,
            ),
        
          ],
        ),
      ),

    );
  }
}

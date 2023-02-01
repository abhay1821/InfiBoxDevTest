import 'package:flutter/material.dart';
import 'package:infi_devtest/buisness_logic/view_models/splash_screen_view_model.dart';
import 'package:infi_devtest/services/service_locator.dart';
import 'package:infi_devtest/ui/views/base_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation = Tween<double>(begin: 0, end: 700).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    return BaseView<SplashScreenViewModel>(
      onModelReady: (model) => model.init(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: animation.value,
              width: animation.value,
              child: Image.asset('assets/images/infibox.png'),
            ),
          ),
        );
      },
    );
  }
}

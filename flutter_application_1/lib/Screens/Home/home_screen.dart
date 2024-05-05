import 'package:flutter/material.dart';

import '../../components/background.dart';
import '../../responsive.dart';
// import 'components/login_signup_btn.dart';
// import 'components/welcome_image.dart';
import 'component/Home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Responsive(
            desktop: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 450,
                        child: HomeController(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            mobile: MobileHomeScreen(),
          ),
        ),
      ),
    );
  }
}

class MobileHomeScreen extends StatelessWidget {
  const MobileHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        Row(
         children: [
            Spacer(),
            Expanded(
              flex: 8,
              child: HomeController(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}

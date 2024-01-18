import 'package:flutter/material.dart';
import 'package:wanderer/core/utils/size_utils.dart';
import 'package:wanderer/presentation/custom_widgets/custom_appbar/custom_appbar.dart';
import 'package:wanderer/routes/app_routes.dart';

import '../../../../theme/app_decoration.dart';
import '../../../../theme/theme_helper.dart';
import '../custom_widgets/custom_body_button.dart';
import '../custom_widgets/custom_icon_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    Key? key,
  }) : super(key: key);

  static Widget builder(BuildContext context) {
    return SettingsScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: CustomAppBar(
        leadingWidget: Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 50.h),
              child: CustomIconButton(
                icon: Icons.arrow_back,
                onTap: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: AppDecoration.gradientLightToMain,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30.h),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Settings',
                    style: theme.textTheme.headlineMedium
                        ?.copyWith(color: Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16.h, bottom: 4.0),
                    child: CustomBodyButton(
                      text: 'Share with friends',
                      onTap: () => {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CustomBodyButton(
                      text: 'Privacy Policy',
                      onTap: () => {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CustomBodyButton(
                      text: 'Term of use',
                      onTap: () => {},
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

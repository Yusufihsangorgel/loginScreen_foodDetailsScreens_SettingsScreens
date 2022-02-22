import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:get/get.dart';

import '../controllers/logincontroller.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    var value;
    return SettingsList(
      sections: [
        SettingsSection(
          title: '${loginController.myUser.value}',
          tiles: [
            SettingsTile(
              title: 'Dil',
              subtitle: 'İngilizce',
              leading: Icon(Icons.language),
              onPressed: (BuildContext context) {},
            ),
            SettingsTile.switchTile(
              title: 'Use fingerprint',
              leading: Icon(Icons.fingerprint),
              switchValue: value,
              onToggle: (bool value) {},
            ),
          ],
        ),
      ],
    );
  }
}

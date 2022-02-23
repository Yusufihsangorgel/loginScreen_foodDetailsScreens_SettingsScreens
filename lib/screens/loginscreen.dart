import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:login_test/models/user.dart';
import 'package:login_test/screens/denemescreen.dart';

import 'package:rflutter_alert/rflutter_alert.dart';
import '../controllers/logincontroller.dart';

class LoginScreen extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var ePosta = '';
    var sifre = '';

    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Yusufun Logini',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Giriş Yapınız',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: Form(
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (val) => val!.isEmpty || !val.contains("@")
                      ? "Lütfen doğru e mail giriniz"
                      : null,
                  onChanged: (value) {
                    ePosta = value;
                  },
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'E Posta',
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (val) =>
                    val!.isEmpty ? "Lütfen şifre giriniz" : null,
                onChanged: (value) {
                  sifre = value;
                },
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Şifre',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: const Text(
                'Şifremi Unuttum',
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Giriş Yap'),
                  onPressed: () async {
                    if (sifre == '') {
                      Alert(
                        context: context,
                        title: "Hatalı Giriş",
                        desc: "Lütfen e posta ve şifrenizi doğru giriniz",
                        buttons: [
                          DialogButton(
                            child: Text(
                              "Geri Dön",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                              Get.back();
                            },
                            width: 120,
                          )
                        ],
                      ).show();
                    } else {
                      Get.to(Deneme());
                      ePosta = await loginController.UserFunc(ePosta);
                      sifre = await loginController.PasswordFunc(sifre);
                    }
                  },
                )),
            Row(
              children: <Widget>[
                const Text('Hesabın Yok Mu?'),
                TextButton(
                  child: const Text(
                    'Kayıt Ol!',
                    style: TextStyle(fontSize: 13),
                  ),
                  onPressed: () {},
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ));
  }
}

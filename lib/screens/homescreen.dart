import 'dart:math';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_test/controllers/logincontroller.dart';
import '../widgets/foodwidget.dart';
//import 'package:welcomescreenflutter/sunil/welcomescreenflutter.dart';
import 'package:animated_icon/animate_icon.dart';
import 'package:animated_icon/animate_icons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();

    final LoginController loginController = Get.put(LoginController());
    List<PageData> pageData = [
      PageData(
          'Baklava',
          'Baklava Türk, Orta Doğu, Balkan ve Güney Asya mutfaklarında yer etmiş önemli bir hamur tatlısıdır. İnce yufkaların arasına yöreye göre ceviz, antep fıstığı, badem veya fındık konarak yapılır. Genel olarak şeker şerbeti ile tatlandırılır. Ayrıca bal şerbeti de kullanılabilir.',
          'images/baklava.jpeg'),
      PageData(
          'Döner',
          'Döner ya da döner kebap, içyağı ve yöresel baharatlarla iyice terbiyelenmiş ve dövülmüş et parçalarının, bir şişin üzerine geçirilerek, dik bir şekilde asıldıkları odun ateşi karşısında pişirildiği, Türk mutfağında özgü bir yemek.',
          'images/doner.jpg'),
      PageData(
          'İskender',
          'İskender kebap veya iskender döner, Bursa yöresinin meşhur kebap yemeklerinden biridir.  ',
          'images/iskender.jpeg'),
      PageData(
          'Lahmacun',
          'Lahmacun, açılmış hamurun üzerine kıyma, maydanoz, soğan, sarımsak ve karabiber, isot gibi baharatlarla hazırlanan malzeme sürüldükten sonra taş fırında pişirilmesiyle yapılan Orta Doğu mutfağında bir çeşit içli pidedir.',
          'images/lahmacun.jpeg'),
      PageData(
          'Şiş Kebap',
          'Şiş kebabı, Türk yemek kültürünün içinde önemli bir yeri olan et yemeği. Basılı ilk yemek kitabı Melceüt-Tabbâhîn de tarifi vardır. Özellikle müslümanların dini bayramı olan Kurban Bayramında hemen tüm evlerde şölen havasıyla hazırlanan Şiş Kebabı, koyunun but etinden çıkan parçalarından yapılır.',
          'images/siskebap.jpeg')
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("${loginController.myUser.value}"),
      ),
      body: Expanded(
        child: Column(
          children: [
            AnimSearchBar(
              width: 400,
              textController: textController,
              onSuffixTap: () {
                textController.clear();
              },
            ),
            IntroPage(
              //numberOfPage: 3,
              pageData: pageData,
              indicatorSize: 14,
              activeIndicatorColor: Colors.redAccent,
              onPageChange: (value) {
                print(value);
              },
            ),
            AnimateIcon(
              key: UniqueKey(),
              onTap: () {},
              iconType: IconType.continueAnimation,
              height: 70,
              width: 70,
              color: Color.fromRGBO(
                  Random.secure().nextInt(255),
                  Random.secure().nextInt(255),
                  Random.secure().nextInt(255),
                  1),
              animateIcon: AnimateIcons.checkmarkOk,
            ),
            AnimateIcon(
              key: UniqueKey(),
              onTap: () {},
              iconType: IconType.continueAnimation,
              height: 70,
              width: 70,
              color: Color.fromRGBO(
                  Random.secure().nextInt(255),
                  Random.secure().nextInt(255),
                  Random.secure().nextInt(255),
                  1),
              animateIcon: AnimateIcons.cross,
            ),
          ],
        ),
      ),
    );
  }
}

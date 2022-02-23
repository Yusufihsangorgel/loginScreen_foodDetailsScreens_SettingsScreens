import 'package:flutter/material.dart';

import '../widgets/foodwidget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  List<PageData> pageData = [
    PageData(
        'Baklava',
        'Baklava Türk, Orta Doğu, Balkan ve Güney Asya mutfaklarında yer etmiş önemli bir hamur tatlısıdır. İnce yufkaların arasına yöreye göre ceviz, antep fıstığı, badem veya fındık konarak yapılır. Genel olarak şeker şerbeti ile tatlandırılır. Ayrıca bal şerbeti de kullanılabilir.',
        'images/baklava.png'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroPage(
        numberOfPage: 5,
        pageData: pageData,
        indicatorSize: 14,
        activeIndicatorColor: Colors.redAccent,
        onPageChange: (value) {
          print(value);
        },
      ),
    );
  }
}

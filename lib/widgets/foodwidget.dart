import 'package:animated_icon/animate_icon.dart';
import 'package:animated_icon/animate_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_test/settings/settingscreen.dart';

import '../controllers/logincontroller.dart';

class PageData {
  String title;
  String description;
  String imagePath;

  PageData(this.title, this.description, this.imagePath);
}

typedef ValueChanged<T> = void Function(T value);

class IntroPage extends StatelessWidget {
  int? numberOfPage;
  List<Page> pages = [];
  List<PageData>? pageData;
  double? indicatorSize;
  var selectedIndicator = 0.obs;
  Color? activeIndicatorColor;
  Color? deActiveIndicatorColor;
  ValueChanged<int>? onPageChange;

  IntroPage(
      {this.numberOfPage,
      this.pageData,
      this.indicatorSize,
      this.activeIndicatorColor,
      this.deActiveIndicatorColor,
      this.onPageChange});
  final PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    if (numberOfPage == null) {
      pages = [
        Page(),
        Page(),
        Page(),
      ];
    } else {
      pages.clear();
      for (int i = 0; i < numberOfPage!; i++) {
        pages.add(Page(
          pageData: pageData != null ? pageData![i] : null,
        ));
      }
    }

    return Stack(
      children: [
        PageView(
          controller: controller,
          children: pages,
          onPageChanged: (value) {
            selectedIndicator.value = value;
            onPageChange!.call(value);
          },
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(bottom: 16),
            height: indicatorSize == null ? 25 : indicatorSize! + 8,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: numberOfPage,
                itemBuilder: (context, index) {
                  return Obx(() => Container(
                        margin: EdgeInsets.all(4),
                        height: indicatorSize ?? 18,
                        width: indicatorSize ?? 18,
                        decoration: BoxDecoration(
                            color: selectedIndicator.value == index
                                ? activeIndicatorColor ?? Colors.green
                                : deActiveIndicatorColor ?? Colors.grey,
                            borderRadius: BorderRadius.circular(
                                indicatorSize == null
                                    ? 9
                                    : indicatorSize! / 2)),
                      ));
                }),
          ),
        ),
      ],
    );
  }
}

class Page extends StatelessWidget {
  PageData? pageData;
  final LoginController loginController = Get.put(LoginController());
  Page({this.pageData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("${loginController.myUser.value}"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              Get.to(SettingsScreen());
            },
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              pageData == null
                  ? 'images/baklava.png'
                  : pageData!.imagePath.isEmpty
                      ? 'images/baklava.png'
                      : pageData!.imagePath,
              height: 200,
            ),
            Column(
              children: [
                Text(
                  pageData == null
                      ? 'Welcome to Intro Page'
                      : pageData!.title.isEmpty
                          ? 'Welcome to Intro Page'
                          : pageData!.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 30),
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  pageData == null
                      ? 'Make a beautiful clean and fully functional onboarding screen layout in Android StudioIn this part we are going to setup the viewpager intro slider.Illustra...'
                      : pageData!.description.isEmpty
                          ? 'Make a beautiful clean and fully functional onboarding screen layout in Android StudioIn this part we are going to setup the viewpager intro slider.Illustra...'
                          : pageData!.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 100, top: 20),
                      child: AnimateIcon(
                        key: UniqueKey(),
                        onTap: () {},
                        iconType: IconType.animatedOnTap,
                        height: 40,
                        width: 70,
                        color: Colors.green,
                        animateIcon: AnimateIcons.checkmarkOk,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, top: 20),
                      child: AnimateIcon(
                        key: UniqueKey(),
                        onTap: () {},
                        iconType: IconType.animatedOnTap,
                        height: 40,
                        width: 70,
                        color: Colors.red,
                        animateIcon: AnimateIcons.cross,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

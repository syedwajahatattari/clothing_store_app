import 'package:clothing_store_app/app_styles.dart';
import 'package:clothing_store_app/product_detail.dart';
import 'package:clothing_store_app/size_config.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark),
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Scaffold(
      //   floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      //   floatingActionButton: Container(
      //     padding: const EdgeInsets.symmetric(horizontal: 8),
      //     height: 64,
      //     child: CustomNavigationBar(
      //       currentIndex: _currentIndex,
      //       onTap: (index) {
      //         setState(() {
      //           _currentIndex = index;
      //         });
      //       },
      //       items: [
      //         CustomNavigationBarItem(
      //           icon: _currentIndex == 0
      //               ? Image.asset("assets/home-2.png")
      //               : Image.asset("assets/home-2.png"),
      //         ),
      //         CustomNavigationBarItem(
      //           icon: _currentIndex == 1
      //               ? Image.asset("assets/heart-1.png")
      //               : Image.asset("assets/heart-1.png"),
      //         ),
      //         CustomNavigationBarItem(
      //           icon: _currentIndex == 2
      //               ? Image.asset("assets/Group 3244.png")
      //               : Image.asset("assets/Group 3244.png"),
      //         ),
      //         CustomNavigationBarItem(
      //           icon: _currentIndex == 3
      //               ? Image.asset("assets/account.png")
      //               : Image.asset("assets/account.png"),
      //         ),
      //       ],
      //       isFloating: true,
      //       borderRadius: const Radius.circular(40),
      //       selectedColor: kWhite,
      //       unSelectedColor: kGrey,
      //       backgroundColor: kBrown,
      //       strokeColor: Colors.transparent,
      //       scaleFactor: 0.1,
      //       iconSize: 40,
      //     ),
      //   ),
      //   body: const HomeScreen(),,
    // ),
    home: ProductDetailPage(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> categories = ["All Items", "Dress", "Hat", "Watch"];
  List images = [
    "Mask group.png",
    "image 48.png",
    "image 48.png",
    "image 48-1.png"
  ];
  List gridImages = [
    "image 43.png",
    "image 43-1.png",
    "image 43-2.png",
    "image 43-3.png",
    "profile.png"
  ];
  int current = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kPaddingHorizontal, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Hello, Welcome 👋",
                      style: kEncodeSansRegular.copyWith(
                          color: kDarkBrown,
                          fontSize: SizeConfig.blockSizeHorizontal! * 3.5),
                    ),
                    Text(
                      "Albert Stevano",
                      style: kEncodeSansBold.copyWith(
                          color: kDarkBrown,
                          fontSize: SizeConfig.blockSizeHorizontal! * 4),
                    ),
                  ],
                ),
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: kGrey,
                  backgroundImage: AssetImage("assets/images/profile.png"),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    style: kEncodeSansRegular.copyWith(
                      color: kDarkGrey,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                    ),
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 13),
                      prefixIcon: const IconTheme(
                        data: IconThemeData(
                          color: kDarkGrey,
                        ),
                        child: Icon(Icons.search),
                      ),
                      hintText: 'search Clothes...',
                      border: kInputBorder,
                      errorBorder: kInputBorder,
                      disabledBorder: kInputBorder,
                      focusedBorder: kInputBorder,
                      focusedErrorBorder: kInputBorder,
                      enabledBorder: kInputBorder,
                      hintStyle: kEncodeSansRegular.copyWith(
                        color: kDarkGrey,
                        fontSize: SizeConfig.blockSizeHorizontal! * 4,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Container(
                  height: 49,
                  width: 49,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                    color: kBlack,
                  ),
                  child: Image.asset("assets/Filter.png"),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            width: double.infinity,
            height: 36,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        current = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        left: index == 0 ? kPaddingHorizontal : 15,
                        right: index == categories.length - 1
                            ? kPaddingHorizontal
                            : 0,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 36,
                      decoration: BoxDecoration(
                        color: current == index ? kBrown : kWhite,
                        borderRadius: BorderRadius.circular(8),
                        border: current == index
                            ? null
                            : Border.all(
                                color: kLightGrey,
                                width: 1,
                              ),
                      ),
                      child: Row(
                        children: [
                          Image.asset(current == index
                              ? "assets/${images[index]}"
                              : "assets/${images[index]}"),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            categories[index],
                            style: kEncodeSansMedium.copyWith(
                              color: current == index ? kWhite : kDarkBrown,
                              fontSize: SizeConfig.blockSizeHorizontal! * 3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          const SizedBox(
            height: 32,
          ),
          MasonryGridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 23,
            itemCount: gridImages.length,
            padding: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Positioned(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(kBorderRadius),
                          child: Image.asset(
                            "assets/images/${gridImages[index]}",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 12,
                        right: 12,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              Image.asset("assets/heart.png");
                            });
                          },
                          child: Container(
                            child: Image.asset("assets/heart (2).png"),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: kBlack,
                            ),
                            height: 30,
                            width: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Modern Light Clothes",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: kEncodeSansBold.copyWith(
                      color: kDarkBrown,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                    ),
                  ),
                  Text(
                    "Dress Modern",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: kEncodeSansRegular.copyWith(
                      color: kGrey,
                      fontSize: SizeConfig.blockSizeHorizontal! * 2.5,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "\$212.99",
                        style: kEncodeSansBold.copyWith(
                          color: kDarkBrown,
                          fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: kYellow,
                            size: 16,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "5.0",
                            style: kEncodeSansRegular.copyWith(
                              color: kDarkBrown,
                              fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

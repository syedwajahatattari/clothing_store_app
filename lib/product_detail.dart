import 'package:clothing_store_app/app_styles.dart';
import 'package:clothing_store_app/counter.dart';
import 'package:clothing_store_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readmore/readmore.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final Counter _counter = Counter();

  void _incrementCounter() {
    setState(() {
      _counter.increment();
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter.decrement();
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: () {
          debugPrint("Add to cart button pressed");
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          height: 60,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
          decoration: BoxDecoration(
            color: kDarkBrown,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/shopping-cart.png"),
              SizedBox(
                width: SizeConfig.blockSizeHorizontal! * 2,
              ),
              RichText(
                text: TextSpan(
                  text: "Add to Cart | \$100.99 ",
                  style: kEncodeSansRegular.copyWith(
                    color: kWhite,
                    fontSize: SizeConfig.blockSizeHorizontal! * 4,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: "\$190.99",
                      style: kEncodeSansRegular.copyWith(
                        color: kWhite,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3,
                        decoration: TextDecoration.lineThrough,
                        decorationThickness:
                            SizeConfig.blockSizeHorizontal! * 1,
                        decorationColor: kWhite,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 50,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.asset(
                        "assets/images/product_detail.png",
                        height: SizeConfig.blockSizeVertical! * 50,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: SizeConfig.blockSizeVertical! * 4,
                              width: SizeConfig.blockSizeVertical! * 4,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: kWhite,
                                  boxShadow: [
                                    BoxShadow(
                                        color: kBrown.withOpacity(0.11),
                                        spreadRadius: 0.0,
                                        blurRadius: 12,
                                        offset: const Offset(0, 5)),
                                  ]),
                              child: Image.asset("assets/Frame 32.png"),
                            ),
                            Container(
                              height: SizeConfig.blockSizeVertical! * 4,
                              width: SizeConfig.blockSizeVertical! * 4,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: kWhite,
                                  boxShadow: [
                                    BoxShadow(
                                        color: kBrown.withOpacity(0.11),
                                        spreadRadius: 0.0,
                                        blurRadius: 12,
                                        offset: const Offset(0, 5)),
                                  ]),
                              child: Image.asset("assets/heart_black.png"),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Modern Light Clothes",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: kEncodeSansSemiBold.copyWith(
                        color: kDarkBrown,
                        fontSize: SizeConfig.blockSizeHorizontal! * 7,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: _decrementCounter,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: kBorderColor,
                              width: 1,
                            ),
                            shape: BoxShape.circle,
                            color: kWhite,
                          ),
                          child: const Icon(
                            Icons.remove,
                            color: kGrey,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal! * 3,
                      ),
                      Text(_counter.value.toString(),
                          style: kEncodeSansBold.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal! * 5,
                              color: kDarkBrown)),
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal! * 3,
                      ),
                      GestureDetector(
                        onTap: _incrementCounter,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: kBorderColor,
                              width: 1,
                            ),
                            shape: BoxShape.circle,
                            color: kWhite,
                          ),
                          child: const Icon(
                            Icons.add,
                            color: kDarkGrey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  RatingBar.builder(
                    itemSize: 20,
                    initialRating: 3.5,
                    minRating: 1,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.all(2),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: kYellow,
                    ),
                    onRatingUpdate: (rating) {
                      debugPrint(rating.toString());
                    },
                    unratedColor: kLightGrey,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "5.0 ",
                      style: kEncodeSansRegular.copyWith(
                        color: kDarkGrey,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "(7932 reviews)",
                          style: kEncodeSansRegular.copyWith(
                            color: kBlue,
                            fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              ReadMoreText(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
                trimLines: 2,
                trimMode: TrimMode.Line,
                delimiter: ' ',
                trimCollapsedText: "Read More...",
                trimExpandedText: "Show Less",
                style: kEncodeSansRegular.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 3,
                  color: kDarkGrey,
                ),
                moreStyle: kEncodeSansBold.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 4,
                  color: kDarkBrown,
                ),
                lessStyle: kEncodeSansBold.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 4,
                  color: kDarkBrown,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Divider(
                height: 1,
                color: kLightGrey,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Choose Size",
                        style: kEncodeSansBold.copyWith(
                          color: kDarkBrown,
                          fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: SizeConfig.blockSizeHorizontal! * 4.5,
                            width: SizeConfig.blockSizeHorizontal! * 4.5,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: kLightGrey,
                                width: 1,
                              ),
                              shape: BoxShape.circle,
                              color: kWhite,
                            ),
                            child: Center(
                              child: Text(
                                "S",
                                style: kEncodeSansRegular.copyWith(
                                  color: kDarkBrown,
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 2.7,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal! * 1,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: SizeConfig.blockSizeHorizontal! * 4.5,
                            width: SizeConfig.blockSizeHorizontal! * 4.5,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: kLightGrey,
                                width: 1,
                              ),
                              shape: BoxShape.circle,
                              color: kWhite,
                            ),
                            child: Center(
                              child: Text(
                                "M",
                                style: kEncodeSansRegular.copyWith(
                                  color: kDarkBrown,
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 2.7,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal! * 1,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: SizeConfig.blockSizeHorizontal! * 4.5,
                            width: SizeConfig.blockSizeHorizontal! * 4.5,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: kLightGrey,
                                width: 1,
                              ),
                              shape: BoxShape.circle,
                              color: kBlack,
                            ),
                            child: Center(
                              child: Text(
                                "L",
                                style: kEncodeSansBold.copyWith(
                                  color: kWhite,
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 2.7,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal! * 1,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: SizeConfig.blockSizeHorizontal! * 4.5,
                            width: SizeConfig.blockSizeHorizontal! * 4.5,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: kLightGrey,
                                width: 1,
                              ),
                              shape: BoxShape.circle,
                              color: kWhite,
                            ),
                            child: Center(
                              child: Text(
                                "XL",
                                style: kEncodeSansRegular.copyWith(
                                  color: kDarkBrown,
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 2.7,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Color",
                        style: kEncodeSansBold.copyWith(
                          color: kDarkBrown,
                          fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: SizeConfig.blockSizeHorizontal! * 4.5,
                            width: SizeConfig.blockSizeHorizontal! * 4.5,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: kLightGrey,
                                width: 1,
                              ),
                              shape: BoxShape.circle,
                              color: kLightGrey,
                            ),
                          ),
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal! * 1,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: SizeConfig.blockSizeHorizontal! * 4.5,
                            width: SizeConfig.blockSizeHorizontal! * 4.5,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: kLightGrey,
                                width: 1,
                              ),
                              shape: BoxShape.circle,
                              color: kBrown,
                            ),
                          ),
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal! * 1,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: SizeConfig.blockSizeHorizontal! * 4.5,
                            width: SizeConfig.blockSizeHorizontal! * 4.5,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: kLightGrey,
                                width: 1,
                              ),
                              shape: BoxShape.circle,
                              color: kDarkBrown,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

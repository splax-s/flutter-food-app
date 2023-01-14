import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_repo.dart';
import '../../routes/route_helper.dart';
import '../../controllers/cart_controller.dart';
import '../../utils/app_constants.dart';
import '../../utils/dimentions.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';
import '../../widgets/app_icon.dart';
import '../../controllers/recommended_product_controller.dart';
import '../../pages/Screens/main_food_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: Dimensions.height20 * 3,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(
                    icon: Icons.arrow_back_ios,
                    iconColor: Colors.white,
                    backgroundColor: Colors.amber,
                    iconSize: Dimensions.iconSize24,
                  ),
                  SizedBox(
                    width: Dimensions.width20 * 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(
                      icon: Icons.home_outlined,
                      iconColor: Color(0xff0f0d0d),
                      backgroundColor: Colors.amber,
                      iconSize: Dimensions.iconSize24,
                    ),
                  ),
                  AppIcon(
                    icon: Icons.shopping_cart,
                    iconColor: Colors.white,
                    backgroundColor: Colors.amber,
                    iconSize: Dimensions.iconSize24,
                  ),
                ],
              )),
          Positioned(
              top: Dimensions.height20 * 5,
              left: Dimensions.width20,
              right: Dimensions.width20,
              bottom: 0,
              child: Container(
                  margin: EdgeInsets.only(top: Dimensions.height15),
                  //color:Colors.red,
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child:
                        GetBuilder<CartController>(builder: (CartController) {
                      var _cartList = CartController.getItems;
                      return ListView.builder(
                          itemCount: _cartList.length,
                          itemBuilder: (_, index) {
                            return Container(
                                width: double.maxFinite,
                                height: 100,
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        var popularIndex =
                                            Get.find<PopularProductController>()
                                                .popularProductList
                                                .indexOf(
                                                    _cartList[index].product!);
                                        if (popularIndex >= 0) {
                                          Get.toNamed(
                                              RouteHelper.getPopularFood(
                                                  popularIndex, "cartpage"));
                                        } else {
                                          var recommendedIndex = Get.find<
                                                  RecommendedProductController>()
                                              .recommendedProductList
                                              .indexOf(
                                                  _cartList[index].product!);
                                          Get.toNamed(
                                              RouteHelper.getRecommendedFood(
                                                  recommendedIndex,
                                                  "cartpage"));
                                        }
                                      },
                                      child: Container(
                                        width: Dimensions.height20 * 5,
                                        height: Dimensions.height20 * 5,
                                        margin: EdgeInsets.only(
                                            bottom: Dimensions.height10),
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(AppConstants
                                                        .BASE_URL +
                                                    AppConstants.UPLOAD_URL +
                                                    CartController
                                                        .getItems[index].img!)),
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.radius20),
                                            color: Colors.white),
                                      ),
                                    ),
                                    SizedBox(
                                      width: Dimensions.width10,
                                    ),
                                    Expanded(
                                        child: Container(
                                            height: Dimensions.height20 * 5,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Bigtext(
                                                  text: CartController
                                                      .getItems[index].name!,
                                                  color: Colors.black54,
                                                ),
                                                SmallText(text: "Spicy"),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Bigtext(
                                                      text: CartController
                                                          .getItems[index].price
                                                          .toString(),
                                                      color: Colors.redAccent,
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          top: Dimensions
                                                              .height10,
                                                          bottom: Dimensions
                                                              .height10,
                                                          left: Dimensions
                                                              .width10,
                                                          right: Dimensions
                                                              .width10),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  Dimensions
                                                                      .radius20),
                                                          color: Colors.white),
                                                      child: Row(
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {
                                                              CartController.addItem(
                                                                  _cartList[
                                                                          index]
                                                                      .product!,
                                                                  -1);
                                                            },
                                                            child: Icon(
                                                              Icons.remove,
                                                              color: Color(
                                                                  0xFFCDDC39),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: Dimensions
                                                                    .width10 /
                                                                2,
                                                          ),
                                                          Bigtext(
                                                              text: _cartList[
                                                                      index]
                                                                  .quantity
                                                                  .toString()), //popularProduct.inCartItems.toString()),
                                                          SizedBox(
                                                            width: Dimensions
                                                                    .width10 /
                                                                2,
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              CartController.addItem(
                                                                  _cartList[
                                                                          index]
                                                                      .product!,
                                                                  1);
                                                              print(
                                                                  "being tapped");
                                                            },
                                                            child: Icon(
                                                              Icons.add,
                                                              color: Color(
                                                                  0xFFCDDC39),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            )))
                                  ],
                                ));
                          });
                    }),
                  )))
        ],
      ),
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (cartController) {
          return Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(
                top: Dimensions.height30,
                bottom: Dimensions.height30,
                left: Dimensions.width20,
                right: Dimensions.width20),
            decoration: BoxDecoration(
                color: Color(0xFF424242),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20 * 2),
                    topRight: Radius.circular(Dimensions.radius20 * 2))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      left: Dimensions.width20,
                      right: Dimensions.width20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white),
                  child: Row(
                    children: [
                      SizedBox(
                        width: Dimensions.width10 / 2,
                      ),
                      Bigtext(
                          text: "\$ " + cartController.totalAmount.toString()),
                      SizedBox(
                        width: Dimensions.width10 / 2,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      //  popularProduct.addItem(product);
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          top: Dimensions.height20,
                          bottom: Dimensions.height30,
                          left: Dimensions.width20,
                          right: Dimensions.width20),
                      child: Bigtext(
                        text: "Check Out",
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: Colors.white54),
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/provider/cart_provider.dart';
import '../core/components/buttons/circle_button_widget.dart';
import '../core/components/text_form_field/text_form_widget.dart';
import '../core/utils/color_scheme.dart';
import '../core/utils/context_extensions.dart';
import '../core/utils/text_theme.dart';

import '../core/components/dash_divider/dash_divider.dart';
import '../core/constants/icon_constants.dart';

class CartPageView extends StatefulWidget {
  const CartPageView({super.key});

  @override
  State<CartPageView> createState() => _CartPageViewState();
}

class _CartPageViewState extends State<CartPageView> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();
    return Scaffold(
      backgroundColor: ColorSchemeLight.instance!.lightGrey,
      appBar: appBarWidget(context),
      body: Column(
        children: [
          cartList(cartProvider),
          checkOut(context, cartProvider),
        ],
      ),
    );
  }

  Container checkOut(BuildContext context, CartProvider cartProvider) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.paddingNormal.horizontal,
        vertical: context.paddingNormal.vertical,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          textFormWidget(
            context: context,
            hintText: "Enter Discount Code",
            suffixIcon: TextButton(
              onPressed: () {},
              child: Text(
                "Apply",
                style: TextThemeLight.instance!.button.copyWith(
                  color: ColorSchemeLight.instance!.orange,
                ),
              ),
            ),
            height: context.mediumValue * 1.5,
          ),
          context.mediumSizedBoxVertical,
          totalTextWidget(cartProvider),
          context.normalSizedBoxVertical,
          DashDividerWidget(
            color: ColorSchemeLight.instance!.darkGrey,
          ),
          context.normalSizedBoxVertical,
          totalTextWidget(cartProvider),
          context.mediumSizedBoxVertical,
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(
                double.infinity,
                context.mediumValue * 2,
              ),
              shape: const StadiumBorder(),
              backgroundColor: ColorSchemeLight.instance!.orange,
            ),
            onPressed: () {},
            child: Text("Checkout", style: TextThemeLight.instance!.button),
          ),
        ],
      ),
    );
  }

  Expanded cartList(CartProvider cartProvider) {
    return Expanded(
      flex: 3,
      child: cartProvider
              .items.isNotEmpty //  cartProvider.items.keys.length.isNotEmpty
          ? ListView.separated(
              itemCount: cartProvider.items.length,
              itemBuilder: (context, index) {
                return cartWidget(context, cartProvider, index);
              },
              separatorBuilder: (context, index) {
                return context.lowSizedBoxVertical;
              },
            )
          : const Center(
              child: Text("No item added!"),
            ),
    );
  }

  Container cartWidget(
      BuildContext context, CartProvider cartProvider, int index) {
    return Container(
      margin: context.paddingNormalHorizontal,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      padding: context.paddingNormal,
      child: IntrinsicHeight(
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                cartProvider.items.keys.toList()[index].image,
                fit: BoxFit.contain,
                height: context.mediumValue * 2.2,
                width: context.mediumValue * 2.2,
              ),
            ),
            context.normalSizedBoxHorizontal,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    cartProvider.items.keys.toList()[index].name,
                    style: TextThemeLight.instance!.titleMedium,
                  ),
                  // context.lowSizedBoxVertical,
                  Text(
                    "Electronics",
                    style: TextThemeLight.instance!.bodySmall,
                  ),
                  //context.lowSizedBoxVertical,
                  Text(
                    "${(cartProvider.items.keys.toList()[index].price * cartProvider.items[cartProvider.items.keys.toList()[index]]!).toString()}\$",
                    style: TextThemeLight.instance!.titleMedium,
                  ),
                ],
              ),
            ),
            context.lowSizedBoxHorizontal,
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  alignment: Alignment.topRight,
                  icon: const Icon(
                    IconConstants.trash,
                  ),
                  color: ColorSchemeLight.instance!.orange,
                  onPressed: () {
                    cartProvider.addProduct(
                      cartProvider.items.keys.toList()[index],
                      0,
                    );
                  },
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.paddingLow.horizontal / 2,
                    vertical: context.paddingLow.vertical / 4,
                  ),
                  decoration: BoxDecoration(
                    color: ColorSchemeLight.instance!.lightGrey,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      width: 1,
                      color: ColorSchemeLight.instance!.mediumGrey,
                    ),
                  ),
                  child: SizedBox(
                    height: context.normalValue * 1.5,
                    width: context.mediumValue * 2.6,
                    child: Row(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                              child: const Icon(
                                Icons.remove,
                                size: 16,
                              ),
                              onTap: () {
                                cartProvider.addProduct(
                                    cartProvider.items.keys.toList()[index],
                                    -1);
                              },
                            ),
                          ),
                        ),
                        context.normalSizedBoxHorizontal,
                        Text(
                          cartProvider
                              .items[cartProvider.items.keys.toList()[index]]
                              .toString(),
                          style: TextThemeLight.instance!.bodySmall.copyWith(
                            color: ColorSchemeLight.instance!.black,
                            fontSize: 14,
                          ),
                        ),
                        context.normalSizedBoxHorizontal,
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              child: const Icon(
                                Icons.add_rounded,
                                size: 16,
                              ),
                              onTap: () {
                                cartProvider.addProduct(
                                    cartProvider.items.keys.toList()[index], 1);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  AppBar appBarWidget(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: ColorSchemeLight.instance!.lightGrey,
      leadingWidth: context.mediumValue * 2,
      leading: Padding(
        padding: EdgeInsets.only(left: context.paddingNormalHorizontal.left),
        child: circleButtonWidget(
          context: context,
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: ColorSchemeLight.instance!.black,
          ),
          backgroundColor: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      title: Text(
        "My Cart",
        style: TextThemeLight.instance!.titleLarge,
      ),
    );
  }

  Widget totalTextWidget(CartProvider cartProvider) {
    String calculateTotalPrice(CartProvider cartProvider) {
      double totalPrice = 0.0;

      cartProvider.items.forEach((product, quantity) {
        totalPrice += product.price * quantity;
      });

      return totalPrice.toString();
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Subtotal",
          style: TextThemeLight.instance!.titleLarge.copyWith(
              fontWeight: FontWeight.w500,
              color: ColorSchemeLight.instance!.darkGrey,
              fontSize: 14),
        ),
        Text(
          calculateTotalPrice(cartProvider),
          style: TextThemeLight.instance!.titleLarge.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

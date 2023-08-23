import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/components/buttons/square_button_widget.dart';
import '../core/components/buttons/outlined_button_widget.dart';
import '../core/components/text_form_field/text_form_widget.dart';
import '../core/model/product_model.dart';
import '../core/provider/cart_provider.dart';
import '../core/utils/color_scheme.dart';
import '../core/utils/context_extensions.dart';
import '../core/utils/text_theme.dart';

import '../core/components/buttons/circle_button_widget.dart';

import '../core/constants/icon_constants.dart';
import '../core/navigation/navigation_constants.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          sliverAppBarWidget(context),
          itemsWidget(
            context: context,
            title: "Hot Sales",
            isAddCart: false,
            itemHeight: context.highValue * 1.6,
            productWidth: context.highValue * 1.2,
            productList: productList
                .skipWhile((value) => int.parse(value.id) > 4)
                .toList(),
          ),
          itemsWidget(
              context: context,
              title: "Recently Viewed",
              isAddCart: true,
              itemHeight: context.highValue * 2.2,
              productWidth: context.highValue,
              productList: productList
                  .skipWhile((value) => int.parse(value.id) < 5)
                  .toList()),
          SliverToBoxAdapter(
            child: context.normalSizedBoxVertical,
          ),
        ],
      ),
    );
  }

  AppBar appBarWidget(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      toolbarHeight: context.mediumValue * 1.7,
      title: textFormWidget(
        context: context,
        hintText: "Search a product, clothes...",
        suffixIcon: Icon(
          IconConstants.search,
          color: ColorSchemeLight.instance!.darkGrey,
        ),
      ),
      actions: [
        circleButtonWidget(
          context: context,
          icon: Icon(
            IconConstants.cart,
            color: ColorSchemeLight.instance!.black,
          ),
          onPressed: () {
            Navigator.of(
              context,
              rootNavigator: true,
            ).pushNamed(
              NavigationConstants.CART_PAGE_VIEW,
            );
          },
        ),
        context.normalSizedBoxHorizontal,
      ],
    );
  }

  SliverAppBar sliverAppBarWidget(BuildContext context) {
    return SliverAppBar(
      elevation: 5,
      backgroundColor: Colors.white,
      pinned: false,
      snap: true,
      floating: true,
      title: SizedBox(
        width: double.infinity,
        height: context.mediumValue * 1.2,
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return context.lowSizedBoxHorizontal;
          },
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return outlinedButtonWidget(
              context: context,
              icon: Icons.ac_unit_sharp,
              text: "Headset",
            );
          },
        ),
      ),
      titleSpacing: context.lowValue,
      toolbarHeight: context.mediumValue * 1.7,
      leadingWidth: context.mediumValue * 2,
      leading: Row(
        children: [
          context.normalSizedBoxHorizontal,
          circleButtonWidget(
            context: context,
            icon: Icon(
              IconConstants.filter,
              color: ColorSchemeLight.instance!.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  SliverToBoxAdapter itemsWidget({
    required BuildContext context,
    required String title,
    required bool isAddCart,
    required double itemHeight,
    required double productWidth,
    required List<ProductModel> productList,
  }) {
    return SliverToBoxAdapter(
      child: SizedBox(
        width: double.infinity,
        height: itemHeight,
        child: Column(
          children: [
            context.mediumSizedBoxVertical,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.paddingLow.horizontal,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextThemeLight.instance!.titleLarge,
                  ),
                  Text(
                    "See all",
                    style: TextThemeLight.instance!.titleSmall,
                  ),
                ],
              ),
            ),
            context.normalSizedBoxVertical,
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: productList.length,
                padding: context.paddingMediumHorizontal,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: productWidth,
                    child: productWidget(
                      context: context,
                      isAddCart: isAddCart,
                      productModel: productList[index],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return context.normalSizedBoxHorizontal;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget productWidget(
      {required BuildContext context,
      required bool isAddCart,
      required ProductModel productModel}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              productModel.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        context.lowSizedBoxVertical,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              productModel.name,
              style: TextThemeLight.instance!.titleMedium,
            ),
            isAddCart == true
                ? const SizedBox()
                : Text(
                    "${productModel.price.toString()}\$",
                    style: TextThemeLight.instance!.titleMedium,
                  ),
          ],
        ),
        context.lowSizedBoxVertical,
        Text(
          productModel.description,
          style: TextThemeLight.instance!.bodySmall,
        ),
        isAddCart == false
            ? const SizedBox()
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${productModel.price.toString()}\$",
                    style: TextThemeLight.instance!.titleLarge.copyWith(),
                  ),
                  squareButtonWidget(
                    context: context,
                    buttonColor: ColorSchemeLight.instance!.orange,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 350),
                      transitionBuilder: (child, anim) => RotationTransition(
                        turns: child.key == const ValueKey('icon1')
                            ? Tween<double>(begin: 1, end: 1).animate(anim)
                            : Tween<double>(begin: 0.75, end: 1).animate(anim),
                        child: ScaleTransition(scale: anim, child: child),
                      ),
                      child:
                          context.watch<CartProvider>().items[productModel] !=
                                  null
                              ? const Icon(Icons.done_rounded,
                                  key: ValueKey('icon1'))
                              : const Icon(
                                  Icons.add_rounded,
                                  key: ValueKey('icon2'),
                                ),
                    ),
                    onPressed: () {
                      context.read<CartProvider>().addProduct(productModel, 1);
                    },
                  )
                ],
              )
      ],
    );
  }
}

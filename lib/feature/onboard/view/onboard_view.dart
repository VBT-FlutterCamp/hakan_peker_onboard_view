import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../product/components/color/color_constants.dart';
import '../../../product/components/shape/shape_constants.dart';
import '../../../product/components/text/app_text.dart';
import '../../../product/widget/elevated_button.dart';
import '../../login/login_view.dart';
import '../model/onboard_model.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({Key? key}) : super(key: key);

  @override
  _OnboardViewState createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  int currentIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (int i) {
                  setState(() {
                    currentIndex = i;
                  });
                },
                itemCount: models.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _mainPage(index, context),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ));
  }

  Column _mainPage(int index, BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: Image.asset(
            models[index].image,
            height: context.dynamicHeight(0.6),
          ),
        ),
        Expanded(
          child: _mainContainer(context, index),
        )
      ],
    );
  }

  Container _mainContainer(BuildContext context, int index) {
    return Container(
      decoration: BoxDecoration(
          color: ColorConstants.mainContainerColor, borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(models.length, (index) => _circleContainer(index, context)),
        ),
        _titleText(index, context),
        AppConstants.sizedbox,
        Padding(
          padding: context.paddingNormal,
          child: _descriptionText(context, index),
        ),
        SizedBox(
          height: context.mediumValue,
        ),
        _rowElevatedButton(context)
      ]),
    );
  }

  Padding _circleContainer(int index, BuildContext context) {
    return Padding(
      padding:context.verticalPaddingLow,
      child: Container(
        height: AppConstants.circleContainerHeight,
        width: AppConstants.circleContainerWidth,
        margin: AppConstants.containerMargin,
        decoration: BoxDecoration(
          color: currentIndex == index ? ColorConstants.circleContainerColorSelected : ColorConstants.circleContainerColorNotSelected,
          border: Border.all(color: context.appTheme.primaryColor),
          borderRadius: AppConstants.circleBorderRadius,
        ),
      ),
    );
  }

  FittedBox _titleText(int index, BuildContext context) {
    return FittedBox(
      fit: BoxFit.fill,
      child: Text(
        models[index].title,
        style: Theme.of(context).textTheme.headline4?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  SizedBox _descriptionText(BuildContext context, int index) {
    return SizedBox(
        height: context.dynamicHeight(0.16),
        child: Text(
          models[index].description,
          style: Theme.of(context).textTheme.headline5,
        ));
  }

  Row _rowElevatedButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        PageElevatedButton(
          elevatedButtonText: AppText.skipButton,
          onPressed: () {
            if (currentIndex == models.length - 3) {
              _controller?.animateToPage(AppConstants.pageNumberOne, duration: AppConstants.buttonDuration, curve: AppConstants.pageCurve);
            } else if (currentIndex == models.length - 2) {
              _controller?.animateToPage(AppConstants.pageNumberTwo, duration: AppConstants.buttonDuration, curve: AppConstants.pageCurve);
            }
          },
          color: ColorConstants.skipButtonColor,
        ),
        PageElevatedButton(
          elevatedButtonText: AppText.nextButton,
          onPressed: () {
            if (currentIndex == models.length - 1) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginView(),
                  ));
            }
          },
          color: ColorConstants.nextButtonColor,
        )
      ],
    );
  }
}

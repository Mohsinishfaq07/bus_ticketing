import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../router/app_state.dart';
import '../../utils/constants/app_assets.dart';
import '../../utils/globals/globals.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({
    Key? key,
    this.screeData,
    required this.title,
    this.leading,
    this.subTitle,
    this.trailing,
    this.shouldUseWhiteColor = false,
    this.backgroundColor,
  }) : super(key: key);

  MediaQueryData? screeData;
  final String title;
  final bool shouldUseWhiteColor;
  Widget? trailing;
  Widget? leading;
  String? subTitle;
  Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Align(
        alignment: Alignment.topCenter,
        child: ColoredBox(
          color: backgroundColor ?? Colors.transparent,
          child: SizedBox(
            width: screeData == null
                ? MediaQuery.of(context).size.width
                : screeData!.size.width,
            height: 100,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        AppState state = sl();
                        state.moveToBackScreen();
                      },
                      child: leading ??
                          Icon(
                            Icons.arrow_back,
                            color: shouldUseWhiteColor
                                ? Colors.white
                                : Theme.of(context).primaryColor,
                            size: 25,
                          )),
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppAssets.busSvg,
                          height: 30.h,
                          color: shouldUseWhiteColor
                              ? Colors.white
                              : Theme.of(context).primaryColor,
                        ),
                        const SizedBox(width: 5),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                      color: shouldUseWhiteColor
                                          ? Colors.white
                                          : Theme.of(context).primaryColor),
                            ),
                            const SizedBox(height: 7),
                            if (subTitle != null)
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 50.sp),
                                child: Text(
                                  subTitle!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14.w,
                                      fontWeight: FontWeight.bold,
                                      color: shouldUseWhiteColor
                                          ? Colors.white
                                          : Theme.of(context).primaryColor),
                                ),
                              ),
                            SizedBox(height: 30.h),
                          ],
                        ),
                      ],
                    ),
                  ),
                  trailing ??
                      SvgPicture.asset(
                        AppAssets.notificationSvg,
                        height: 25,
                        color: shouldUseWhiteColor
                            ? Colors.white
                            : Theme.of(context).primaryColor,
                      )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

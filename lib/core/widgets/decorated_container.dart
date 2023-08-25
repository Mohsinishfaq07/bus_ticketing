import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:sb_myreports/core/widgets/custom/custom_app_bar.dart';
import 'package:sb_myreports/core/widgets/custom/custom_scroll_config.dart';

class DecoratedContainer extends StatefulWidget {
  DecoratedContainer({
    Key? key,
    this.children,
    this.child,
    this.isScrollable = false,
    this.isChildrenScrollable = true,
    this.appBar,
  }) : super(key: key);

  /// adds list of children having white
  /// container at the back and is scrolable
  /// by default. scroll can be controlled by bool
  /// [isChildrenScrollable]
  final List<Widget>? children;

  /// Adds the widget below the appbar
  /// with no backgorund
  final Widget? child;

  /// for children only
  final bool isChildrenScrollable;

  /// for whole screen
  bool isScrollable;
  Widget? appBar;

  @override
  State<DecoratedContainer> createState() => _DecoratedContainerState();
}

class _DecoratedContainerState extends State<DecoratedContainer> {
  ScrollController mainController = ScrollController();

  late MediaQueryData screenData;

  // Controllers
  @override
  Widget build(BuildContext context) {
    screenData = MediaQuery.of(context);
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      // primary: false,
      body: Stack(
        children: [
          Positioned(
            top: -300,
            left: -100,
            child: Container(
              height: 600,
              width: 600,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: const [
                      0.1,
                      0.7
                    ],
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).primaryColorDark,
                    ]),
              ),
            ),
          ),
          KeyboardVisibilityBuilder(builder: (p0, isKeyboardVisible) {
            print(isKeyboardVisible);
            if (widget.isScrollable && !isKeyboardVisible) {
              widget.isScrollable = false;
              mainController.animateTo(0,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeIn);
            } else if (!widget.isScrollable) {
              widget.isScrollable = true;
            }
            return ScrollConfiguration(
              behavior: CustomNoGlowScrollBehavior(),
              child: SingleChildScrollView(
                controller: mainController,
                physics: isKeyboardVisible
                    ? const ClampingScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 120),
                    SizedBox(height: screenData.size.height * 0.03),
                    if (widget.child != null) widget.child!,
                    if (widget.children != null)
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            width: screenData.size.width - 40,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: widget.isChildrenScrollable
                                ? SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: widget.children!,
                                    ),
                                  )
                                : Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: widget.children!,
                                  ),
                          ),
                        ),
                      ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            );
          }),
          Align(
            alignment: Alignment.topCenter,
            child: widget.appBar ??
                CustomAppBar(
                    title: "Bus Ticket App", shouldUseWhiteColor: true),
          ),
        ],
      ),
    );
  }
}

class WhiteBackgroundContainer extends StatelessWidget {
  const WhiteBackgroundContainer(
      {Key? key,
      required this.child,
      this.padding = const EdgeInsets.all(20),
      this.margin = const EdgeInsets.all(0),
      this.useMaxWidth = true})
      : super(key: key);
  final Widget child;
  final bool useMaxWidth;
  final EdgeInsets padding;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: useMaxWidth ? double.infinity : null,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: child,
    );
  }
}

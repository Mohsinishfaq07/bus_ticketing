import 'package:flutter/material.dart';

//ignore: must_be_immutable
class ContinueButton extends StatelessWidget {
  ContinueButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.loadingNotifier,
    this.isEnabledNotifier,
    this.backgroundColor,
    this.textColor,
  }) : super(key: key);

  final String text;
  final VoidCallback? onPressed;
  final ValueNotifier<bool>? loadingNotifier;
  final Color? backgroundColor;
  final Color? textColor;
  ValueNotifier<bool>? isEnabledNotifier;

  @override
  Widget build(BuildContext context) {
    if (loadingNotifier == null) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor,
          gradient: backgroundColor != null
              ? null
              : LinearGradient(stops: const [
                  0.3,
                  0.7
                ], colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColorDark,
                ]),
        ),
        child: ElevatedButton(
          // style: ButtonStyle(
          //     backgroundColor:
          //         MaterialStateProperty.all<Color?>(backgroundColor)),
          child: Text(
            text,
            style:
                Theme.of(context).textTheme.button!.copyWith(color: textColor),
          ),
          onPressed: () {
            FocusScope.of(context).unfocus();
            if (onPressed != null) {
              onPressed!();
            }
          },
        ),
      );
    }

    isEnabledNotifier ??= ValueNotifier(true);

    return ValueListenableBuilder<bool>(
      valueListenable: isEnabledNotifier!,
      builder: (context, isEnabled, child) {
        return ValueListenableBuilder<bool>(
          valueListenable: loadingNotifier!,
          builder: (context, isLoading, child) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: backgroundColor,
                gradient: backgroundColor != null
                    ? null
                    : LinearGradient(stops: const [
                        0.3,
                        0.7
                      ], colors: [
                        Theme.of(context).primaryColor,
                        Theme.of(context).primaryColorDark,
                      ]),
              ),
              child: ElevatedButton(
                child: (isLoading)
                    ? const CircularProgressIndicator.adaptive(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                    : Text(text, style: Theme.of(context).textTheme.button),
                onPressed: shouldButtonBeEnabled(isEnabled, isLoading)
                    ? () {
                        FocusScope.of(context).unfocus();
                        if (onPressed != null) {
                          onPressed!();
                        }
                      }
                    : null,
              ),
            );
          },
        );
      },
    );
  }

  bool shouldButtonBeEnabled(bool isEnabled, bool isLoading) =>
      isEnabled && !isLoading;
}

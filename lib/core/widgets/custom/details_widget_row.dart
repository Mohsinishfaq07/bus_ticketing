import 'package:flutter/material.dart';

class DetailswidgetRow extends StatelessWidget {
  /// shows key value pair in row
  const DetailswidgetRow({
    Key? key,
    required this.title,
    required this.value,
    this.color,
    this.titleColor,
    this.valueColor,
  }) : super(key: key);

  final String title;
  final String value;

  /// Applies to both title and value
  final Color? color;
  final Color? titleColor;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: color ?? titleColor,
            ),
          )),
          Expanded(
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    value,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: color ?? valueColor,
                    ),
                  ))),
        ],
      ),
    );
  }
}

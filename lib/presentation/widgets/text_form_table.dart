import 'package:flutter/material.dart';
import 'package:my_store_hub/common/styles.dart';

class TextFormLabel extends StatelessWidget {
  const TextFormLabel({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(color: navyColor, fontWeight: FontWeight.w700),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:vinyla/presenter/common/extensions/extension.dart';

class LeadingAvatar extends StatelessWidget {
  const LeadingAvatar({
    Key? key,
    required this.username,
    this.radius,
    this.minRadius,
    this.maxRadius,
  }) : super(key: key);

  final String username;

  final double? radius;
  final double? minRadius;
  final double? maxRadius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      minRadius: minRadius,
      maxRadius: maxRadius,
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
      child: Text(
        username.initials,
        softWrap: false,
        overflow: TextOverflow.fade,
      ),
    );
  }
}

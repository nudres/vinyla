import 'package:flutter/material.dart';

import 'package:vinyla/presenter/common/widgets/widgets.dart';

class UrlUserAvatar extends StatelessWidget {
  const UrlUserAvatar({
    Key? key,
    required this.url,
    required this.name,
    this.radius = 64,
  }) : super(key: key);

  final String url;
  final String name;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      child: Image.network(
        url,
        fit: BoxFit.fill,
        errorBuilder: (context, error, stackTrace) => LeadingAvatar(
          username: name,
        ),
        frameBuilder: (BuildContext context, Widget child, int? frame, bool wasSynchronouslyLoaded) {
          return ClipOval(
            child: child,
          );
        },
        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) return child;
          return LeadingAvatar(
            username: name,
          );
        },
      ),
    );
  }
}

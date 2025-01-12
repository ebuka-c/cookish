import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AppRefreshIndicator extends StatelessWidget {
  final VoidCallback onRefresh;
  final Color? color;
  final double? size;
  const AppRefreshIndicator(
      {super.key, required this.onRefresh, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
          onTap: onRefresh,
          child: Icon(Iconsax.refresh, color: color, size: size)),
    );
  }
}

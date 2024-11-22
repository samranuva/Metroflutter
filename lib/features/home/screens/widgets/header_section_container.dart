import 'package:flutter/material.dart';
import 'package:t_savaari/common/widgets/containers/curved_edge_widget.dart';
import 'package:t_savaari/utils/constants/colors.dart';


class HeaderSectionContainer extends StatelessWidget {
  const HeaderSectionContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return CurvedEdgeWidget(
      child: Container(
        color: TColors.primary,
        padding: const EdgeInsets.all(0),
        child: child,
      ),
    );
  }
}

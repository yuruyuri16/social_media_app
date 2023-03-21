import 'package:flutter/material.dart';

///
class ScrollableColumn extends StatelessWidget {
  ///
  const ScrollableColumn({
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.padding,
    super.key,
  });

  ///
  final MainAxisAlignment mainAxisAlignment;

  ///
  final MainAxisSize mainAxisSize;

  ///
  final CrossAxisAlignment crossAxisAlignment;

  ///
  final List<Widget> children;

  ///
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: constraints.maxWidth,
              minHeight: constraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Padding(
                padding: padding ?? EdgeInsets.zero,
                child: Column(
                  mainAxisAlignment: mainAxisAlignment,
                  mainAxisSize: mainAxisSize,
                  crossAxisAlignment: crossAxisAlignment,
                  children: children,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

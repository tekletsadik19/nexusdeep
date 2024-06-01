import 'package:flutter/material.dart';
import 'package:nexusdeep/core/extensions/context_extensions.dart';

class DealComponent extends StatelessWidget {
  const DealComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(8, 10, 8, 12),
        child: Container(
          width: 237,
          height: 255,
          decoration: BoxDecoration(
            color: context.theme.primaryColor
                .withOpacity(.9),
            boxShadow: const [
              BoxShadow(
                blurRadius: 7,
                color: Color(0x2F1D2429),
                offset: Offset(0, 1),
              ),
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(9, 9, 9, 12),
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(),
                    ),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

import 'package:nexusdeep/core/extensions/context_extensions.dart';

class AcquisitionBottomModal extends StatefulWidget {
  const AcquisitionBottomModal({required this.children, super.key});
  final List<Widget> children;
  @override
  _AcquisitionBottomModalState createState() => _AcquisitionBottomModalState();
}

class _AcquisitionBottomModalState extends State<AcquisitionBottomModal> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        width: double.infinity,
        height: 250,
        alignment: AlignmentDirectional.topCenter,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: context.theme.canvasColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 3,
                      decoration: BoxDecoration(
                        color: context.theme.colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                Expanded(
                  child: ListView(
                    children: widget.children,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

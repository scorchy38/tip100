import 'package:tip100/core/constants/app_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_defaults.dart';
import '../../../core/constants/app_icons.dart';

class IPRSearchBox extends StatelessWidget {
  const IPRSearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDefaults.padding),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 40,
              child: TextFormField(
                decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 12),
                    child: SvgPicture.asset(AppIcons.close),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 9.0),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Start Typing',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8),
                    child: SvgPicture.asset(
                      AppIcons.search,
                      color: AppColors.appGrey,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: AppDefaults.borderRadius,
                    borderSide: const BorderSide(width: 0.1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: AppDefaults.borderRadius,
                    borderSide: const BorderSide(width: 0.1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: AppDefaults.borderRadius,
                    borderSide: const BorderSide(width: 0.1),
                  ),
                  prefixIconConstraints: const BoxConstraints(maxWidth: 48),
                ),
              ),
            ),
          ),
          // Expanded(child: SvgPicture.asset(AppButtons.filter))
        ],
      ),
    );
  }
}

import 'package:tip100/core/constants/app_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/constants.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  @override
  Widget build(BuildContext context) {
    bool showIcon = false;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDefaults.padding),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 40,
              child: TextFormField(
                cursorColor: Colors.black,
                cursorWidth: 1.5,
                cursorRadius: Radius.circular(10),
                // textAlign: TextAlign.center,
                onTap: () {
                  setState(() {
                    showIcon = true;
                  });
                },
                decoration: InputDecoration(
                  // suffixIcon: !showIcon ? Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //       horizontal: 8.0, vertical: 12),
                  //   child: SvgPicture.asset(AppIcons.close)
                  // ): Container(),

                  contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Search any Litigation, IPR or Notice',
                  prefixIcon: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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

import 'package:tip100/core/constants/app_defaults.dart';
import 'package:flutter/material.dart';

import 'ipr_section_card.dart';

class IPRSections extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      child: ListView(
        children: [
          IPRSectionCard(cardtitle: 'Trademarks', newTag: false),
          IPRSectionCard(cardtitle: 'International Trademarks', newTag: true),
          IPRSectionCard(cardtitle: 'Copyrights', newTag: false),
          IPRSectionCard(cardtitle: 'Patents', newTag: true),
          IPRSectionCard(cardtitle: 'Designs', newTag: false),
          IPRSectionCard(cardtitle: 'Trade Names', newTag: false),
        ],
      ),
    );
  }
}

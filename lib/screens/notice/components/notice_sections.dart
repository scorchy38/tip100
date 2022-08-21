import 'package:tip100/core/constants/app_defaults.dart';
import 'package:flutter/material.dart';

import 'notice_section_card.dart';

class NoticeSections extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      child: ListView(
        children: [
          NoticeSectionCard(cardtitle: 'All Notices', newTag: true),
          NoticeSectionCard(cardtitle: 'My Counsels', newTag: false),
        ],
      ),
    );
  }
}

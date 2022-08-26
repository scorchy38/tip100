import 'package:flutter/cupertino.dart';

abstract class Languages {
  static Languages of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages)!;
  }


  String get labelSelectLanguage;
  String get trustScore;
  String get sessionAnonymous;
  String get witnessCrime;
  String get reportIt;
  String get anonymousAndSafe;
  String get messages;
  String get alerts;
  String get more;
 

}
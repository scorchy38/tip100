import 'package:tip100/core/constants/app_colors.dart';
import 'package:customizable_multiselect_field/models/customizable_multiselect_dialog_options.dart';
import 'package:customizable_multiselect_field/models/customizable_multiselect_widget_options.dart';
import 'package:customizable_multiselect_field/models/data_source.dart';
import 'package:customizable_multiselect_field/models/data_source_options.dart';
import 'package:customizable_multiselect_field/widgets/customizable_multiselect_Field.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'core/constants/app_icons.dart';
import 'user_model.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  List<String> lawyerListValue = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Search Dropdown Demo",
        style: TextStyle(color: Colors.black),
      )),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            padding: EdgeInsets.all(4),
            children: <Widget>[
              Card(
                elevation: 3,
                shadowColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      // border: Border.all(
                      //     color: AppColors.purpleTag,
                      //     width: 1,
                      //     style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(10)),
                  child: CustomizableMultiselectField(
                      customizableMultiselectWidgetOptions:
                          CustomizableMultiselectWidgetOptions(
                        chipColor: AppColors.primary.withOpacity(0.3),
                        hintText: Text('Please Select a Lawyer',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(
                                    fontSize: 16,
                                    color: AppColors.textColorBlack,
                                    fontWeight: FontWeight.bold)),

                        // decoration: InputDecoration(
                        //   labelText: 'Multiselect Sample teste',
                        // ),
                        chipShape: RoundedRectangleBorder(
                          side: BorderSide(color: AppColors.primary, width: 1),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      customizableMultiselectDialogOptions:
                          CustomizableMultiselectDialogOptions(
                              searchBarDecoration: InputDecoration(
                        hintText: 'Search Lawyers',
                        hintStyle:
                            Theme.of(context).textTheme.bodyText1?.copyWith(
                                  fontSize: 16,
                                  color: AppColors.appGrey,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide:
                              BorderSide(color: AppColors.appGrey, width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide:
                              BorderSide(color: AppColors.appGrey, width: 2.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide:
                              BorderSide(color: AppColors.appGrey, width: 2.0),
                        ),
                      )),
                      dataSourceList: [
                        DataSource<String>(
                          dataList: [
                            {
                              'label': 'Mr. Neeraj Mehta',
                              'value': 'test1',
                            },
                            {
                              'label': 'Ms. Tanya Mahajan',
                              'value': 'test2',
                            },
                            {
                              'label': 'Mr. BHuoendra Rai',
                              'value': 'test3',
                            },
                          ],
                          valueList: lawyerListValue,
                          options: DataSourceOptions(
                            valueKey: 'value',
                            labelKey: 'label',
                          ),
                        ),
                      ],
                      onChanged: ((List<List<dynamic>> value) => print(value)),
                      onSaved: ((List<List<dynamic>>? newValueList) {
                        setState(() {
                          print(newValueList);
                        });
                      }),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                      ),
                      validator: ((List<List<dynamic>>? value) {
                        // if (value!.every((element) => element.isEmpty))
                        //   return 'Please Select a value!';
                        return null;
                      })),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<UserModel>> getData(filter) async {
    var response = await Dio().get(
      "https://5d85ccfb1e61af001471bf60.mockapi.io/user",
      queryParameters: {"filter": filter},
    );

    final data = response.data;
    if (data != null) {
      return UserModel.fromJsonList(data);
    }

    return [];
  }
}

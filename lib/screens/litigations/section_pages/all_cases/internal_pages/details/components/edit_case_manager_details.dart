import 'package:tip100/core/components/dropdown.dart';
import 'package:tip100/core/components/dropdown_large.dart';
import 'package:tip100/core/components/text_field.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/logic/bloc/add_case_bloc/add_case_bloc.dart';
import 'package:tip100/logic/bloc/all_cases_filters_bloc/all_cases_filters_bloc.dart';
import 'package:tip100/logic/bloc/form_submission.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../core/constants/app_icons.dart';
import '../../../../../../../size_config.dart';

class EditCaseManagerDetails extends StatefulWidget {
  const EditCaseManagerDetails({Key? key}) : super(key: key);

  @override
  _EditCaseManagerDetailsState createState() => _EditCaseManagerDetailsState();
}

class _EditCaseManagerDetailsState extends State<EditCaseManagerDetails> {
  TextEditingController titleController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  bool submitting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
        title: Text(
          'Edit Case Manager Details',
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SvgPicture.asset(
              AppIcons.close,
              color: Colors.black,
              height: 15,
            ),
          ),
        ),
      ),
      body: BlocListener<AddCaseBloc, AddCaseState>(
        listener: (context, state) {
          var current = state.formSubmissionStatus;
          if (current is SubmissionSuccess) {
            context.read<AddCaseBloc>().add(EventComplete());
            Navigator.pop(context);
          } else if (current is SubmissionFailed) {}
        },
        child: Builder(builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: AppDefaults.padding,
                        top: AppDefaults.padding,
                        right: AppDefaults.padding),
                    child: AppTextField(
                      false,
                      titleController,
                      'Case Manager Name',
                      1.2,
                      onChanged: (value) {
                        context
                            .read<AddCaseBloc>()
                            .add(EventAddTitle(title: value!));
                        setState(() {});
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: AppDefaults.padding,
                        top: AppDefaults.padding,
                        right: AppDefaults.padding),
                    child: AppTextField(
                      false,
                      emailController,
                      'Case Manager Email',
                      1.2,
                      onChanged: (value) {
                        context
                            .read<AddCaseBloc>()
                            .add(EventAddTitle(title: value!));
                        setState(() {});
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: AppDefaults.padding,
                        top: AppDefaults.padding,
                        right: AppDefaults.padding),
                    child: AppTextField(
                      false,
                      phoneNumberController,
                      'Case Manager Phone Number',
                      1.2,
                      onChanged: (value) {
                        context
                            .read<AddCaseBloc>()
                            .add(EventAddTitle(title: value!));
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
              Container(
                height: getProportionateScreenHeight(96),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5, color: Colors.black.withOpacity(0.4))
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 35.0, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          // context.read<AddCaseBloc>().add(EventSubmitted());
                          setState(() {});
                        },
                        child: Text(
                          'Clear All',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  color: AppColors.appGrey,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          setState(() {});
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 4,
                          color:
                              (context.read<AddCaseBloc>().state.title.length >
                                          2 &&
                                      context
                                              .read<AddCaseBloc>()
                                              .state
                                              .description
                                              .length >
                                          2)
                                  ? AppColors.appBlue
                                  : AppColors.appGrey,
                          child: submitting == true
                              ? Container(
                                  width: 95,
                                  height: 45,
                                  child: Center(
                                    child: CircleAvatar(
                                      radius: 10,
                                      backgroundColor: Colors.transparent,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: Text(
                                    'Update Case Manager Details',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15),
                                  ),
                                ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}

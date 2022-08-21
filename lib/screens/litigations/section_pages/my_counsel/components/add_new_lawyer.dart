import 'package:tip100/core/components/dropdown.dart';
import 'package:tip100/core/components/dropdown_large.dart';
import 'package:tip100/core/components/text_field.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/logic/bloc/add_lawyer_bloc/add_lawyer_bloc.dart';
import 'package:tip100/logic/bloc/form_submission.dart';
import 'package:tip100/logic/bloc/my_counsel_bloc/my_counsel_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constants/app_icons.dart';
import '../../../../../size_config.dart';

class AddNewLawyer extends StatefulWidget {
  const AddNewLawyer({Key? key}) : super(key: key);

  @override
  _AddNewLawyerState createState() => _AddNewLawyerState();
}

class _AddNewLawyerState extends State<AddNewLawyer> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  List genderMaps = [
    {'id': 'M', 'name': 'Male'},
    {'id': 'F', 'name': 'Female'},
    {'id': 'O', 'name': 'Others'}
  ];
  String gender = 'NULL';
  List<String> genders = ['Gender', 'Male', 'Female', 'Others'];

  bool active = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
        title: Text(
          'Add New Lawyer',
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
      body: BlocListener<AddLawyerBloc, AddLawyerState>(
        listener: (context, state) {
          var current = state.formSubmissionStatus;
          if (current is SubmissionSuccess) {
            Navigator.pop(context);
            context.read<MyCounselBloc>().add(MyCounselRefreshing());
            context.read<MyCounselBloc>().add(MyCounselGetAllCounsels());
            context.read<AddLawyerBloc>().add(EventComplete());
          } else if (current is SubmissionFailed) {}
        },
        child: Builder(builder: (context) {
          genderController.text = 'Gender';

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
                      nameController,
                      'Lawyer Name',
                      1.2,
                      onChanged: (value) {
                        context
                            .read<AddLawyerBloc>()
                            .add(EventAddName(name: value!));
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
                      phoneController,
                      'Lawyer Phone Number',
                      1.2,
                      onChanged: (value) {
                        context
                            .read<AddLawyerBloc>()
                            .add(EventAddNumber(number: value!));
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
                      'Lawyer Email Address',
                      1.2,
                      onChanged: (value) {
                        context
                            .read<AddLawyerBloc>()
                            .add(EventAddEmail(email: value!));
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppDefaults.padding),
                    child: AppLargeDropdown(
                        dropdownValue: 'Gender',
                        values: genders,
                        controller: genderController,
                        label: 'Gender'
                        // 'Lawyer Gender',
                        // const <String>[
                        //   'Lawyer Gender',
                        //   'Male',
                        //   'Female',
                        //   'Others',
                        // ],
                        // blocToImplement: 'AddLawyer',
                        // stateVariableToChange: 'gender',
                        ),
                  ),
                  const SizedBox(
                    height: 20,
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
                        onTap: () {
                          if (gender != 'Gender')
                            genderMaps.forEach((element) {
                              if (element['name'] == genderController.text)
                                gender = element['id'];
                            });
                          else
                            gender = 'NULL';
                          context
                              .read<AddLawyerBloc>()
                              .add(EventAddGender(gender: gender));
                          // if (context.watch<AddLawyerBloc>().state.name.length >
                          //         2 &&
                          //     context
                          //             .watch<AddLawyerBloc>()
                          //             .state
                          //             .number
                          //             .length ==
                          //         10 &&
                          //     context
                          //             .watch<AddLawyerBloc>()
                          //             .state
                          //             .email
                          //             .length >
                          //         2)
                          context.read<AddLawyerBloc>().add(EventSubmitted());
                          setState(() {});
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 4,
                          color: (context
                                          .watch<AddLawyerBloc>()
                                          .state
                                          .name
                                          .length >
                                      2 &&
                                  context
                                          .watch<AddLawyerBloc>()
                                          .state
                                          .number
                                          .length ==
                                      10 &&
                                  context
                                          .watch<AddLawyerBloc>()
                                          .state
                                          .email
                                          .length >
                                      2 &&
                                  context
                                          .watch<AddLawyerBloc>()
                                          .state
                                          .gender
                                          .length >
                                      2)
                              ? AppColors.appBlue
                              : AppColors.appGrey,
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Text(
                              'Add Lawyer',
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

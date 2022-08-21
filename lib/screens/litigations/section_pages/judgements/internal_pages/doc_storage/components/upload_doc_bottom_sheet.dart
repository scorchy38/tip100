import 'package:tip100/core/components/cta_blue_buttons.dart';
import 'package:tip100/core/components/text_field.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddDocSheet extends StatefulWidget {
  const AddDocSheet({Key? key}) : super(key: key);

  @override
  _AddDocSheetState createState() => _AddDocSheetState();
}

class _AddDocSheetState extends State<AddDocSheet> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

      child: Container(


        height: 300,
        child: Scaffold(
          backgroundColor: AppColors.offWhite,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppDefaults.padding, vertical:25),
            child: Column(
              children: [AppTextField(true, titleController, 'Document Title', 1.2),
                const SizedBox(
                  height: 20,
                ),AppTextField(true, descriptionController, 'Description ', 1.2),
                const SizedBox(
                  height: 20,
                ),
                CTABlueButtons(buttonColor: AppColors.primary, buttonIcon: AppIcons.addButton, buttonText: 'Select Document', onTap: (){}, width: 160),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {



                        });
                      },
                      child: Text('Discard', style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color:  AppColors.appGrey , fontWeight: FontWeight.w600, fontSize: 15),),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 1.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 4,
                        color: (titleController.value.text.length > 2 && descriptionController.value.text.length >2 && addressController.value.text.length>2)? AppColors.appBlue : AppColors.appGrey,
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Row(
                            children: [
                              SvgPicture.asset(AppIcons.save),
                              SizedBox(width: 10,),
                              Text('Save Link', style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(color:AppColors.white , fontWeight: FontWeight.w600, fontSize: 15),),
                            ],
                          ),
                        ),
                      ),
                    )
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

import 'package:tip100/core/components/text_field.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WhatsappShareSheet extends StatefulWidget {
  const WhatsappShareSheet({Key? key}) : super(key: key);

  @override
  WhatsappShareSheetState createState() => WhatsappShareSheetState();
}

class WhatsappShareSheetState extends State<WhatsappShareSheet> {
  TextEditingController titleController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        height: 180,
        child: Scaffold(
          backgroundColor: AppColors.offWhite,
          body: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppDefaults.padding, vertical: 25),
            child: Column(
              children: [
                AppTextField(
                    false, titleController, "Recipient's Email Address", 1.2),
                SizedBox(
                  height: 10,
                ),
                SizedBox(height: 5,),
                AppTextField(
                    false, mobileController, "Recipient's Mobile Number", 1.2),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {});
                      },
                      child: Text(
                        'Discard',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: AppColors.appGrey,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 1.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 4,
                        color: (titleController.value.text.length > 2 && mobileController.text.length==10)
                            ? AppColors.appBlue
                            : AppColors.appGrey,
                        child: InkWell(
                          onTap: (){
                            if(mobileController.text.length!=10){
                              Fluttertoast.showToast(msg: 'Please enter a valid 10 digit mobile number!');

                            }
                            //TODO CHECK FOR VALID EMAIL USING ELSE IF
                            else{
                              // HIT API
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Row(
                              children: [
                                Text(
                                  'Share File',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                              ],
                            ),
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

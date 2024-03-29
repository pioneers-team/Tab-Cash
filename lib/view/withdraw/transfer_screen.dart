import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:tab_cash/core/utils/media_quary.dart';
import '../../core/components/custom_button.dart';
import '../../core/components/custom_text_field_money.dart';
import '../../core/constants/app_images.dart';
import '../../core/styles/colors.dart';


class TransferScreen extends StatefulWidget {
   TransferScreen({Key? key}) : super(key: key);

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  final _formKey = GlobalKey<FormState>();
  final addAmountController= TextEditingController();
  final numberController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:  Text('Transfer',
          style: GoogleFonts.poppins(
              letterSpacing: 0.6,
              fontSize: 24.0,
              color:Colors.black,
              fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios,),
        ),
        actions: const[
          Padding(
            padding:  EdgeInsets.only(right: 15.0),
            child: Icon(IconlyLight.notification),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: (){
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                 SizedBox(height:context.height*0.1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(' Add amount',style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 16.0
                      ),),
                      const SizedBox(height: 16.0,),
                       CustomTextFieldMoney(
                         controller: addAmountController,
                           validator: (String? value) {
                         if(value!.isEmpty){
                           return "Please add a Amount ";
                         }else if(  value.length < 2){
                           return "The Amount is not enough";
                         }
                         else if(value.length > 5){
                           return 'Your money is too high';
                         }
                       }, hintText: '00,000,00 '),
                      SizedBox(height: context.height* 0.05,),                    Text('Recipient Number',style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 16.0
                      ),),
                      const SizedBox(height: 16.0,),
                      CustomTextFieldMoney(
                        controller: numberController,
                        textInputType: TextInputType.phone,
                          hintText: '',validator:(String? value) {
                        if(value!.isEmpty){
                          return "Please Enter The Number";
                        }else if( value.length != 11){
                          return "The Number is  Wrong";
                        }
                      } ),
                       SizedBox(height: context.height* 0.1,),
                    ],
                  ),
                ),
                customButton(
                    context,
                    color: AppColors.secondColor,
                    label: 'Send',
                    onTap: ()async{
                      if(_formKey.currentState!.validate()){
                        await  showOtpMessage(context);
                        addAmountController.clear();
                        numberController.clear();
                      }
                    }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> showOtpMessage(BuildContext context) {
    return showDialog(context: context, builder: (context) =>AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0)
      ),
      content: Container(

        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppImages.alertTransfer),
            const SizedBox(height: 16.0,),
            Row(
              children: [
                const CircleAvatar(
                  radius: 12.0,
                  backgroundColor: Colors.orange,
                  child: Icon(Icons.check,color: Colors.white,),
                ),
                const SizedBox(width: 8.0,),
                Text('Amount sent successfully',style: GoogleFonts.poppins(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),)
              ],
            )
          ],
        ),
      ),
    ) ,);
  }
}

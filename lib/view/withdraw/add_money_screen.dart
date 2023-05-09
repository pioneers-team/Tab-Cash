import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:tab_cash/core/components/custom_button.dart';
import 'package:tab_cash/core/styles/colors.dart';
import '../../core/components/custom_text_field_money.dart';
import '../../core/constants/app_images.dart';

class AddMoneyScreen extends StatefulWidget {
   AddMoneyScreen({Key? key}) : super(key: key);

  @override
  State<AddMoneyScreen> createState() => _AddMoneyScreenState();
}

class _AddMoneyScreenState extends State<AddMoneyScreen> {
   final amountController= TextEditingController();

   final passwordController= TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    amountController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:  Text('Add amount',
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 8.0,),

                    const SizedBox(height: 24.0,),
                    Center(child: Image.asset(AppImages.findAtm)),
                    const SizedBox(height: 24.0,),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Add amount',style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 16.0
                          ),),
                         const SizedBox(height: 16.0,),
                          CustomTextFieldMoney(
                            controller: amountController,
                            hintText: '00,000,00 ',validator: (String? value) {
                            if(value!.isEmpty){
                              return "Please fill the field";
                            }else if(  value.length < 2){
                              return "Your money is not enough";
                            }
                            else if(value.length > 5){
                              return 'Your money is too high';
                            }
                          },),
                          const SizedBox(height: 16.0,),
                          Text('Enter password',style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 16.0
                          ),),
                          const SizedBox(height: 16.0,),
                          CustomTextFieldMoney(
                            controller: passwordController,
                            textInputType: TextInputType.visiblePassword,
                            obscureText: true,
                            hintText: '',validator: (String? value) {
                          //     RegExp regex =
                          // RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                          if (value!.isEmpty) {
                            return 'Please enter password';
                          } else {
                            if (value.length<8) {
                              return 'Enter valid password';
                            } else {
                              return null;
                            }
                          }
                          },),
                          const SizedBox(height: 40.0,),
                        ],
                      ),
                    ),
                    customButton(
                        context,
                        color: AppColors.secondColor,
                        label: 'Next',
                      onTap: ()async{
                        if(_formKey.currentState!.validate()){
                          amountController.clear();
                          passwordController.clear();
                          await  showOtpMessage(context);
                        }
                      }
                    ),
                  ],
                ),
              ),
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
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      content: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(AppImages.alert),
                           const SizedBox(height: 16.0,),
                            Row(
                              children: [
                                const CircleAvatar(
                                  radius: 12.0,
                                  backgroundColor: Colors.orange,
                                  child: Icon(Icons.check,color: Colors.white,),
                                ),
                                const SizedBox(width: 16.0,),
                                Text('Sent successfully',style: GoogleFonts.poppins(
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

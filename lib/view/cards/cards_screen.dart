import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tab_cash/core/components/custom_button.dart';
import 'package:tab_cash/core/constants/app_images.dart';
import 'package:tab_cash/core/styles/colors.dart';
import 'package:tab_cash/core/utils/media_quary.dart';

import '../../core/components/custom_text_field_money.dart';


class CardsScreen extends StatefulWidget {
   const CardsScreen({Key? key}) : super(key: key);

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  int cardValue = 0;
  final _cardValueController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _cardValueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: GestureDetector(
        onTap: (){
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),

            child: Column(
              children: [
                const SizedBox(height: 8.0,),
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImages.smartCard)
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 48.0,top: 32.0),
                        child: Image.asset('assets/images/smart_card_vector.png',fit: BoxFit.cover,),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 48.0,top: 32.0),
                        child: Text('.... .... ....',style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,fontSize: 32.0
                        ),),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 48.0,top: 12.0),
                        child: Text('Expired after 24',style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,fontSize: 16.0
                        ),),
                      )
                    ],
                  ),
                ),
                SizedBox(height: context.height*0.1,),
                 Text('Add money',style: GoogleFonts.poppins(
                   fontSize: 24.0,
                   fontWeight: FontWeight.bold
                 ),),
                SizedBox(height: context.height*0.01,),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0,vertical: 8.0),
                  child:Form(
                    key: formKey,
                    child: CustomTextFieldMoney(
                      controller: _cardValueController,
                      hintText: '000',validator: (String? value) {
                      if(value!.isEmpty){
                        return "Please Enter Your money value";
                      }else if(  value.length < 2){
                        return "Your money is not enough";
                      }
                      else if(value.length > 5){
                        return 'Your money is too high';
                      }
                    },),
                  ),
                ),
                SizedBox(height: context.height*0.09,),
                customButton(context, color: AppColors.secondColor, label: 'Virtual Card',onTap: ()async{
                  if(formKey.currentState!.validate()){
                    var rng =  Random();
                    cardValue =  rng.nextInt(10000);
                    await showMessage(context);
                    _cardValueController.clear();
                  }


                })

              ],
            ),
          )
        ),
      ),
    );
  }

  Future<dynamic> showMessage(BuildContext context) {
    return showDialog(context: context, builder: (context) =>AlertDialog(
      backgroundColor: const Color(0xFF0E0E0C),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0)
      ),
      content:  Container(
        width: double.infinity,
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
            image: const DecorationImage(
                image: AssetImage('assets/images/Mask group.png')
            ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Align(
                alignment: Alignment.topLeft
                ,
                    child: Image.asset('assets/images/smart_card_vector.png')),
                const Spacer(),
                Image.asset(AppImages.logo,height: 16.0,)
              ],
            ),
             const SizedBox(height: 8.0,),
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 8.0,),
               child: Text('$cardValue $cardValue $cardValue',style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,fontSize: 28.0
            ),),
             ),
            const SizedBox(height: 16.0,),
            Row(
              children: [
                const Text('Expired after 24',style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,fontSize: 16.0
                ),),
                const Spacer(),
                SvgPicture.asset(AppImages.cvvSvg)
              ],
            )
          ],
        ),
      ),
    ) ,);
  }
}


import 'package:flutter/material.dart';

import '../../config/routes/routes.dart';
import '../../core/components/custom_TextField.dart';
import '../../core/components/custom_button.dart';
import '../../core/styles/colors.dart';
class ChildRegisterScreen extends StatefulWidget {
  const ChildRegisterScreen({Key? key}) : super(key: key);

  @override
  State<ChildRegisterScreen> createState() => _ChildRegisterScreenState();
}

class _ChildRegisterScreenState extends State<ChildRegisterScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
            'Add Child',
          ),
          leading: IconButton(
            onPressed: (){
              Navigator.pushNamedAndRemoveUntil(context, Routes.layoutScreen, (route) => false);
            },
            icon: Icon(Icons.arrow_back_ios),
          )
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: SafeArea(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Text(
                        "Create an account",
                        style: Theme.of(context).textTheme.displayMedium!.copyWith(
                            color: AppColors.secondColor,
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        "Let’s get started with your e-wallet",
                        style: Theme.of(context).textTheme.displayMedium!.copyWith(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w700
                        ),
                      ),

                      const SizedBox(
                        height: 60.0,
                      ),
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width/2.55,
                            child: CustomTextField(
                                controller: firstNameController,
                                validate: (String? value){
                                  if(value!.isEmpty){
                                    return "Enter First Name";
                                  }
                                },
                                keyboardType: TextInputType.text, label: "First Name"),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width/2.28,
                            child: CustomTextField(
                                controller: lastNameController,
                                validate: (String? value){
                                  if(value!.isEmpty){
                                    return "Enter Last Name";
                                  }
                                },
                                keyboardType: TextInputType.text, label: "Last Name"),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      CustomTextField(
                        controller: phoneController,
                        validate: (String? value){
                          if(value!.isEmpty){
                            return "Please Enter Your Number";
                          }else if(value.length > 11 || value.length < 11){
                            return "Your Phone Number Is Wrong";
                          }
                        },
                        label: 'Enter Phone Number',
                        keyboardType: TextInputType.phone,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/images/egypt.png",height: 10,width: 10,),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      CustomTextField(
                        obscureText: true,
                        controller: passwordController,
                        validate: (String? value){
                          if(value!.isEmpty){
                            return "Enter Your Password Please";
                          }
                        },
                        keyboardType: TextInputType.text,
                        label: "Enter Password",
                        suffixIcon: Icons.visibility_outlined,
                      ),

                      const SizedBox(
                        height: 20.0,
                      ),
                      customButton(
                        context,
                        onTap:(){
                          if(formKey.currentState!.validate()){
                            print("*****SUCCESS****");
                            Navigator.pushReplacementNamed(context, Routes.verificationScreen);
                          }
                        },
                        color: AppColors.secondColor,
                        label: "Child Register",
                      ),

                      const SizedBox(
                        height: 8.0,
                      ),


                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

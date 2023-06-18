import 'package:cord_2/app/home_assistent/home_assiyent_profile_layout/home_assistent.dart';
import 'package:cord_2/app/layout/presentation/cord_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../core/components/gradient_button.dart';
import '../../../core/styles/colors.dart';
import '../../../core/utils/navigator.dart';
import '../login_cubit/login_cubit.dart';
import '../login_cubit/login_states.dart';

class ChoiceScreen extends StatelessWidget {
  const ChoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
              body: Container(
            padding:
                const EdgeInsets.only(left: 9, right: 9, top: 30, bottom: 120),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/images/choise.png'),
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      'Continue as :',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 45.h,
                  decoration: BoxDecoration(
                    // gradient: AppColors.kGradient,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      overlayColor:
                          MaterialStateProperty.all(HexColor('#7966FF')),
                      onTap: () {
                        navigateAndFinish(context, const CordLayout());
                      },
                      child: Center(
                        child: Text(
                          'Patient',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 45.h,
                  decoration: BoxDecoration(
                    gradient: LoginCubit.x ? AppColors.kGradient : null,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      overlayColor:
                          MaterialStateProperty.all(HexColor('#7966FF')),
                      onTap: () {
                        LoginCubit.x = true;
                        navigateAndFinish(context, const HomeAssistant());
                      },
                      child: Center(
                        child: Text(
                          'Assistent',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ));
        },
      ),
    );
  }
}

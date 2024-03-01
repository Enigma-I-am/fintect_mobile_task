import 'package:fintech_mobile_task/assets/assets.gen.dart';
import 'package:fintech_mobile_task/assets/fonts.gen.dart';
import 'package:fintech_mobile_task/core/core.dart';
import 'package:fintech_mobile_task/presentation/widgets/widgets.dart';
import 'package:fintech_mobile_task/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    String _email = '';
    String _password = '';

    bool _validateEmail(String email) {
      // Email validation regex
      String pattern =
          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.[a-zA-Z]{2,}$";
      RegExp regex = RegExp(pattern);
      return regex.hasMatch(email);
    }

    bool _validatePassword(String password) {
      // Password validation (example: at least 8 characters)
      return password.length >= 8;
    }

    void _submitForm() {
      if (_formKey.currentState!.validate()) {
        ref.read(walletVM).login(password: _password, userName: _email);
      }
    }

    return Form(
      key: _formKey,
      child: BaseScaffold(
        backgroundColor: const Color(0xFF010A43),
        headerWidget: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BaseBackButton(),
            Spacer(),
            Text(
              'Log in',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFD6C9C9),
                fontSize: 18,
                fontFamily: FontFamily.helveticaNeueCyr,
                fontWeight: FontWeight.w500,
                height: 0.08,
              ),
            ),
            Spacer(
              flex: 2,
            ),
          ],
        ),
        bgWidget: FinTechMobileTaskAssets.svg.icDefaultBg.svg(
          fit: BoxFit.cover,
          width: context.screenWidth(),
        ),
        flexibleChildren: [
          const Gap(150),
          TextFormField(
            style: const TextStyle(
              color: Color(0xFFFAFAFA),
              fontSize: 14,
              fontFamily: FontFamily.helveticaNeueCyr,
              fontWeight: FontWeight.w400,
            ),
            decoration: const InputDecoration(
              labelText: "Email",
              labelStyle: TextStyle(
                color: Color(0xFFFAFAFA),
                fontSize: 14,
                fontFamily: FontFamily.helveticaNeueCyr,
                fontWeight: FontWeight.w400,
              ),
              border: OutlineInputBorder(
                gapPadding: 2,
                borderSide: BorderSide(
                  color: Color(0xFF1DC7AC),
                  width: 0.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF1DC7AC),
                  width: 0.0,
                ),
              ),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your user name.';
              }
              return null;
            },
            onSaved: (value) => _email = value!,
          ),
          const Gap(10),
          TextFormField(
            style: const TextStyle(
              color: Color(0xFFFAFAFA),
              fontSize: 14,
              fontFamily: FontFamily.helveticaNeueCyr,
              fontWeight: FontWeight.w400,
            ),
            decoration: const InputDecoration(
              labelText: "Password",
              labelStyle: TextStyle(
                color: Color(0xFFFAFAFA),
                fontSize: 14,
                fontFamily: FontFamily.helveticaNeueCyr,
                fontWeight: FontWeight.w400,
              ),
              border: OutlineInputBorder(
                gapPadding: 2,
                borderSide: BorderSide(
                  color: Color(0xFF1DC7AC),
                  width: 0.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF1DC7AC),
                  width: 0.0,
                ),
              ),
            ),
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your password.';
              } else if (!_validatePassword(value)) {
                return 'Password must be at least 8 characters.';
              }
              return null;
            },
            onSaved: (value) => _password = value!,
          ),
          const Gap(48),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: _submitForm,
                child: const Text(
                  'Log in',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'HelveticaNeueCyr',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

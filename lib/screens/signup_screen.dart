import 'package:flutter/material.dart';

import '../Core/app_color.dart';
import '../widgets/auth_background.dart';
import '../widgets/auth_filed.dart';
import '../widgets/auth_header.dart';
import '../widgets/primary_button.dart';
import '../widgets/social_button.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool hidePassword = true;
  bool agreeTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        //  BACKGROUND
        imagePath: 'assets/images/mg.jpeg',

        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 14,
                ),
                child: Column(
                  children: [
                    // HEADER
                    SizedBox(
                      height: constraints.maxHeight * 0.24,
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: AuthHeader(
                          title: 'Create\nAccount ✨',
                          subtitle:
                          'Create your account and start your journey.',
                        ),
                      ),
                    ),
                    // SIGNUP CARd
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(
                        20,
                        20,
                        20,
                        18,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.95),
                        borderRadius: BorderRadius.circular(28),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 25,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          // NAME
                          const AuthField(
                            hint: 'Full name',
                            icon: Icons.person_outline_rounded,
                          ),

                          const SizedBox(height: 10),

                          // EMAIL
                          const AuthField(
                            hint: 'Email address',
                            icon: Icons.email_outlined,
                          ),

                          const SizedBox(height: 10),

                          // PASSWORD
                          AuthField(
                            hint: 'Create password',
                            icon: Icons.lock_outline_rounded,
                            obscureText: hidePassword,
                            showSuffix: true,
                            onSuffixTap: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                          ),

                          const SizedBox(height: 12),

                          // TERMS
                          Row(
                            children: [
                              SizedBox(
                                height: 22,
                                width: 22,
                                child: Checkbox(
                                  value: agreeTerms,
                                  activeColor: AppColors.primary,
                                  onChanged: (value) {
                                    setState(() {
                                      agreeTerms = value ?? false;
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(5),
                                  ),
                                ),
                              ),

                              const SizedBox(width: 8),

                              const Expanded(
                                child: Text.rich(
                                  TextSpan(
                                    text: 'I agree to the ',
                                    style: TextStyle(
                                      color: AppColors.grey,
                                      fontSize: 11,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: 'Terms & Conditions',
                                        style: TextStyle(
                                          color: AppColors.primary,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 14),

                          // CREATE ACCOUNT
                          PrimaryButton(
                            text: 'Create Account',
                            onPressed: () {
                              if (!agreeTerms) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Please agree to the Terms & Conditions.',
                                    ),
                                  ),
                                );
                                return;
                              }

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Account created successfully!',
                                  ),
                                ),
                              );
                            },
                          ),

                          const SizedBox(height: 14),

                          // DIVIDER
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Colors.grey.withOpacity(0.3),
                                ),
                              ),

                              const Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Text(
                                  'OR',
                                  style: TextStyle(
                                    color: AppColors.grey,
                                    fontSize: 10,
                                  ),
                                ),
                              ),

                              Expanded(
                                child: Divider(
                                  color: Colors.grey.withOpacity(0.3),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 13),

                          // SOCIAL BUTTONS
                          Row(
                            children: const [
                            SocialButton(
                                    icon: Icons.g_mobiledata,
                                text: 'Google',
                              ),

                              SizedBox(width: 10),

                              SocialButton(
                                icon: Icons.apple,
                                text: 'Apple',
                              ),
                            ],
                          ),

                          const SizedBox(height: 14),

                          // LOGIN
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                  const LoginScreen(),
                                ),
                              );
                            },
                            child: const Text.rich(
                              TextSpan(
                                text: 'Already have an account? ',
                                style: TextStyle(
                                  color: AppColors.grey,
                                  fontSize: 11,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Sign In',
                                    style: TextStyle(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../Core/app_color.dart';
import '../widgets/auth_background.dart';
import '../widgets/auth_filed.dart';
import '../widgets/auth_header.dart';
import '../widgets/primary_button.dart';
import '../widgets/social_button.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: AuthBackground(
      
        imagePath: 'assets/images/fg.jpeg',

        child: SafeArea(
          child: SizedBox(
            height: size.height,
            width: size.width,

            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
              ),

              child: Column(
                children: [

                  
                  const Expanded(
                    flex: 4,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: AuthHeader(
                        title: 'Welcome\nBack 👋',
                        subtitle:
                        'Sign in to continue your journey.',
                      ),
                    ),
                  ),

                  // BOTTOM CARD
                  Expanded(
                    flex: 6,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(
                        20,
                        22,
                        20,
                        18,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.94),
                        borderRadius:
                        BorderRadius.circular(30),
                      ),
                      child: Column(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: [

                          const AuthField(
                            hint: 'Email address',
                            icon: Icons.email_outlined,
                          ),

                          const SizedBox(height: 12),

                          AuthField(
                            hint: 'Password',
                            icon: Icons.lock_outline_rounded,
                            obscureText: hidePassword,
                            showSuffix: true,
                            onSuffixTap: () {
                              setState(() {
                                hidePassword =
                                !hidePassword;
                              });
                            },
                          ),

                          const SizedBox(height: 8),

                          Align(
                            alignment:
                            Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Forgot password?',
                                style: TextStyle(
                                  color:
                                  AppColors.primary,
                                  fontSize: 12,
                                  fontWeight:
                                  FontWeight.w600,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 4),

                          PrimaryButton(
                            text: 'Sign In',
                            onPressed: () {},
                          ),

                          const SizedBox(height: 17),

                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Colors.grey
                                      .withOpacity(0.25),
                                ),
                              ),
                              const Padding(
                                padding:
                                EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Text(
                                  'OR',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color:
                                    AppColors.grey,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Colors.grey
                                      .withOpacity(0.25),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 15),

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

                          const SizedBox(height: 15),

                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                  const SignupScreen(),
                                ),
                              );
                            },
                            child: const Text.rich(
                              TextSpan(
                                text:
                                "Don't have an account? ",
                                style: TextStyle(
                                  color: AppColors.grey,
                                  fontSize: 12,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Create one',
                                    style: TextStyle(
                                      color:
                                      AppColors.primary,
                                      fontWeight:
                                      FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

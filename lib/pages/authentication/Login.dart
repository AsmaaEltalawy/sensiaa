import 'package:flutter/material.dart';
import '../../utils/styles.dart';
import '../../components/app_logo.dart';
import 'signup.dart';
import '../home.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          /// ---------------- HEADER GRADIENT ----------------
          Container(
            height: 280,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: kHeaderGradient,
            ),
          ),

          /// ---------------- FORM CARD ----------------
          Center(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(32),
                margin: EdgeInsets.fromLTRB(40, kCardTopMargin, 40, 20),
                decoration: BoxDecoration(
                  color: kCardBackgroundColor,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: kCardShadowColor,
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// ICON (Leaf)
                    const AppLogo(padding: 8, iconSize: 36, bgColor: Colors.transparent),

                    const SizedBox(height: 10),
                    const Text(
                      "Welcome Back",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Sign in to continue your wellness journey",
                      style: TextStyle(color: kTextGrey),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 30),

                    /// EMAIL
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Email",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "your.email@example.com",
                        prefixIcon: const Icon(Icons.email_outlined, color: kIconGrey),
                        filled: true,
                        fillColor: kFillGrey,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// PASSWORD
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Password",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter your password",
                        prefixIcon: const Icon(Icons.lock_clock_rounded,color: kIconGrey,),
                        suffixIcon: const Icon(Icons.visibility_outlined,color: kIconGrey,),
                        filled: true,
                        fillColor: kFillGrey,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(color: kBlueAccentColor),
                        ),
                      ),
                    ),

                    /// SIGN IN BUTTON
                    Container(
                      width: double.infinity,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        gradient: kPrimaryButtonGradient,
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigate to Home screen after sign in
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => const HomeScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kTransparentColor,
                          shadowColor: kTransparentColor,
                        ),
                        child: const Text(
                          "Sign In",
                          style: TextStyle(fontSize: 16, color: kButtonTextColor),
                        ),
                      ),
                    ),

                    const SizedBox(height: 22),

                    /// DIVIDER
                    Row(
                      children: [
                        Expanded(child: Divider(color: kDividerGrey)),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text("Or continue with"),
                        ),
                        Expanded(child: Divider(color: kDividerGrey)),
                      ],
                    ),

                    const SizedBox(height: 20),

                    /// GOOGLE BUTTON
                    Container(
                      width: double.infinity,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: kDividerGrey),
                      ),
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: Image.network(
                          "https://cdn-icons-png.flaticon.com/512/2991/2991148.png",
                          width: 22,
                        ),
                        label: const Text(
                          "Continue with Google",
                          style: TextStyle(fontSize: 16, color: kGoogleTextColor),
                        ),
                      ),
                    ),

                    const SizedBox(height: 22),

                    /// SIGN UP
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const SignUp()),
                            );
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              color: kBlueAccentColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
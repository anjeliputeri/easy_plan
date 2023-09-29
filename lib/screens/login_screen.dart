import '../constants/colors.dart';
import 'package:easy_plan/screens/home.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final passwordFocusNode = FocusNode();
  bool _obscured = true;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if(passwordFocusNode.hasPrimaryFocus) return;
      passwordFocusNode.canRequestFocus = false;
    });
  }

  @override
  void dispose() {
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      body: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 100, left: 16),
            child: const Text('Welcome back! Glad\nto see you, Again!',
            style: TextStyle(fontSize: 30,
            fontWeight: FontWeight.bold,
            color: tdBlue))
          ),
          Container(
            margin: const EdgeInsets.only(top: 32),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: const TextField(
              autocorrect: true,
              decoration: InputDecoration(
                hintText: 'Enter your email',
                hintStyle: TextStyle(color: Color(0xff8391A1)),
                filled: true,
                fillColor: Color(0xffF7F8F9),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Color(0xffE8ECF4), width: 1)
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: tdBlue, width: 2)
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 16),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              keyboardType: TextInputType.visiblePassword,
              focusNode: passwordFocusNode,
              autocorrect: true,
              obscureText: _obscured,
              obscuringCharacter: '*',
              decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  hintText: 'Enter your password',
                  hintStyle: const TextStyle(color: Color(0xff8391A1)),
                  filled: true,
                  fillColor: const Color(0xffF7F8F9),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(color: Color(0xffE8ECF4), width: 1)
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(color: tdBlue, width: 2)
                  ),
                suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 4),
                child: GestureDetector(
                  onTap: _toggleObscured,
                  child: Icon(
                    _obscured
                    ? Icons.visibility_off_rounded : Icons.visibility_rounded,
                    size: 24,
                    color: tdBGColor,
                  ),
                ),)
              ),
            ),
          ),
          Container(
            height: 50,
            margin: const EdgeInsets.only(top: 62),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return const Home();
                }));
              },
              style: ElevatedButton.styleFrom(
                primary: tdBlue,
                onPrimary: tdBGColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400
                )
              ),
                child: const Text('Login'),
            ),
          ),
        ],
      ),
      ),
    );
  }
}

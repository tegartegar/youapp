import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:profile/register.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:profile/profilepage.dart';

class Login extends StatefulWidget {
  const Login({super.key, required String title});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    usernameController.addListener(_validateInputs);
    passwordController.addListener(_validateInputs);
  }

  void _validateInputs() {
    setState(() {
      isButtonEnabled = usernameController.text.isNotEmpty &&
          passwordController.text.isNotEmpty;
    });
  }

  Future<void> login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedUsername = prefs.getString('username');
    String? storedPassword = prefs.getString('password');

    bool isValidUser = storedUsername == usernameController.text &&
      storedPassword == passwordController.text;

      if (!mounted) return;

    if (storedUsername == usernameController.text &&
        storedPassword == passwordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login Successful!")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid credentials!")),
      );

if(isValidUser) {
  Navigator.pushReplacement(context, 
  MaterialPageRoute(builder: (context) => const ProfilePage(title: '', usernameController: '',)),);
}

    }
  }

@override
void dispose() {
usernameController.dispose();
passwordController.dispose();
super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xff1F4247),
            Color(0xff0D1D23),
            Color(0xff09141A),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _page(),
      ),
    );
  }

  Widget _page() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )),
              ),
              DefaultTextStyle.merge(
                style: const TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Login'),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              _inputField("Enter Username/Email", usernameController),
              const SizedBox(height: 20),
              _inputField("Enter Password", passwordController,
                  isPassword: true),
              const SizedBox(height: 50),
              _loginBtn(isButtonEnabled),
              const SizedBox(
                height: 20,
              ),
              _extraText(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputField(String hintText, TextEditingController controller,
      {bool isPassword = false}) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(9),
      borderSide: const BorderSide(color: Color(0x0DFFFFFF)),
    );
    return TextField(
      style: const TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0x66FFFFFF)),
        enabledBorder: border,
        focusedBorder: border,
        suffixIcon: isPassword
            ? IconButton(
                icon: const Icon(
                  Icons.visibility_off,
                  color: Colors.white70,
                ),
                onPressed: () {
                  setState(() {
                    isPassword = !isPassword;
                  });
                },
              )
            : null,
      ),
      obscureText: isPassword,
    );
  }

  Widget _loginBtn(bool isButtonEnabled) {
    return ElevatedButton(
      onPressed: isButtonEnabled
          ? () {
              debugPrint("Username : ${usernameController.text}");
              debugPrint("Password : ${passwordController.text}");

               Navigator.pushReplacement(context, //navigate move to login page
              MaterialPageRoute(builder: (context) => ProfilePage(title: 'login complete', usernameController: '',)));

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Login confirmed!")),);
            }
          : null,
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        ),
        elevation: WidgetStateProperty.all(0),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
        ),
        backgroundColor: WidgetStateProperty.resolveWith<Color?>(
          (states) {
            if (states.contains(WidgetState.disabled)) {
              return null; // Use the gradient instead
            }
            return null;
          },
        ),
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isButtonEnabled
                ? [const Color(0xff4db8ff), const Color(0xff006aff)]
                : [
                    const Color(0xff4db8ff).withOpacity(0.5),
                    const Color(0xff006aff).withOpacity(0.5)
                  ],
            begin: Alignment.center,
            end: Alignment.center,
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Container(
          constraints: const BoxConstraints(minWidth: 88.0, minHeight: 50.0),
          alignment: Alignment.center,
          child: Text(
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: isButtonEnabled
                  ? Colors.white
                  : Colors.white.withOpacity(0.7),
            ),
          ),
        ),
      ),
    );
  }

  Widget _extraText() {
    TextStyle defaultStyle =
        const TextStyle(color: Colors.grey, fontSize: 20.0);
    TextStyle linkStyle = const TextStyle(color: Colors.blue);
    return RichText(
        text: TextSpan(style: defaultStyle, children: <TextSpan>[
      const TextSpan(text: 'No Account?'),
      TextSpan(
          text: 'Register Here',
          style: linkStyle,
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Register(),
                  ));
              if (kDebugMode) {
                print('Register Here');
              }
            }),
    ]));
  }
}

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController pwdTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(42.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/fastcampus_logo.png'),
              const Text(
                '배부른 민족',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 42),
              ),
              const SizedBox(height: 64),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailTextController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'email',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '이메일 주소를 입력해주세요.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      controller: pwdTextController,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'password',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '비밀번호를 입력해주세요.';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              MaterialButton(
                onPressed: () {},
                height: 48,
                minWidth: double.infinity,
                color: Colors.red,
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              TextButton(onPressed: () {}, child: const Text('계정이 없나요? 회원가입')),
              const Divider(),
              Image.asset('assets/btn_google_signin.png'),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:behboolun_meenjoke/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController pwdTextController = TextEditingController();

  Future<UserCredential?> signIn(String email, String password) async {
    try {
      final credentail = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      userCredential = credentail;

      return credentail;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // logic
      } else if (e.code == 'wrong-password') {
        // logic
      }
    } catch (e) {
      // logic
    }
    return null;
  }

  Future<UserCredential?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

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
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    final result = await signIn(
                      emailTextController.text.trim(),
                      pwdTextController.text.trim(),
                    );

                    if (!context.mounted) return;

                    if (result == null) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(const SnackBar(content: Text('로그인 실패')));
                      return;
                    }

                    context.go('/');
                  }
                },
                height: 48,
                minWidth: double.infinity,
                color: Colors.red,
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              TextButton(
                onPressed: () => context.push('/sign-up'),
                child: const Text('계정이 없나요? 회원가입'),
              ),
              const Divider(),
              InkWell(
                onTap: () async {
                  final userCredeit = await signInWithGoogle();

                  if (userCredeit == null) return;

                  if (context.mounted) context.go('/');
                },
                child: Image.asset('assets/btn_google_signin.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

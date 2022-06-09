import 'package:flutter/material.dart';
import 'package:purehours/utils/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../utils/auth.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLoading = false;
  var authHandler = Auth();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    double height = queryData.size.height;
    double heightGrid = height / 100;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pure Hours"),
      ),
      body: isLoading
          ? const Loading()
          : Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/back.jpg'),
                fit: BoxFit.cover,
              )),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top: heightGrid * 20),
                  child: SizedBox(
                    width: double.infinity,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50)),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Center(
                              child: Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                fontSize: 46,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 90, 16, 16),
                            child: TextField(
                              controller: _usernameController,
                              decoration: const InputDecoration(
                                hintText: 'Username',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
                            child: TextField(
                              obscureText: true,
                              controller: _passwordController,
                              decoration: const InputDecoration(
                                hintText: 'password',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: ElevatedButton(
                              onPressed: () {
                                if (_passwordController.text.trim() != '' ||
                                    _usernameController.text.trim() != '') {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  authHandler
                                      .handleSignInEmail(
                                          _usernameController.text.trim(),
                                          _passwordController.text.trim())
                                      .then((User user) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    Navigator.of(context)
                                        .pushReplacementNamed('/homescreen');
                                  }).catchError((e) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text("${e.code}"),
                                    ));
                                  });
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              "Please Fill The Fields Above")));
                                }
                              },
                              child: const Text("Sign In"),
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size(250, 70),
                                shadowColor: Colors.deepPurple[800],
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}

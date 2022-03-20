import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    double height = queryData.size.height;
    double heightGrid = height / 100;
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _usernameController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pure Hours"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
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
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 46,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 90, 16, 16),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          controller: _usernameController,
                          decoration: const InputDecoration(
                            hintText: 'Username',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          controller: _passwordController,
                          decoration: const InputDecoration(
                            hintText: 'Password',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            //! Uncomment this to enable form validation
                            // if (_formKey.currentState!.validate()) {
                            //! Validation Logic
                            Navigator.of(context)
                                .pushReplacementNamed('/homescreen');
                            // }
                          },
                          child: const Text("Sign Up"),
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
      ),
    );
  }
}

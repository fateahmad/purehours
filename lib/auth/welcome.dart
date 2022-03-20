import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double height = queryData.size.height;
    double heightGrid = height / 100;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pure Hours"),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/back.jpg'),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: EdgeInsets.only(top: heightGrid * 10),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 200),
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50)),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          const Center(
                              child: Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              "Welcome",
                              style: TextStyle(
                                fontSize: 46,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 90, 16, 16),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/login');
                              },
                              child: const Text("Sign In"),
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size(250, 70),
                                elevation: 8,
                                shadowColor: Colors.deepPurple[800],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('/signup');
                              },
                              child: const Text("Sign Up"),
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size(250, 70),
                                shadowColor: Colors.deepPurple[800],
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

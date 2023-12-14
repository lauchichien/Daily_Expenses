import 'package:flutter/material.dart';
import 'dailyexpenses.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MaterialApp(
    home: LoginScreen(),
  ));
}


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ipAddressController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Login Screen"),
      ),
      body:
      SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: "https://w7.pngwing.com/pngs/978/821/"
                        "png-transparent-money-finance-wallet-payment-daily"
                        "-expenses-saving-service-personal-finance.png"),

              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    labelText: "Username",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: "Password",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: ipAddressController,
                  decoration: InputDecoration(
                    labelText: "REST API address",
                  ),),
              ),
              ElevatedButton(
                  onPressed: () async{
                    String username = usernameController.text;
                    String password = passwordController.text;
                    if(username == 'test' && password == '123'){
                      final prefs = await SharedPreferences.getInstance();
                      String ip = ipAddressController.text;
                      await prefs.setString("ip", ip);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context)=> DailyExpenseApp(username: username),
                        ),
                      );

                    }
                    else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Login Failed'),
                              content: const Text('Invalid username or password.'),
                              actions: [
                                TextButton(
                                    child: const Text('OK'),
                                    onPressed: (){
                                      Navigator.pop(context);
                                    }
                                )
                              ],
                            );
                          }
                      );
                    }
                  },
                  child: Text("Login")
              ),

            ],
          ),

        ),
      ),

    );
  }
}
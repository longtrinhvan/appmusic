import 'package:appmusic/model/account.dart';
import 'package:flutter/material.dart';
import 'registration_page.dart';
import 'home_page.dart';
import 'package:http/http.dart' as http;
import 'package:awesome_dialog/awesome_dialog.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/image/loginicon.png'),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.name,
      autofocus: false,
      controller: usernameController,
      //initialValue: 'longtrinhvan97@gmail.com',
      decoration: InputDecoration(
        hintText: 'Username',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        // ignore: deprecated_member_use
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            image: DecorationImage(
              image: AssetImage("assets/image/background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          // ignore: deprecated_member_use
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            onPressed: () {
              if (usernameController.text == "" ||
                  passwordController.text == "") {
                print("nhập thiếu dữ liệu");
                AwesomeDialog(
                  context: context,
                  headerAnimationLoop: false,
                  dialogType: DialogType.WARNING,
                  title: 'Error',
                  dialogBackgroundColor: Colors.white,
                  desc: 'Missing input',
                ).show();
                return null;
              }

              fetchAccount(http.Client(), usernameController.text,
                      passwordController.text)
                  .then((value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                          settings: RouteSettings(
                            arguments: value,
                          ),
                        ),
                      ))
                  .onError((error, stackTrace) => AwesomeDialog(
                        context: context,
                        headerAnimationLoop: false,
                        dialogType: DialogType.WARNING,
                        title: 'Error',
                        dialogBackgroundColor: Colors.white,
                        desc: 'Error login',
                      ).show());
              return null;
            },
            padding: EdgeInsets.all(12),
            color: Colors.transparent,
            child: Text('Log In',
                style: TextStyle(color: Colors.white, fontSize: 17)),
          ),
        ));

    // ignore: deprecated_member_use
    final forgotLabel = FlatButton(
      child: Text(
        'Registration?',
        style: TextStyle(color: Colors.black54, fontSize: 17),
      ),
      onPressed: () {
        Navigator.push(context,
            new MaterialPageRoute(builder: (context) => new Registration()));
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 10.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
            forgotLabel,
          ],
        ),
      ),
    );
  }
}

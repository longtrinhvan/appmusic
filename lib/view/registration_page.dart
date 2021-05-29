import 'package:appmusic/model/account.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'login_page.dart';

class Registration extends StatefulWidget {
  static String tag = 'registration-page';

  @override
  _RegistrationPageState createState() => new _RegistrationPageState();
}

class _RegistrationPageState extends State<Registration> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController checknameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'registrationPageState',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/image/createAccount.png'),
      ),
    );

    final name = TextFormField(
      keyboardType: TextInputType.name,
      autofocus: false,
      controller: usernameController,
      decoration: InputDecoration(
        hintText: 'Username',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final fullname = TextFormField(
      keyboardType: TextInputType.name,
      autofocus: false,
      controller: fullnameController,
      decoration: InputDecoration(
        hintText: 'Fullname',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: passwordController,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
    final checkpassword = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: checknameController,
      decoration: InputDecoration(
        hintText: 'Enter the password again',
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
              image: AssetImage("assets/image/btncreateAccount.png"),
              fit: BoxFit.cover,
            ),
          ),
          // ignore: deprecated_member_use
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            onPressed: () {
              fetchRegister(http.Client(), usernameController.text,fullnameController.text,
                      passwordController.text)
                  .then((value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                          settings: RouteSettings(
                            arguments: value,
                          ),
                        ),
                      ))
                  .onError((error, stackTrace) => null);
            },
            padding: EdgeInsets.all(12),
            color: Colors.transparent,
            child: Text('Create Account',
                style: TextStyle(color: Colors.white, fontSize: 17)),
          ),
        ));

    // ignore: deprecated_member_use
    final forgotLabel = FlatButton(
      child: Text(
        'Login now?',
        style: TextStyle(color: Colors.black54, fontSize: 17),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(LoginPage.tag);
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
            name,
            SizedBox(height: 10.0),
            fullname,
            SizedBox(height: 10.0),
            password,
            SizedBox(height: 10.0),
            checkpassword,
            SizedBox(height: 24.0),
            loginButton,
            forgotLabel
          ],
        ),
      ),
    );
  }
}

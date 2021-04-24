import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../model/music.dart';
import 'music_page.dart';
import 'login_page.dart';
import 'search_page.dart';

class HomePage extends StatefulWidget {
  static String tag = 'home-page';

  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final Shader linearGradient = LinearGradient(colors: <Color>[
    Colors.white,
    Colors.white,
    Colors.white70,
    Colors.white,
  ]).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
          flexibleSpace: Image(
            image: AssetImage('assets/image/background.jpg'),
            fit: BoxFit.cover,
          ),
          backgroundColor: Colors.transparent,
          title: Text(" ",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 20)),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search, color: Colors.white),
                iconSize: 35,
                onPressed: () {
                  showSearch(context: context, delegate: Search(musics));
                })
          ],
          leading: new IconButton(
            icon: new Icon(Icons.home),
            iconSize: 30,
            color: Colors.white,
            onPressed: () => _scaffoldKey.currentState.openDrawer(),
          )),
      body: BodyScreen(),
      drawer: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Trịnh Văn Long",
                  style: TextStyle(
                      color: Colors.indigo[400],
                      fontWeight: FontWeight.w600,
                      fontSize: 16)),
              accountEmail: new Text("longtrinhvan97@gmail.com",
                  style: TextStyle(
                      color: Colors.indigo[400],
                      fontWeight: FontWeight.w600,
                      fontSize: 16)),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new ExactAssetImage('assets/image/banner.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              currentAccountPicture: new ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image.asset('assets/image/account.jpg'),
              ),
            ),
            new ListTile(
                leading: Icon(Icons.shopping_cart, color: Colors.white70),
                title: new Text("My Music",
                    style: TextStyle(
                        fontSize: 17,
                        foreground: Paint()..shader = linearGradient)),
                onTap: () {
                  Navigator.of(context).pushNamed(MyMusicApp.tag);
                }),
            new ListTile(
                leading: Icon(Icons.settings, color: Colors.white70),
                title: new Text("Settings",
                    style: TextStyle(
                        fontSize: 17,
                        foreground: Paint()..shader = linearGradient)),
                onTap: () {
                  Navigator.pop(context);
                }),
            new ListTile(
                leading: Icon(Icons.info, color: Colors.white70),
                title: new Text("About",
                    style: TextStyle(
                        fontSize: 17,
                        foreground: Paint()..shader = linearGradient)),
                onTap: () {
                  Navigator.pop(context);
                }),
            new ListTile(
                leading: Icon(Icons.power_settings_new, color: Colors.white70),
                title: new Text("Logout",
                    style: TextStyle(
                        fontSize: 17,
                        foreground: Paint()..shader = linearGradient)),
                onTap: () {
                  Navigator.of(context).pushNamed(LoginPage.tag);
                }),
          ],
        ),
      ),
    );
  }
}

//ignore: must_be_immutable
class BodyScreen extends StatelessWidget {
  final List<Music> music;

  BodyScreen({Key key, this.music}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = LinearGradient(colors: <Color>[
      Colors.white,
      Colors.white,
      Colors.white70,
      Colors.white,
    ]).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/image/background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView.builder(
            itemCount: musics.length,
            itemBuilder: (context, index) {
              return ListTile(
                contentPadding: new EdgeInsets.fromLTRB(10, 5, 0, 0),
                title: Text(
                  musics[index].title,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      foreground: Paint()..shader = linearGradient),
                ),
                // When a user taps the ListTile, navigate to the DetailScreen.
                // Notice that you're not only creating a DetailScreen, you're
                // also passing the current todo through to it.
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyMusicApp(),
                      // Pass the arguments as part of the RouteSettings. The
                      // DetailScreen reads the arguments from these settings.
                      settings: RouteSettings(
                        arguments: musics[index],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

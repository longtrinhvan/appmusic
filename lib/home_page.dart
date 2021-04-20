import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'model/music.dart';
import 'music_page.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  static String tag = 'home-page';

  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
          title: Text("",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 20)),
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
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Trịnh Văn Long",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 16)),
              accountEmail: new Text("longtrinhvan97@gmail.com",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 16)),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new ExactAssetImage('assets/banner.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              currentAccountPicture: new ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image.asset('assets/account.jpg'),
              ),
            ),
            new ListTile(
                leading: Icon(Icons.shopping_cart),
                title: new Text("My Music"),
                onTap: () {
                  Navigator.of(context).pushNamed(MyMusicApp.tag);
                }),
            new ListTile(
                leading: Icon(Icons.settings),
                title: new Text("Settings"),
                onTap: () {
                  Navigator.pop(context);
                }),
            new ListTile(
                leading: Icon(Icons.info),
                title: new Text("About"),
                onTap: () {
                  Navigator.pop(context);
                }),
            new ListTile(
                leading: Icon(Icons.power_settings_new),
                title: new Text("Logout"),
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
  var musics = [
    Music('CÓ CHẮC YÊU LÀ ĐÂY', 'WaitingForLove.mp3'),
    Music('Waiting For Love', 'WaitingForLove.mp3'),
    Music('Em của ngày hôm qua', 'Em Cua Ngay Hom Qua.mp3'),
    Music('Way Back Home', 'WaitingForLove.mp3'),
    Music('Something Just Like This', 'WaitingForLove.mp3'),
    Music('Phao - 2 Phut Hon', 'WaitingForLove.mp3'),
    Music('XIN ĐỪNG NHẤC MÁY', 'WaitingForLove.mp3'),
    Music('Exs Hate Me - B Ray x Masew ', 'WaitingForLove.mp3'),
    Music('Lời Yêu Ngây Dại - Kha', 'WaitingForLove.mp3'),
    Music('NGƯỜI CÓ THƯƠNG', 'WaitingForLove.mp3'),
    Music('Có Tất Cả Nhưng Thiếu Anh', 'WaitingForLove.mp3'),
    Music("If It" + "'" + "s Me - The Men Band", 'WaitingForLove.mp3'),
    Music('Em Luôn Ở Trong Tâm Trí Anh', 'WaitingForLove.mp3'),
    Music('Mot Buoc Yeu, Van Dam Dau', 'WaitingForLove.mp3')
  ];
  final List<Music> music;

  BodyScreen({Key key, @required this.music}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: musics.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(musics[index].title,
                style: TextStyle(color: Colors.lightBlue, fontSize: 17)),
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
    );
  }
}
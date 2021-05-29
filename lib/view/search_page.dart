import 'package:flutter/material.dart';
import '../model/musics.dart';
import 'player_page.dart';

class Search extends SearchDelegate<String> {
  final List<Music> musics;

  Search(this.musics);

  @override
  List<Widget> buildActions(BuildContext context) {
    //Actions for app bar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //leading icon on the left of the app bar
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some result based on the selection
    final suggestionList = musics;

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        title: Text(
          musics[index].name,
          style: TextStyle(
            fontSize: 17,
          ),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something

    final suggestionList = query.isEmpty
        ? musics
        : musics
            .where((p) => p.name.contains(RegExp(query, caseSensitive: false)))
            .toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Player(),
              settings: RouteSettings(
                arguments: suggestionList[index],
              ),
            ),
          );
        },
        title: RichText(
          text: TextSpan(
              text: suggestionList[index].name.substring(0, query.length),
              style: TextStyle(fontSize: 14, color: Colors.black38),
              children: [
                TextSpan(
                    text: suggestionList[index].name.substring(query.length),
                    style: TextStyle(fontSize: 14, color: Colors.black38)),
              ]),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}

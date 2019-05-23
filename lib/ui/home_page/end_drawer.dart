import 'package:flutter/material.dart';

class InterestedUsersDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        // Icon(FontAwesomeIcons.vectorSquare, size: 86),
        child: Scaffold(
      appBar: AppBar(title: Text("Random Event 1")),
      body: ListView.builder(
        itemBuilder: (_, index) => ListTile(
          title: Text("Random User #$index"),
          subtitle: Text("Marked 10 minutes ago"),
          leading: CircleAvatar(
            child: Text("UA"),
          ),
          onTap: () {},
        ),
      ),
    ));
  }
}

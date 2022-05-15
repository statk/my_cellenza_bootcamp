import 'package:flutter/material.dart';

// region BigHeader
class BigHeader extends StatelessWidget {
  final String? _avatarTitle;
  const BigHeader({Key? key, String? avatarTitle})
      : _avatarTitle = avatarTitle,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(50)),
        color: Color.fromRGBO(101, 147, 231, 1),
      ),
      child: Stack(children: [
        _avatarTitle != null
            ? Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(320, 50, 20, 20),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(_avatarTitle!),
                  ),
                ),
              ])
            : Container(),
        Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: Container(
            width: 300,
            height: 100,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50), topRight: Radius.circular(50), topLeft: Radius.circular(50)),
              color: Colors.white,
            ),
            child: const Center(
              child: Text(
                'My Cellenza',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(101, 147, 231, 1),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
// endregion

// region AppBar
class AppBarHeader {
  AppBar createAppBar(BuildContext context, String title) {
    return AppBar(
      elevation: 10,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(50))),
      toolbarHeight: 72,
      shadowColor: Colors.black,
      backgroundColor: const Color.fromRGBO(101, 147, 231, 1),
      title: Text(title),
    );
  }
}
// endregion

import 'package:flutter/material.dart';

class Folder {
  String name;
  Icon icon;

  Folder({required this.name, required this.icon});
}

class Utils {
  static List<Folder> getMockedFolders() {
    return [
      Folder(name: 'CN', icon: Icon(Icons.folder)),
      Folder(name: 'ADBMS', icon: Icon(Icons.folder)),
      Folder(name: 'OSSS', icon: Icon(Icons.folder)),
      Folder(name: 'SE', icon: Icon(Icons.folder)),
      Folder(name: 'MERN', icon: Icon(Icons.folder)),
      Folder(name: 'FLUTTER', icon: Icon(Icons.folder)),
    ];
  }
}

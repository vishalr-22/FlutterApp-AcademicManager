import 'package:flutter/material.dart';

import 'package:acadmt/folder_help/folder_list.dart';

class Utils {
  static List<Folder> getMockedFolders() {
    return [
      Folder(name: 'CN', icon: Icon(Icons.folder)),
      Folder(name: 'ADBMS', icon: Icon(Icons.folder)),
      Folder(name: 'OSSS', icon: Icon(Icons.folder)),
      Folder(name: 'SE', icon: Icon(Icons.folder)),
      Folder(name: 'MERN', icon: Icon(Icons.folder)),
      Folder(name: 'FLUTTER', icon: Icon(Icons.folder)),
      Folder(name: 'SC', icon: Icon(Icons.folder)),
    ];
  }
}

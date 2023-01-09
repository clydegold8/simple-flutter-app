import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// this will serve as the interface or the type of whitelist
class WhiteListItem {
  String name;
  bool isOn;

  WhiteListItem(this.name, {this.isOn = true});
}

// this will handle the actions of the lists
class WhitelistNotifier extends ChangeNotifier {
  // TODO: this will be replaced with actual data in the future
  final List<WhiteListItem> whitelists = [
    WhiteListItem('Whitelist 1'),
    WhiteListItem('Whitelist 2'),
    WhiteListItem('Whitelist 3'),
  ];

  void addWhiteList(WhiteListItem whitelist) {
    whitelists.insert(0, whitelist);
    notifyListeners();
  }

  void toggleSwitch(int index, bool value) {
    whitelists[index].isOn = value;
    notifyListeners();
  }
}

// this will provides the lists of whitelists
final whiteListListProvider = ChangeNotifierProvider<WhitelistNotifier>((ref) {
  return WhitelistNotifier();
});

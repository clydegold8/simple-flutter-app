import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// this will serve as the interface or the type of whitelist
class WhiteListItem {
  String name;
  bool isOn;
  bool isSelected;

  WhiteListItem(this.name, {this.isOn = true, this.isSelected = false});
}

// this will handle the actions of the lists
class WhitelistNotifier extends ChangeNotifier {
  // TODO: this will be replaced with actual data in the future
  List<WhiteListItem> whitelists = [
    WhiteListItem('Whitelist 1'),
    WhiteListItem('Whitelist 2'),
    WhiteListItem('Whitelist 3'),
    WhiteListItem('Whitelist 4'),
    WhiteListItem('Whitelist 5'),
    WhiteListItem('Whitelist 6'),
    WhiteListItem('Whitelist 7'),
    WhiteListItem('Whitelist 8'),
    WhiteListItem('Whitelist 9'),
    WhiteListItem('Whitelist 10'),
  ];

  void addWhiteList(WhiteListItem whitelist) {
    whitelists.insert(0, whitelist);
    notifyListeners();
  }

  void toggleSwitch(int index, bool value) {
    whitelists[index].isOn = value;
    notifyListeners();
  }

  void toggleCheckbox(int index, bool value) {
    whitelists[index].isSelected = value;
    notifyListeners();
  }

  void resetList(){
    for (var element in whitelists) {element.isSelected = false; element.isOn = true;}
    notifyListeners();
  }

  deleteWhiteLists() {
    whitelists =
        whitelists.where((element) => element.isSelected != true).toList();
    notifyListeners();
  }
}

// this will provides the lists of whitelists
final whiteListListProvider = ChangeNotifierProvider<WhitelistNotifier>((ref) {
  return WhitelistNotifier();
});

final whiteListDeleteSnackBarShownProvider = StateProvider((ref) => false);

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// this will serve as the interface or the type of whitelist
class BlackListItem {
  String name;
  bool isOn;
  bool isSelected;

  BlackListItem(this.name, {this.isOn = true, this.isSelected = false});
}

// this will handle the actions of the lists
class BlackListItemNotifier extends ChangeNotifier {
  // TODO: this will be replaced with actual data in the future
  List<BlackListItem> blacklists = [
    BlackListItem('Blacklist 1'),
    BlackListItem('Blacklist 2'),
    BlackListItem('Blacklist 3'),
  ];

  void addBlackList(BlackListItem blacklist) {
    blacklists.insert(0, blacklist);
    notifyListeners();
  }

  void toggleSwitch(int index, bool value) {
    blacklists[index].isOn = value;
    notifyListeners();
  }

  void toggleCheckbox(int index, bool value) {
    blacklists[index].isSelected = value;
    notifyListeners();
  }

  deleteBlackLists() {
    blacklists =
        blacklists.where((element) => element.isSelected != true).toList();
    notifyListeners();
  }
}

// this will provides the lists of whitelists
final blackListProvider = ChangeNotifierProvider<BlackListItemNotifier>((ref) {
  return BlackListItemNotifier();
});

final blackListDeleteSnackBarShownProvider = StateProvider((ref) => false);

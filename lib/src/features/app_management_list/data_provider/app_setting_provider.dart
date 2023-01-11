import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppSettingItem {
  String name;
  bool isOn;
  String imgUrl;
  String dataUsage;
  bool httpsFilteringEnabled;
  bool firewallSettingEnabled;
  bool dataUsageLimitEnabled;
  bool dataTransmissionFeeEnabled;
  AppSettingItem(this.name, this.imgUrl, this.dataUsage,
      {this.isOn = true,
      this.httpsFilteringEnabled = false,
      this.firewallSettingEnabled = false,
      this.dataUsageLimitEnabled = false,
      this.dataTransmissionFeeEnabled = false});
}

class AppSettingItemNotifier extends ChangeNotifier {
  List<AppSettingItem> appItems = [
    AppSettingItem('グルメサイトアプリ', 'assets/images/app_sample_1.png', '80MB'),
    AppSettingItem('ショッピングアプリ', 'assets/images/app_sample_2.png', '70MB'),
    AppSettingItem('ショップアプリ', 'assets/images/app_sample_3.png', '60MB'),
    AppSettingItem('家計＿アプリ', 'assets/images/app_sample_4.png', '50MB'),
    AppSettingItem('レシピサイトアプリ', 'assets/images/app_sample_5.png', '40MB'),
    AppSettingItem('メモアプリ', 'assets/images/app_sample_6.png', '30MB'),
    AppSettingItem('ポイントサイトアプリ', 'assets/images/app_sample_7.png', '20MB'),
    AppSettingItem('チャットアプリ', 'assets/images/app_sample_8.png', '10MB'),
    AppSettingItem('音楽アプリ', 'assets/images/app_sample_9.png', '5MB'),
    AppSettingItem('カメラアプリ', 'assets/images/app_sample_10.png', '2MB'),
    AppSettingItem('アプリ', 'assets/images/app_sample_11.png', '200KB'),
  ];

  void toggleSwitch(int index, bool value) {
    appItems[index].isOn = value;
    notifyListeners();
  }

  void toggleHttpsFiltering(int index, bool value) {
    appItems[index].httpsFilteringEnabled = value;
    notifyListeners();
  }

  void toggleFirewallSetting(int index, bool value) {
    appItems[index].firewallSettingEnabled = value;
    notifyListeners();
  }

  void toggleDataUsageLimit(int index, bool value) {
    appItems[index].dataUsageLimitEnabled = value;
    notifyListeners();
  }

  void toggleDataTransmissionFee(int index, bool value) {
    appItems[index].dataTransmissionFeeEnabled = value;
    notifyListeners();
  }

  void toggleAllSwitches(bool newValue) {
    for (var i = 0; i < appItems.length; i++) {
      appItems[i].isOn = newValue;
    }
    notifyListeners();
  }

  void updateDataUsageLimit(int dataInGB) {
    // update data usage limit here
  }
}

final appSettingItemProvider =
    ChangeNotifierProvider<AppSettingItemNotifier>((ref) {
  return AppSettingItemNotifier();
});

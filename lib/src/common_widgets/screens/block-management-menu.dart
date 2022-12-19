import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../features/blacklist/presentation/blacklist.dart';

@WidgetbookUseCase(name: 'BlockManagementMenu', type: BlockManagementMenu)
Widget blockManagementUseCase(BuildContext context) => const BlockManagementMenu();

class BlockManagementMenu extends StatelessWidget {
  const BlockManagementMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Center(child: Text('ブロック管理')),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 2, color: Color(0xFFE0E0E0)))),
            child: const ListTile(
              title: Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text('ブラウザの管理')),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 2, color: Color(0xFFE0E0E0)))),
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Text('Whitelist Screen')),
                );
              },
              tileColor: const Color(0xFFFFFFFF),
              title: const Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Text('ホワイトリスト'),
              ),
              subtitle: const Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                child: Text('ブロックしたくないWebページを登録'),
              ),
              trailing: const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Icon(Icons.arrow_forward_ios)),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 2, color: Color(0xFFE0E0E0)))),
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BlackList()),
                );
              },
              tileColor: const Color(0xFFFFFFFF),
              title: const Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Text('ホワイトリスト'),
              ),
              subtitle: const Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                child: Text('ブロックしたいWebページを登録'),
              ),
              trailing: const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Icon(Icons.arrow_forward_ios)),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 2, color: Color(0xFFE0E0E0)))),
            child: const ListTile(
              title: Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text('アプリの管理')),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 2, color: Color(0xFFE0E0E0)))),
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const Text('App Management Screen')),
                );
              },
              tileColor: const Color(0xFFFFFFFF),
              title: const Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Text('アプリの細かい設定'),
              ),
              subtitle: const Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                child: Text('アプリことに広告ブロックを設定'),
              ),
              trailing: const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Icon(Icons.arrow_forward_ios)),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iron_log/home.dart';
import 'package:iron_log/rireki.dart';
import 'package:iron_log/set_ichiran.dart';
import 'package:iron_log/settei.dart';
import 'package:iron_log/shumoku_ichiran.dart';
import 'package:iron_log/shumoku_tsuika.dart';
import 'package:iron_log/syumoku_sentaku.dart';

final pageIndexProvider = StateProvider((ref) {
  return 1;
},);

class Root extends ConsumerWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final index = ref.watch(pageIndexProvider);

    // アイテム
    const items = [
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'ホーム',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: '履歴',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'セット一覧',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: '種目一覧',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: '種目追加',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: '種目選択',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: '設定',
      ),
    ];

    final bar = BottomNavigationBar(
      items: items,
      backgroundColor: Colors.blue, // todo : なぜか効かない
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.black,
      currentIndex: index,
      onTap: (index) {
        ref.read(pageIndexProvider.notifier).state = index;
      },
    );

    final pages = [
      Home(),
      Rireki(),
      SetIchiran(),
      ShumokuIchiran(),
      ShumokuTsuika(),
      SyumokuSentaku(),
      Settei(),
    ];
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: bar,
    );
  }
}

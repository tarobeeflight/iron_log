import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// 種目
class Syumoku {
  // 種目名
  final String syumokuMei;

  // 部位区分
  final String buiKbn;

  Syumoku(this.buiKbn, this.syumokuMei);
}

final List<Syumoku> chestModels = [
  Syumoku('胸', 'ベンチプレス'),
  Syumoku('胸', 'ダンベルプレス'),
];

final List<Syumoku> backModels = [
  Syumoku('背中', 'デッドリフト'),
  Syumoku('背中', 'ラットプルダウン'),
];

final List<Syumoku> legModels = [Syumoku('脚', 'スクワット')];

final List<Syumoku> shoulderModels = [
  Syumoku('肩', 'ショルダープレス'),
  Syumoku('肩', 'サイドレイズ'),
];

final List<Syumoku> armModels = [
  Syumoku('腕', 'バーベルカール'),
  Syumoku('腕', 'フレンチプレス'),
];

// モデル　→　ウィジェットに変換する
Widget modelToWidget(Syumoku model) {
  // modelを使って好きなWidgetを作る

  final metaText = Container(
    width: 50,
    height: 80,
    padding: EdgeInsets.all(10),
    child: Text(
      '${model.syumokuMei}',
      style: const TextStyle(color: Colors.black),
    ),
  );

  return Container(
    padding: EdgeInsets.all(1),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.blue),
      color: Colors.white,
    ),
    width: double.infinity,
    child: metaText,
  );
}

class SyumokuSentaku extends StatelessWidget {
  const SyumokuSentaku({super.key});

  @override
  Widget build(BuildContext context) {
    final chestList = ListView.builder(
      itemCount: chestModels.length,
      itemBuilder: (c, i) => modelToWidget(chestModels[i]),
    );

    final chestCon = Center(child: SizedBox(child: chestList));

    final sca = Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        title: const Text('種目選択'),
        actions: [ElevatedButton(onPressed: () {}, child: Text('編集'))],
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 500,
            padding: EdgeInsets.all(4),
            child: ListView.builder(
              itemCount: chestModels.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(2),
                  margin: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.blue, width: 2),
                  ),
                  height: 80,
                  child: Text(
                    chestModels[index].syumokuMei,
                    style: TextStyle(fontSize: 16),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
    return sca;
  }
}

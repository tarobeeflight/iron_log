import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'entity/shumoku.dart';

final List<Shumoku> chestModels = [
  Shumoku('bui_mune', '胸', 'shumoku_benchi', 'ベンチプレス'),
  Shumoku('bui_mune', '胸', 'shumoku_damberu', 'ダンベルプレス'),
  Shumoku('bui_mune', '胸', 'shumoku_peck', 'ペックフライ'),
];

final List<Shumoku> backModels = [
  Shumoku('bui_senaka', '背中', 'shumoku_lift', 'デッドリフト'),
  Shumoku('bui_senaka', '背中', 'shumoku_rat', 'ラットプルダウン'),
];

final List<Shumoku> legModels = [
  Shumoku('bui_ashi', '脚', 'shumoku_scwad', 'スクワット'),
];

final List<Shumoku> shoulderModels = [
  Shumoku('bui_kata', '肩', 'shumoku_sholder', 'ショルダープレス'),
  Shumoku('bui_kata', '肩', 'shumoku_side', 'サイドレイズ'),
];

final List<Shumoku> armModels = [
  Shumoku('bui_ude', '腕', 'shumoku_bervel', 'バーベルカール'),
  Shumoku('bui_ude', '腕', 'shumoku_flench', 'フレンチプレス'),
];

// モデル　→　ウィジェットに変換する
Widget modelToWidget(Shumoku model) {
  // modelを使って好きなWidgetを作る

  final metaText = Container(
    width: 50,
    height: 80,
    padding: EdgeInsets.all(10),
    child: Text(
      '${model.shumokuMei}',
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

class ShumokuSentaku extends StatelessWidget {
  const ShumokuSentaku({super.key});

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
        backgroundColor: Colors.blue,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        title: const Text('種目選択'),
        actions: [ElevatedButton(onPressed: () {}, child: Text('編集'))],
      ),
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: <Widget>[
              Container(
                width: 200,
                height: 80,
                margin: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.blue, width: 2),
                ),
                child: Text("胸"),
              ),
              SizedBox(
                height: 240,
                child: ListView.builder(
                  itemCount: chestModels.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blue, width: 2),
                      ),
                      height: 80,
                      child: Text(
                        chestModels[index].shumokuMei,
                        style: TextStyle(fontSize: 16),
                      ),
                    );
                  },
                ),
              ),
              Container(
                width: 200,
                height: 80,
                margin: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.blue, width: 2),
                ),
                child: Text("すべて表示"),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: <Widget>[
              Container(
                width: 200,
                height: 80,
                margin: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.blue, width: 2),
                ),
                child: Text("背中"),
              ),
              SizedBox(
                height: 240,
                child: ListView.builder(
                  itemCount: backModels.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blue, width: 2),
                      ),
                      height: 80,
                      child: Text(
                        backModels[index].shumokuMei,
                        style: TextStyle(fontSize: 16),
                      ),
                    );
                  },
                ),
              ),
              Container(
                width: 200,
                height: 80,
                margin: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.blue, width: 2),
                ),
                child: Text("すべて表示"),
              ),
            ],
          ),
        ],
      ),
    );
    return sca;
  }
}

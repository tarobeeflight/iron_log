import 'package:flutter/material.dart';

// 種目
class Syumoku {
  // 種目名
  final String syumokuMei;
  // 部位区分
  final String buiKbn;

  Syumoku(this.buiKbn, this.syumokuMei);
}

final models = [
  Syumoku('胸', 'ベンチプレス'),
  Syumoku('胸', 'ダンベルプレス'),
  Syumoku('背中', 'デッドリフト'),
  Syumoku('背中', 'ラットプルダウン'),
  Syumoku('脚', 'スクワット'),
  Syumoku('肩', 'ショルダープレス'),
  Syumoku('肩', 'サイドレイズ'),
  Syumoku('腕', 'バーベルカール'),
  Syumoku('腕', 'フレンチプレス'),
];

// モデル　→　ウィジェットに変換する
Widget modelToWidget(Syumoku model){
  // modelを使って好きなWidgetを作る


  final metaText = Container(
    width: 50,
    height: 100,
    padding: EdgeInsets.all(10),
    child: Text('${model.syumokuMei}',
      style: const TextStyle(color: Colors.grey,),
    ),
  );

  return Container(
    padding: EdgeInsets.all(1),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.blue),
      color: Colors.white,
    ),
    width: double.infinity,

    height: 120,
    child: metaText,
  );


}



class SyumokuSentaku extends StatelessWidget{
  const SyumokuSentaku({super.key});

  @override
  Widget build(BuildContext context) {
    final list = ListView.builder(
        itemCount: models.length,
        itemBuilder: (c,i) => modelToWidget(models[i]),
    );
    final con = Center(
      child: SizedBox(
        height: 400,
        child: list,
      ),
    );
    final  sca = Scaffold(
      backgroundColor: Colors.grey,
      body: con,
    );
    return sca;
  }
}
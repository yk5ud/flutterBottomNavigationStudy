# [flutter] providerを使用したBottomNavigationサンプルアプリ

flutterの勉強でBottomNavigationBarを使用したアプリケーションを作成しました。
Stateの変更はStatefulWidgetは使用せず、providerで行っています。

## サンプル
![sample](https://user-images.githubusercontent.com/68180143/97971754-da894b80-1e06-11eb-9bc1-3e29147be691.gif)


## 子画面の作成
BottomNavigationBarを表示させたまま、サブページを表示されるには<a href='https://api.flutter.dev/flutter/widgets/Stack-class.html' target='_blank'>`Stack`</a>と<a hlef='https://api.flutter.dev/flutter/widgets/Offstage-class.html' target='_blank'>`Offstage`</a>を使用します。

サブページを`Offstage`の`child`に設定し、表示・非表示を切り替えます。
上記を`Stack`に詰めて重ねることで実現できました。
```(lib/ui/fine/fine.dart)
 @override
  Widget build(BuildContext context) {
    final statusProvider = Provider.of<StatusProvider>(context);
    return Stack(children: <Widget>[
      Offstage(
        offstage: statusProvider.fineState != 0,
        child: Fine1(title, color),
      ),
      Offstage(
        offstage: statusProvider.fineState != 1,
        child: Fine2(title, color),
      ),
    ]);
  }
```


以下ページを参考にさせて頂きました。
https://medium.com/coding-with-flutter/flutter-case-study-multiple-navigators-with-bottomnavigationbar-90eb6caa6dbf

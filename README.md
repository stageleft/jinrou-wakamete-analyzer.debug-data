# abount about Jinrou-Wakamete-Analyzer debug tool

debug data set of [Jinrou-Wakamete-Analyzer](https://github.com/stageleft/jinrou-wakamete-analyzer).

Jinrou-Wakamete-Analyzer のデバッグに有用な、村の過去ログ一式です。

## Support Language

Japanese only, because Wakamete Server and Jinrou-Wakamete-Analyzer can support only Japanese.

わかめて鯖および、 Jinrou-Wakamete-Analyzer が日本語なので、日本語以外対応しません。あしからず。

## 使い方：ログの作成（手動）

1. 村に参加する。
1. 村終了後、ログを取得する。  
   Firefox の about:debugging → 左メニュー「このFirefox」 → 拡張機能・Jinrou wakamete analyzer の「調査」  
   ストレージ → ローカルストレージ → wakamete_village_raw_log → パース済みの値 → 村番号 → 日付のログ  
   を各々コピー、テキストファイルに保存する。
   サンプル： org/\*/\*.txt
1. ログを整形する。  
   取得したログは、 "日付文字列":"<村の状況のtableタグ>" の形式である。これを、以下形式のHTMLファイルに手動で変換する。

```html
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=shift_jis">
</head>
<body link="#ffcc00" vlink="#ffcc00" alink="#ffcc00">
<form action="変換後のファイル名.html" method="POST" name="form">
<村の状況のtableタグ>
</form>
</body>
</html>
```

サンプル： sample/\*/\*.html  

注意点としては、form タグのファイル名を直すことと、最後の " を取り忘れないこと。  
整形・リネームしたファイルは、 sample/ 以下に置くこと。理由は manifest.json を参照。

## 使い方：ログの作成（半自動）

基本は手動と同じだが、ツールを用いて楽をすることができる。

1. ログの取得時、 VSCode の bash Terminal から、以下のコマンドを使うと0byteのファイルができるので楽ができる。  
1. ログの整形時、VSCode の bash Terminal から、以下のコマンドを用いると自動で変換される。  
   ただし、作ったログは Shift-JISであるべきこと。また、作成後のファイルはutf-8となるためまるっきり村と同じではないことに留意すること。

```sh
./create_org_village_template.sh 村番号
./transform_debug_log.sh 村番号
```

## 使い方：ログの使用

   作成したログを各々ブラウザで見る。
   Githubのrawデータとしては見れないっぽい。

## サンプル説明

### sample/153535/\*.html

[【モバマス】年の瀬村](http://jinrou.aa0.netvolante.jp/~jinrou/kako/153535.html) より、共有者のログ。

2日目のグレランで再投票のあるもの。 #56, #86, #98 あたりの問題に引っかかる。

### sample/153538/\*.html

[【モバマス】今のはメラゾーマではない・・村](http://jinrou.aa0.netvolante.jp/~jinrou/kako/153538.html) より、狂人のログ。

CN「CV:若本規夫」「e+」の2名が、 #104 の問題に引っかかる。

### sample/153584/\*.html

[【モバマス】下手食いキリギリス村](http://jinrou.aa0.netvolante.jp/~jinrou/kako/153584.html) より、村人のログ。

2日目のグレランで再投票のあるもの。 #115 の問題を発見。

### sample/154385/\*.html

[【モバマス】試験運用17人村](http://jinrou.aa0.netvolante.jp/~jinrou/kako/154385.html) より、共有者のログ。

CN「やよい勝率100%」が、 #124 の問題に引っかかる。

## （参考）サンプル以外に確認しておきたいログ （既知不具合関係）

* [【モバマス】異世界なろう系さいつよ主人公村](http://jinrou.aa0.netvolante.jp/~jinrou/kako/153281.html)  
  CN「炎上夢見.net」が、 #104 の問題に引っかかる。
* [【モバマス】今のはメラゾーマではない・・村](http://jinrou.aa0.netvolante.jp/~jinrou/kako/153538.html)  
  CN「CV:若本規夫」「e+」の2名が、 #104 の問題に引っかかる。
* [【モバマス】偽りの母性.大鹿の女神村](http://jinrou.aa0.netvolante.jp/~jinrou/kako/153936.html)  
  CN「#PartyParrot」が、 #122 の問題に引っかかる。
* [【モバマス】試験運用17人村](http://jinrou.aa0.netvolante.jp/~jinrou/kako/154385.html)  
  CN「やよい勝率100%」が、 #124 の問題に引っかかる。
* [【モバマス】ファタモルガーナ村](http://jinrou.aa0.netvolante.jp/~jinrou/kako/155078.html)  
  CN「ジャマダハル顎 」が #150 の問題に引っかかる。

## （参考）サンプル以外に確認しておきたいログ （配役関係）

* [それでも猫又大狼子狐村](http://jinrou.aa0.netvolante.jp/~jinrou/kako/49118.html)  
  猫又復活がある。
* [【黒バスRP必須】春の大狼収穫村](http://jinrou.aa0.netvolante.jp/~jinrou/kako/125849.html)  
  大狼入り。
* [大狼子狐猫又ダンガンロンパRP村](http://jinrou.aa0.netvolante.jp/~jinrou/kako/133828.html)  
  子狐入り。
* [ファミ通の攻略本村](http://jinrou.aa0.netvolante.jp/~jinrou/kako/153332.html)  
  猫又の呪いあり。 #58 の問題確認用。
* [燐寸の蜃気楼村](http://jinrou.aa0.netvolante.jp/~jinrou/kako/153253.html)  
  死神手帳入り。

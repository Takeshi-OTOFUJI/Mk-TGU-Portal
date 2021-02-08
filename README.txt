MyTG, manabaへのportal htmlを作るスクリプトを作ってみました.

1 Mk-Portal.zip をダウンロードする
2 ダウンロードしたzipファイルを右クリックして「すべて展開」する
  以下の3つのファイルが見える
    1st-edit.csv
    2nd-click.bat
    sample.ps1
3 1st-edit.csv を編集する(ダブルクリックするとExcelが起動する)
  一行に一つの講義を指定する
  列A, B: 開講時間
  列C:    講義名
  列D:    manabaの該当ページのURLの番号
          https://tohoku-gakuin.manaba.jp/ct/course_379554
          であれば 379554
  列E-K:  ショートカットするパート(何か指定されていれば, 有効. 何も指定されていなければ無効)
4 2nd-click.batをダブルクリックする
     授業.html ができる

「授業.html」を好きな場所に移動する
「授業.html」をダブルクリックすると, リンクだらけの画面が現れます.
  Ctrlキーを押しながらクリックすると, 新しいタブに内容が開くので, 便利です.
# **Team2021**



## *基本的な開発の流れ*


<dt> アプリケーションを作成

  - ターミナルでpython manage.py startapp <em>アプリケーション名</em> を実行する
  
  - <em>プロジェクト名</em>/setting.pyのINSTALLED_APPS = [] に、<em>アプリケーション名/apps/クラス名/を追加する

<dt> Modelを定義

<dd> アプリケーション/models.pyに、モデルの定義を記述

<dt> <em>Viewを定義(繰り返し)</em>

  - <em>アプリケーション名</em>/views.pyに、機能を実装
  
  - html, css, js等を作成
  
  - <em>アプリケーション名</em>/urls.py に、urlを追加 ファイルが無ければ作成する

<dt> test.pyでテストを実行する

# **Team2021**



## *基本的な開発の流れ*


<dt> アプリケーションを作成

  - ターミナルでpython manage.py startapp <em>アプリケーション名</em> を実行する
  
  - <em>プロジェクト名</em>/setting.pyのINSTALLED_APPS = [] に、<em>アプリケーション名/apps/クラス名/を追加する

<dt> Modelを定義

  - アプリケーション/models.pyに、モデルの定義を記述

<dt> Viewを定義(繰り返し)

  - アプリケーション名/views.pyに、機能を実装
  
  - html, css, js等を作成
  
  - アプリケーション名/urls.py に、urlを追加 ファイルが無ければ作成する

<dt> test.pyでテストを実行する

  
  
<details>
  <summary>ちょっと詳しい解説</summary>
  
  ```python:sampleDjango.py
""" requirement.txtの使い方 """
# クローンしてきたリポジトリに、requirements.txtが存在することを確認する。ファイル階層も確認
# 普段使用する環境にinstall したくなければ、新規で適当な場所に環境を作る
# terminal上で、
pip install -r requirements.txt
# を実行する


"""アプリケーションを開始"""
python manage.py startapp AppName


"""models.pyに、必要なDBのモデルを作成する方法"""
# 紹介するのは、すでに存在するDBとテーブルを使用する方法です
python manage.py inspectdb
# 上記のコードを実行すると、setting.pyで宣言したDBの全てのテーブルをmodelとして定義したコードが返ってきます
# 使うテーブルが一部の場合には、
python manage.py inspectdb TableName
# とすると、指定したテーブルのmodel定義が返ってきます
# また、
python manage.py inspectdb > AppName/models.py
# で、処理結果を使用するアプリケーションのmodels.pyに持って来ることが出来ます。しかし、この処理は上書きとして行われます


"""ProjectName/urls.pyと、AppName/urls.pyの違い"""
# p/urls.pyで行われるのは、各アプリケーションへのroutingです
http://localhost:8000/admin/
# 上のurlで、p/urls.pyが判別するのは、/admin/の部分です
# 実際には、
    path('admin', include=('admin.urls')),
# の様な記述にマッチして、includeの中身にurlを送って処理を任せているのです

# a/urls.pyで行われるのは、p/urls.pyから送られてきたurlのさらなる解析です。
http://localhost:8000/admin/userdata/
http://localhost:8000/admin/userdata/1/
# 上記のurlは、admin アプリケーションへ送られてくるurlです。
  
# このurlは、
    path('userdata/', views.index, name='user'),
# にマッチします。この中で、views.indexというのは、views.pyのindex()関数を実行するということです
# flaskでいうところの
@app.route('admin/userdata'):
def index():
# と同じ働きです。
  
# しかし、上記のpathでは、二段目のurlにマッチしません(させる方法もありますが必要ないです)。なので、
    path('userdata/<int:pk>', views.index, name='userIndex'),
# も追加してあげましょう。ここで、/<int:pk>が増えています。これは、htmlでurlを記述する際、値を一緒にあげる為に記述しています
```
  
</details>

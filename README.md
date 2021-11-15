# Docker-Streamlit

* docker survice を build する
* image が export され contanier が起動する

```
# docker-compose up -d --build
```

* 作成されたコンテナの中に入る

```
$ docker-compose exec docker-streamlit bash
```

* コンテナの中で src ディレクトリに移動する

```
# cd src
```

* Streamlit を起動する

```
# streamlit run app.py
```

* 以下 URL でアプリにアクセス
  * http://0.0.0.0:8001/


* Streamlit の設定確認

```
# streamlit config show
```

* コンテナの中から抜ける

```
# exit
```

* 複数のコンテナを起動させた場合、次のようなエラーが発生することがある。

```
ERROR: for docker-streamlit-container  Cannot start service docker-streamlit: driver failed programming external connectivity on endpoint docker-streamlit-container (***************************************************************): Bind for 0.0.0.0:8001 failed: port is already allocated

ERROR: for docker-streamlit  Cannot start service docker-streamlit: driver failed programming external connectivity on endpoint docker-streamlit-container (***************************************************************): Bind for 0.0.0.0:8001 failed: port is already allocated
```

* この場合、以前作成したコンテナを停止させる。起動中のコンテナ ID は ``docker ps`` で確認できる。
```
$ docker stop [CONTAINER ID]
```
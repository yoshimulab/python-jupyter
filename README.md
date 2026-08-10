# Python JupyterLab 学習環境

Dockerを利用した、Python学習用のJupyterLab環境です。

Dockerを使用することで、PCごとのPython環境の違いを減らし、同じ環境でPythonの学習を行うことができます。

## 📁 フォルダ構成

```text
python-jupyter/
├── Dockerfile
├── docker-compose.yml
├── requirements.txt
├── README.md
└── work/
```

### 各ファイルの役割

| ファイル                 | 役割                          |
| -------------------- | --------------------------- |
| `Dockerfile`         | Python・JupyterLab環境の構築方法を定義 |
| `docker-compose.yml` | コンテナの起動方法やポート、フォルダ共有を設定     |
| `requirements.txt`   | 使用するPythonライブラリを指定          |
| `README.md`          | この環境の説明・使用方法                |
| `work/`              | NotebookやCSVなどの学習データを保存     |

---

# 1. 必要なもの

この環境を使用するには、PCに以下のソフトウェアが必要です。

* Docker Desktop
* Git
* Webブラウザ

PythonやJupyterLabを個別にインストールする必要はありません。

---

# 2. GitHubから教材を取得する

ターミナル、PowerShell、Git Bashなどを開き、次のコマンドを実行します。

```bash
git clone https://github.com/ユーザー名/リポジトリ名.git
```

取得したフォルダへ移動します。

```bash
cd リポジトリ名
```

---

# 3. 初回起動

初めて使用するときは、Dockerイメージを作成します。

```bash
docker compose up -d --build
```

初回はPythonやJupyterLab、各ライブラリをダウンロードするため、少し時間がかかります。

---

# 4. JupyterLabを開く

Dockerコンテナが起動したら、Webブラウザを開きます。

アドレス欄に次を入力してください。

```text
http://localhost:8888
```

JupyterLabが表示されれば起動成功です。

---

# 5. Pythonプログラムを実行する

JupyterLabでは、Notebook（`.ipynb`）を使用してPythonを学習します。

コードセルにPythonプログラムを書き、

```text
Shift + Enter
```

を押すと、そのセルを実行できます。

例：

```python
print("Hello, Python!")
```

---

# 6. ファイルの保存場所

作成したNotebookやCSVファイルなどは、

```text
work/
```

フォルダに保存してください。

`work`フォルダはPC側とDockerコンテナ側で共有されています。

そのため、Dockerコンテナを終了しても`work`フォルダ内のファイルは残ります。

---

# 7. 授業終了時

JupyterLabで作成したNotebookを保存してください。

その後、ターミナルで次のコマンドを実行します。

```bash
docker compose down
```

これでJupyterLabのコンテナを終了します。

---

# 8. 2回目以降の起動

Dockerイメージがすでに作成されている場合は、

```bash
docker compose up -d
```

で起動できます。

ブラウザから、

```text
http://localhost:8888
```

を開いてください。

終了するときは、

```bash
docker compose down
```

です。

---

# 9. Pythonライブラリについて

この環境で使用する追加ライブラリは、

```text
requirements.txt
```

で管理しています。

例：

```text
numpy
pandas
matplotlib
```

新しいライブラリを追加する場合は、`requirements.txt`にライブラリ名を追加します。

例：

```text
numpy
pandas
matplotlib
requests
```

追加後は環境を再構築します。

```bash
docker compose up -d --build
```

---

# 10. 基本コマンド

| コマンド                           | 内容               |
| ------------------------------ | ---------------- |
| `docker compose up -d`         | JupyterLabを起動    |
| `docker compose up -d --build` | Docker環境を再構築して起動 |
| `docker compose down`          | JupyterLabを終了    |
| `docker compose ps`            | コンテナの状態を確認       |
| `docker compose logs`          | コンテナのログを確認       |

---

# Dockerを使う理由

通常、Pythonを学習するためには、それぞれのPCにPythonや必要なライブラリをインストールする必要があります。

Dockerを使用すると、

```text
Dockerfile
        ↓
Python環境を作成
        ↓
requirements.txt
        ↓
必要なライブラリをインストール
        ↓
JupyterLab起動
```

という流れを自動化できます。

これにより、異なるPCでも同じPython学習環境を再現しやすくなります。

---

# 授業での基本的な流れ

### 授業開始

```bash
docker compose up -d
```

↓

ブラウザで

```text
http://localhost:8888
```

を開く。

↓

JupyterLabでPythonを学習する。

### 授業終了

Notebookを保存する。

↓

```bash
docker compose down
```

これで終了です。


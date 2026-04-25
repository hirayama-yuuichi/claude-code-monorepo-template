---
name: monorepo-init
description: 新規プロジェクトに root/ のテンプレート構造を degit で展開する
origin: local
---

# Monorepo Init — 新規プロジェクト初期化スキル

## When to Use

新しい個人プロジェクトを立ち上げるとき、モノレポ構造をゼロから作りたいとき。

## How It Works

1. ユーザーが `/monorepo-init` を実行する
2. プロジェクト名をユーザーに確認する
3. カレントディレクトリに既存ファイルがある場合は上書き確認を求めて中止する
4. `npx degit hirayama-yuuichi/claude-code-monorepo-template/packages/root <プロジェクト名>` を実行してテンプレートを展開する
5. プレースホルダ（`__PROJECT_NAME__`）をプロジェクト名で置換する（対象: 全 `.md` ファイル）
6. `README.md` 冒頭にテンプレートリポジトリへの参照行を埋め込む
7. 展開完了をユーザーに通知する

## Template Source

```
npx degit hirayama-yuuichi/claude-code-monorepo-template/packages/root <プロジェクト名>
```

- `.git/` を含まず `root/` の内容だけがフラットにコピーされる
- `_old/`、`plan*.md`、`*_review.md`、`*_proposal.md` はコピーされない

## README.md への参照行

展開後の `README.md` 冒頭に以下を自動挿入する：

```
> このプロジェクトは [claude-code-monorepo-template](https://github.com/hirayama-yuuichi/claude-code-monorepo-template) のモノレポ構造を採用しています。使い方は git を参照してください。
```

## Notes

- 既存ファイルがある場合は上書きせず中止する（強制上書き不可）
- `degit` は `npx` 経由で実行するため事前インストール不要

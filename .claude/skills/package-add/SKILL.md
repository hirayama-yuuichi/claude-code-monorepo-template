---
name: package-add
description: 既存モノレポに新しいパッケージをテンプレートから追加する
origin: local
---

# Package Add — パッケージ追加スキル

## When to Use

既存のモノレポプロジェクトに新しいパッケージを追加したいとき。

## How It Works

1. ユーザーが `/package-add <パッケージ名>` を実行する（パッケージ名省略時はユーザーに確認する）
2. `packages/<パッケージ名>/` が既に存在する場合は中止する
3. `packages/package-a/` をテンプレートとして `packages/<パッケージ名>/` にコピーする
4. プレースホルダ（`__PACKAGE_NAME__`）をパッケージ名で置換する（対象: コピーした全 `.md` ファイル）
5. 作成したパッケージのパスをユーザーに通知する

## Template Source

`packages/package-a/` をコピー元として使用する。

## Notes

- 同名パッケージが既存の場合は中止する（上書き不可）
- コピー後にプレースホルダが残っていないか確認する

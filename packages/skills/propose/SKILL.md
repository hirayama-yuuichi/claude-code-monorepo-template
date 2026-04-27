---
name: propose
description: _review.md をもとに元ファイルの修正案を作成し _proposal.md に保存する
origin: local
---

# Propose — 修正案生成スキル

## When to Use

`/critique` で生成した `_review.md` をもとに、元ファイルの修正案を作りたいとき。
採用ループ（critique → propose → 比較・採用）の第2ステップ。

## How It Works

1. ユーザーが `/propose <ファイルパス>` を実行する（パス省略時は `_review.md` が存在する直近のファイルを対象とする）
2. `<対象>_review.md` を読み込む（存在しない場合はエラーを通知して中止）
3. 元ファイルを読み込む
4. `_review.md` の批判内容をすべて反映した修正案を作成する
5. `<対象ファイル名>_proposal.md` として同じディレクトリに保存する
6. 保存先のパスをユーザーに通知する

## Output

- `<対象>_proposal.md` — 修正案（一時ファイル。採用後は元ファイルに反映し `_old/` へ移動）

## Notes

- 元ファイルは変更しない。比較はユーザーが IDE で行う
- 採用する場合: 元ファイルを `_proposal.md` の内容で更新し、`_review.md` と `_proposal.md` を `_old/` へ移動する
- 却下する場合: 却下理由を Claude に伝えて `/critique` からやり直す
- 詳細: `in-progress/records/0001-提案の採用ループ.md`

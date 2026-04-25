---
name: decision-add
description: docs/records/ に 0001-xxx.md 形式でADRを新規作成する
origin: local
---

# Decision Add — ADR作成スキル

## When to Use

設計判断・アーキテクチャ変更・方針決定を記録として残したいとき。
`docs/records/` ディレクトリに新しいADR（Architecture Decision Record）を追加する。

## How It Works

1. ユーザーが `/decision-add <タイトル>` を実行する（タイトル省略時はユーザーに確認する）
2. `docs/records/` の既存ファイルから次の連番を採番する（例: 0001, 0002 が存在する場合は 0003）
3. `docs/records/XXXX-<タイトル>.md` を `0001-xxx.md` のフォーマットで作成する
4. 必須項目（背景・判断・理由）が未記入の場合は保存前にユーザーに確認を求める
5. 作成したファイルのパスをユーザーに通知する
6. 決定事項に実装タスクが含まれる場合、`tasks/backlog.md` への追記を提案する（ADR番号を付記）

## Output

- `docs/records/XXXX-<タイトル>.md` — ADRファイル

## File Format

```markdown
# 設計判断ログ

## XXXX: <タイトル>

- 日付: YYYY-MM-DD
- 状態: 議論中 | 採用 | 廃止

### 背景

（なぜこの判断が必要になったか）

### 判断

（何を決めたか）

### 理由

（なぜその判断をしたか）

### 却下した選択肢

| 案 | 却下理由 |
|---|---|
| ... | ... |

### 影響

（この判断がもたらす変化・制約）
```

## Notes

- 連番が競合する場合は次の空き番号を自動で採番する
- `docs/records/` が存在しない場合は作成してから続行
- 状態は `議論中` → `採用` または `廃止` に変化する。状態変更時はファイルを直接編集する

# 設計判断ログ

## 0014: template の docs ファイル作成

- 日付: 2026-04-27
- 状態: 議論中
- ドキュメント: 未着手
- 実装: 未着手

### 背景

`packages/template/docs/` には `architecture.md` と `setup.md` が存在するが、展開先プロジェクトで Claude Code と人間が「この仕組みをどう使うか」を理解できる説明が不足している。rec-0013（仕組みの説明配置）で検討すべき課題として挙げられていた内容。

### 判断

`packages/template/docs/` に以下のファイルを作成する（案）：

| ファイル | 内容 |
|---|---|
| `architecture.md` | モノレポ構造概要・基本方針（既存。内容を充実させる） |
| `how-to-work.md` | 意思決定方法・批判と修正案・ツールの使い方・アイデアの使い方 |

**`how-to-work.md` の目次案：**

1. モノレポ構造概要
2. 基本方針（完成品 vs 進行中の2ゾーン）
3. 意思決定方法（ADR の書き方・採用ループ）
4. 批判と修正案（`/critique` → `/propose` の流れ）
5. ツールの使い方（スキル一覧・トリガー）
6. アイデアの使い方（`in-progress/ideas.md` の運用）

### 理由

（未定）

### 却下した選択肢

| 案 | 却下理由 |
|---|---|
| `architecture.md` 1ファイルにすべて記載 | 構造説明と作業方法が混在して読みにくい |
| `README.md` に記載 | 展開後に上書きされる想定のため不適切（rec-0013 参照） |

### 影響

（未定）

### docs 記載方針

（未定）

### 実装方針

- `packages/template/docs/how-to-work.md` を新規作成
- `packages/template/docs/architecture.md` の内容を充実させる

# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## ファイル構成

```
docs/                    ← 完成・確定した情報（変化が遅いもの）
in-progress/             ← 進行中のすべて（アイデア・backlog・計画・ADR）
packages/<pkg>/          ← 実装とパッケージ固有情報
```

## Claude Code への出力ルール

| 出力の種類 | 書く場所 | 書き方 |
|---|---|---|
| 新規アイデア | `in-progress/ideas.md` | |
| やること追加 | `in-progress/backlog.md` | 「## 作業予定」セクションに追記。records の場合は `[rec-XXXX](./records/XXXX-タイトル.md)` 形式。完了したら `## YYYY/MM/DD` 見出し下に「済」付きで移動 |
| 横断的な計画変更 | `in-progress/plan.md` | |
| パッケージ固有の計画 | `packages/<pkg>/plan.md` | |
| 設計判断ログ | `in-progress/records/XXXX-*.md` | |
| アーキテクチャ変更 | `docs/architecture.md` | |

## 使用できるスキル

| スキル | トリガー | 用途 |
|---|---|---|
| `records-add` | `/records-add` | `in-progress/records/` に設計判断ログを追加 |
| `critique` | `/critique` | ファイルを別インスタンスで批判し `_review.md` を生成 |
| `propose` | `/propose` | `_review.md` をもとに修正案 `_proposal.md` を生成 |
| `package-add` | `/package-add` | 新しいパッケージをテンプレートから追加 |

## 提案の採用ループ

重要な提案を受けるときは `/critique` → `/propose` → 比較・採用 のループを踏む。

## in-progress/records/ の使い方

アーキテクチャの方針を変えるとき、または `docs/` の Why を変更するときは、先に `in-progress/records/` に理由を記録してから変更する。ADR 採用後は以下のチェックボックスで反映状態を追跡する：

```markdown
- [ ] docs/ 更新済み
- [ ] 実装済み
```

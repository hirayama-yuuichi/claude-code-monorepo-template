# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## このリポジトリの目的

モノレポテンプレートの設計・管理リポジトリ。`packages/template/` が運用されるテンプレートの実体で、
このリポジトリ自体は「`packages/template/`」以下のテンプレートを使い、各プロジェクトを運用するためのskillやコマンドなどの・設計・計画・を行う場所。

## ファイル構成

```
packages/template/               ← 配布するモノレポテンプレートの実体
decisions/          ← 設計判断ログ（ADR）
plan.md             ← 正本（パッケージ横断の計画）
plan_review.md      ← 批判ファイル（一時）
plan_proposal.md    ← 提案ファイル（一時）
モノレポ案.md        ← テンプレート設計方針のメモ
```

## テンプレート（packages/template/）の構造方針

`モノレポ案.md` に全方針が書かれている。要点：

- `docs/` — 変化が遅い情報のみ（setup, architecture, decisions）
- `tasks/` — 動く情報（backlog, plan）。やることは `backlog.md` だけに書く
- `ideas/` — まだやるか不明なものだけ。分散禁止
- `packages/<pkg>/` — コードとパッケージ固有情報のみ

## Claude Code への出力ルール

| 出力の種類 | 書く場所 |
|---|---|
| 新規アイデア | `ideas/ideas.md` |
| やること追加 | `tasks/backlog.md` |
| 横断的な計画変更 | `tasks/plan.md` |
| パッケージ固有の計画 | `packages/<pkg>/plan.md` |
| 設計判断ログ | `docs/decisions/XXXX-*.md` |
| アーキテクチャ変更 | `docs/architecture.md` |

## Claude 提案の採用ループ

重要な提案を受けるときは必ずこのループを踏む（`decisions/0001-提案の採用ループ.md` 参照）。


## decisions/ の使い方

`plan.md` の Why を変更するとき、またはアーキテクチャの方針を変えるときは、先に `decisions/` に理由を記録してから変更する。

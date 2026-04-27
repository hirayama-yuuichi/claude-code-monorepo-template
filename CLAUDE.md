# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## このリポジトリの目的

モノレポテンプレートの設計・管理リポジトリ。`packages/template/` が運用されるテンプレートの実体で、
このリポジトリ自体は「`packages/template/`」以下のテンプレートを使い、各プロジェクトを運用するためのスキルやコマンドなどの設計・計画を行う場所。

## ファイル構成

```
packages/template/          ← 配布するモノレポテンプレートの実体
docs/                       ← 完成・確定した情報（変化が遅いもの）
in-progress/                ← 進行中のすべて（アイデア・backlog・計画・records）
in-progress/records/        ← 設計判断ログ（records）
in-progress/plan/plan.md    ← 正本（パッケージ横断の計画）
```

## テンプレート（packages/template/）の構造方針

`docs/architecture.md` に全方針が書かれている。要点：

- `docs/` — 完成・確定した情報のみ（architecture, setup 等）
- `in-progress/` — 進行中のすべて（アイデア・backlog・計画・records）
- `packages/<pkg>/` — コードとパッケージ固有情報のみ

## Claude Code への出力ルール

| 出力の種類 | 書く場所 | 書き方 |
|---|---|---|
| 新規アイデア | `in-progress/ideas.md` | |
| やること追加 | `in-progress/backlog.md` | 人間が管理する作業リスト。records に収まらないタスクも含めてよい。見出し1行のみ（詳細は `in-progress/records/` で検討）。完了したら `MM/DD` 見出し下に「済」付きで移動。増えたら `backlog_old.md` へ退避 |
| 横断的な計画変更 | `in-progress/plan/plan.md` | |
| パッケージ固有の計画 | `packages/<pkg>/plan.md` | |
| 設計判断ログ | `in-progress/records/XXXX-*.md` | |
| アーキテクチャ変更 | `docs/architecture.md` | |

## スキルの管理

`packages/skills/` が正本。スキルを編集したら `packages/skills/deploy.sh` を実行して `.claude/skills/` に同期する。

## テンプレート変更時のルール

`packages/template/` の構造・内容を変更したときは、以下も合わせて更新する：

- `packages/template/docs/` — 変更内容を反映
- `packages/skills/` — パス参照や手順が変わる場合は更新し、`deploy.sh` で同期

## Claude 提案の採用ループ

重要な提案を受けるときは必ずこのループを踏む（`in-progress/records/0001-提案の採用ループ.md` 参照）。

## in-progress/records/ の使い方

アーキテクチャの方針を変えるとき、または `docs/` の内容を変更するときは、先に `in-progress/records/` に理由を記録してから変更する。record 採用後は以下のステータスフィールドで反映状態を追跡する：

```markdown
- [ ] docs/ 更新済み
- [ ] 実装済み
```

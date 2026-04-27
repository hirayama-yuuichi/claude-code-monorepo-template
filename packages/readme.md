# packages/

このテンプレートシステムを構成するパッケージ一覧。

| パッケージ | 役割 |
|---|---|
| [template/](./template/) | 展開先プロジェクトに配布するモノレポテンプレートの実体 |
| [skills/](./skills/) | Claude Code スキルの正本置き場 |

## 使い方

### 新規プロジェクトへの展開

`/monorepo-init` スキルを使って `template/` を展開する。

### スキルの同期

`skills/` を編集したら `skills/deploy.sh` を実行して `.claude/skills/` に同期する。

## 関連ドキュメント

- [docs/architecture.md](../docs/architecture.md) — このシステム全体のアーキテクチャ
- [template/docs/1_概要.md](./template/docs/1_概要.md) — テンプレートの仕組み概要

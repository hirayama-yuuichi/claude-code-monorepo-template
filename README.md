# claude-code-monorepo-template

モノレポテンプレートの設計・スキル管理リポジトリ。

> このプロジェクトは [claude-code-monorepo-template](https://github.com/hirayama-yuuichi/claude-code-monorepo-template) のモノレポ構造を採用しています。使い方はgitを参照してください。

## パッケージ一覧

| パッケージ | 役割 |
|---|---|
| [template](./packages/template/) | 配布するモノレポテンプレートの実体 |
| [skills](./packages/skills/) | Claude Code スキルのソースファイル群 |

## 最短の使い方

```bash
# スキルをデプロイ
bash packages/skills/deploy.sh
```

詳細は [docs/](./docs/) を参照。

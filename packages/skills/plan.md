# skills パッケージ

Claude Code プロジェクトスキルのソースを管理する。

## スキル一覧

| スキル | 状態 | 説明 |
|---|---|---|
| `critique` | デプロイ済み | 対象ファイルを別インスタンスで批判し `_review.md` を生成する |
| `propose` | デプロイ済み | `_review.md` をもとに修正案を作成し `_proposal.md` を生成する |
| `decision-add` | デプロイ済み | `decisions/` に `0001-xxx.md` 形式でADRを新規作成する |
| `monorepo-init` | デプロイ済み | 新規プロジェクトにテンプレート構造を展開する |
| `package-add` | デプロイ済み | 既存モノレポに新しいパッケージを追加する |
| `template-sync` | 未作成 | テンプレートの変更を既存プロジェクトに同期する |

## デプロイ手順

```bash
bash packages/skills/deploy.sh
```

`packages/skills/` の全スキルを `.claude/skills/` に一括コピーする。

## ファイル構成

各スキルディレクトリに以下を置く：

```
<スキル名>/
├── SKILL.md           ← スキル定義（Claude が読む）
└── .provenance.json   ← 出所情報（Claude Code が読む）
```

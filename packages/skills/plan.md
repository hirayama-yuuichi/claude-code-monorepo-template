# skills パッケージ

Claude Code プロジェクトスキルのソースを管理する。

## スキル一覧

| スキル | 状態 | 説明 |
|---|---|---|
| `critique` | デプロイ済み | 対象ファイルを別インスタンスで批判し `_review.md` を生成する |
| `propose` | デプロイ済み | `_review.md` をもとに修正案を作成し `_proposal.md` を生成する |
| `decision-add` | デプロイ済み | `decisions/` に `0001-xxx.md` 形式でADRを新規作成する |
| `monorepo-init` | 未作成 | 新規プロジェクトにテンプレート構造を展開する |
| `package-add` | 未作成 | 既存モノレポに新しいパッケージを追加する |
| `template-sync` | 未作成 | テンプレートの変更を既存プロジェクトに同期する |

## デプロイ手順

`packages/skills/<スキル名>/` の内容をプロジェクトの `.claude/skills/<スキル名>/` にコピーする。

```bash
cp -r packages/skills/<スキル名> .claude/skills/
```

全スキルを一括デプロイ：

```bash
for skill in packages/skills/*/; do
  name=$(basename "$skill")
  cp -r "$skill" .claude/skills/
done
```

## ファイル構成

各スキルディレクトリに以下を置く：

```
<スキル名>/
├── SKILL.md           ← スキル定義（Claude が読む）
└── .provenance.json   ← 出所情報（Claude Code が読む）
```

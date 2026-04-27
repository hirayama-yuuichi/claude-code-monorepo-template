# 設計判断ログ

## 0004: AWS Bedrock 経由 Claude Code 接続のドキュメント整備

- 日付: 2026-04-27
- 状態: 採用
- [ ] docs/ 更新済み
- [ ] 実装済み

### 背景

`docs/bedrock-setup.md` に以下の問題があり、手順書として機能していなかった：

- リージョン名のタイポ（`ap-nortaast-1`）
- 設定コードブロックの構文破壊（bash と JSON の混在・実行不可）
- 変数説明の欠落・矛盾（リージョン説明が「US リージョン」なのに値は東京）
- AWS アカウント ID がプロファイル名に露出

### 判断

`/critique` → `/propose` → 比較・採用のループで修正し、以下の状態に確定した：

- AWS プロファイル名は `<YOUR_PROFILE>` プレースホルダーで記載
- 設定は bash `export` による一時設定のみ記載
- 環境変数は `CLAUDE_CODE_USE_BEDROCK`、`AWS_REGION`、`ANTHROPIC_DEFAULT_SONNET_MODEL` の3つ

### 却下した選択肢

| 案 | 却下した理由 |
|---|---|
| `~/.claude/settings.json` の `env` への永続化手順も追加 | ユーザーが今回スコープ外と判断。必要になったときに追記する |

### 影響

- `ideas/ideas.md` の Bedrock 接続アイデアは `docs/bedrock-setup.md` が正本として参照している
- 一時ファイル（`_review.md`、`_proposal.md`）は `docs/_old/` へ移動済み

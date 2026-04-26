# アイデアノート
- 「まだやるかわからないもの」専用
- スコープはファイルではなく見出しで管理する

## Global

### AWS Bedrock 経由での Claude Code 接続

- Bedrock 経由で Claude API を使うことで、AWS アカウント内での利用管理・コスト計上・セキュリティポリシー適用が可能になる
- 設定方法は `docs/bedrock-setup.md` に記載済み
- `.claude/settings.local.json` に環境変数を追加するだけで切り替え可能
- 必要な環境変数：
  - `CLAUDE_CODE_USE_BEDROCK=1`
  - `AWS_PROFILE`（SSO プロファイル）
  - `AWS_REGION`（クロスリージョン推論には `us-east-1` が必要）
  - `ANTHROPIC_DEFAULT_SONNET_MODEL`（Bedrock モデル ID）
  - `ANTHROPIC_DEFAULT_HAIKU_MODEL`（Bedrock モデル ID）
- 既存の Anthropic API 直接接続との切り替えは環境変数の有無で制御可能

## packages/template

## packages/skills

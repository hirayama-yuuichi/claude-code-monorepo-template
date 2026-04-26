# AWS Bedrock 経由での Claude Code 接続設定

> **注意**: このドキュメントでは AWS プロファイル名を `<YOUR_PROFILE>` として記載しています。実際の環境に合わせて読み替えてください。

## 概要

Claude Code を Anthropic API 直接接続から AWS Bedrock 経由に切り替える手順。
Bedrock 経由にすることで AWS アカウント内での利用管理・コスト計上・セキュリティポリシー適用が可能になる。

## 前提条件

### 1. Bedrock モデルアクセスの有効化

AWS コンソール → **Amazon Bedrock** → **モデルアクセス** で以下を有効化する：

- Anthropic / Claude Sonnet 4
- Anthropic / Claude Haiku 4.5

または CLI で確認：

```bash
aws bedrock list-foundation-models --region ap-northeast-1 \
  --profile <YOUR_PROFILE> \
  --query 'modelSummaries[?contains(modelId, `anthropic`)].modelId'
```

### 2. SSO ログイン

設定作業の前に AWS SSO にログインしておく：

```bash
aws sso login --profile <YOUR_PROFILE>
```

## 設定内容


コマンドプロンプトから以下を実行：

```bash
export CLAUDE_CODE_USE_BEDROCK=1
export AWS_REGION=ap-northeast-1
export ANTHROPIC_DEFAULT_SONNET_MODEL=us.anthropic.claude-sonnet-4-6
```

この設定は現在のシェルセッションでのみ有効です。


### 環境変数の説明

| 変数 | 値 | 説明 |
|---|---|---|
| `CLAUDE_CODE_USE_BEDROCK` | `1` | Bedrock モードを有効化 |
| `AWS_REGION` | `ap-northeast-1` | 使用する AWS リージョン（東京リージョン） |


## 動作確認

1. **Claude Code を再起動**
   - ターミナルで実行中の場合: `Ctrl+C` で終了後、再度 `claude` コマンドで起動
   - デスクトップアプリの場合: アプリケーションを終了して再起動
   
2. **モデル設定の確認**
   - Claude Code の組み込みコマンド `/model` でモデル名を確認
   - Bedrock のモデル IDが変更されていれば設定成功
   
3. **動作テスト**
   - 通常通り会話して応答があれば接続成功

## よくあるトラブル

### `ExpiredTokenException` / `UnauthorizedException`

**原因**: SSO トークンが切れている

**対処**: 再ログインする

```bash
aws sso login --profile <YOUR_PROFILE>
```

### `ResourceNotFoundException` / モデルが見つからない

**原因**: Bedrock のモデルアクセスが有効になっていない

**対処**: AWS コンソールでモデルアクセスを申請する

1. AWS コンソール → Amazon Bedrock → モデルアクセス
2. Anthropic / Claude Sonnet 4.6 と Haiku 4.5 を有効化
3. 承認には数分かかる場合がある

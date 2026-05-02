# 設計判断ログ

## 0018: packages配下のGitHub公開と新規プロジェクトへの反映

- 日付: 2026-05-02
- 状態: 採用
- ドキュメント: 未着手
- 実装: 未着手

### 背景

現在 `/monorepo-init` は degit で GitHub からテンプレートを取得している。今後、packages/ 配下を GitHub で公開し、新規プロジェクトで効率的に利用できる仕組みを検討する必要がある。

**スキル配布の問題**: 利用者が新規プロジェクトで `/monorepo-init` を実行したくても、スキル自体がまだインストールされていないためコマンドが見つからない。テンプレート展開とスキルインストールの循環依存が発生している。

### 判断

**公開範囲**: packages/ 全体を公開（案A）
**反映方法**: スキル先行インストール + /monorepo-init の改善 + 公開リポジトリ整備

具体的には：

1. **packages/ 全体を公開**
   - template/, skills/, docs/ が一箇所にまとまる
   - 利用者が一度の操作で全てを取得できる
   - 既存の `/monorepo-init` が packages/template/ を参照している構造と整合する

2. **スキルの先行インストール（推奨案）**
   - 利用者は最初に1度だけスキルをインストール：
     ```bash
     npx degit hirayama-yuuichi/claude-code-monorepo-template/packages/skills ~/.claude/skills/monorepo-template
     ```
   - その後は何度でも `/monorepo-init` でプロジェクトを作成できる
   - プレースホルダ置換・README 参照行挿入などの自動化の恩恵を受けられる

3. **/monorepo-init スキルの修正**
   - degit 取得先を `packages/root` → `packages/template` に修正（または root を template にリネーム）
   - 取得先 URL の検証

4. **公開リポジトリとして整備**
   - LICENSE ファイルの追加
   - README の充実化（既に実施済み）
   - 公開用のタグ・リリースの作成

### 理由

- 既存の `/monorepo-init` の仕組みと整合する — 現在 packages/template/ を参照しているため、packages/ 全体を公開することで変更が最小限になる
- 利用者が一箇所から全てを取得できる — template/, skills/, docs/ を別々に取得する手間がない
- スキル先行インストールは **1回だけの手間で済む** — 2回目以降は `/monorepo-init` だけで新規プロジェクトを作成できる
- 自動化の恩恵を受けられる — プレースホルダ置換、README 参照行挿入、除外ファイル処理が自動で行われる
- 公開リポジトリとして整備することで、利用者が安心して使える — LICENSE、タグ・リリースにより正式な配布物として信頼性が高まる

### 却下した選択肢

| 案 | 却下理由 |
|---|---|
| template/ のみ公開 | skills/ と docs/ を別で管理する必要があり、利用者が複数の場所から取得する手間が発生する。現在の `/monorepo-init` の仕組みとも整合しない |
| このリポジトリ全体を公開 | 開発用ファイル（in-progress/、_review.md 等）が大量に含まれ、利用者にとってノイズが多い |
| 手動 degit のみ案内 | プレースホルダ置換や README 参照行挿入が手動になる。毎回同じコマンドを打つ必要があり、2回目以降の手間が大きい |
| 初回セットアップスクリプト | curl でスクリプトを実行する方式はセキュリティ的に慎重さが必要。npx degit の方がシンプルで安全 |
| Claude Code 公式スキルとして公開 | 申請・承認プロセスが必要で実現まで時間がかかる。将来的な改善パスとしては有効 |

### 影響

- packages/ の構造変更が公開に影響する — 開発用ファイル（_old/, *_review.md 等）が混入しないよう注意が必要
- LICENSE ファイルの追加が必要
- GitHub でのタグ・リリース管理が必要になる
- 後方互換性の考慮が必要になる

### docs 記載方針

- packages/README.md の「インストール」セクションを更新：
  ```markdown
  ## インストール
  
  ### 1. スキルのインストール（初回のみ）
  
  Claude Code で以下を実行：
  
  ```bash
  ! npx degit hirayama-yuuichi/claude-code-monorepo-template/packages/skills ~/.claude/skills/monorepo-template
  ```
  
  ### 2. プロジェクトの作成
  
  ```
  /monorepo-init
  ```
  ```
- ルート README.md に公開リポジトリとしての情報（ライセンス、コントリビューション等）を追加する可能性あり

### 実装方針

1. **LICENSE ファイルの追加**
   - ルートに LICENSE ファイルを作成（MIT または Apache 2.0 等）
   
2. **/monorepo-init スキルの修正**
   - `packages/skills/monorepo-init/SKILL.md` の degit パスを確認
   - 現在: `packages/root` → 修正: `packages/template`
   - または `packages/root/` を `packages/template/` にリネーム
   
3. **packages/README.md の更新**
   - 「インストール」セクションを2ステップ（スキル先行インストール + プロジェクト作成）に変更
   
4. **GitHub での公開準備**
   - .gitignore の確認（_old/, *_review.md 等を除外）
   - 初回リリースタグの作成（v1.0.0 等）
   
5. **後方互換性の考慮**
   - packages/ の構造変更時はセマンティックバージョニングに従う
   - Breaking changes は major version update で通知

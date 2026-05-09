# Claude Code モノレポテンプレート

モノレポ構造とアイデア管理フローを提供するテンプレート。

## できること

### 1. モノレポ共有構造

- 複数パッケージを1リポジトリで管理
- 完成情報（`docs/`）と進行中情報（`in-progress/`）の2ゾーン構造
- パッケージごとに独立した開発が可能

### 2. アイデアから実装までのフロー

- アイデア記録 → 設計判断 → 実装 → 追跡の共通手順
- 意思決定過程の可視化
- 設計判断ログ（records）による履歴管理

## インストール

### 1. 新プロジェクトのディレクトリを作成

```bash
mkdir <プロジェクト名>
cd <プロジェクト名>
```

### 2. スキルのインストール（初回のみ）

**ターミナルで**以下を実行（Claude Code 起動前に行うこと）：

```bash
npx degit hirayama-yuuichi/claude-code-monorepo-template/packages/skills .claude/skills
```

または curl を使う場合：

```bash

mkdir -p .claude/
curl -fsSL https://github.com/hirayama-yuuichi/claude-code-monorepo-template/archive/refs/heads/main.tar.gz \
  | tar -xz --strip-components=2 -C .claude/ claude-code-monorepo-template-main/packages/skills

```

### 3. プロジェクトの作成

プロジェクトディレクトリで Claude Code を起動し、以下を実行：

```
/monorepo-init
```

プロジェクト名を入力すると、テンプレートが展開されます。

## 利用できる機能

### スキル

| スキル | 用途 |
|---|---|
| `/package-add` | 新しいパッケージを追加 |
| `/records-add` | 設計判断ログを作成 |
| `/critique` | ファイルを批判し `_review.md` を生成 |
| `/propose` | `_review.md` をもとに修正案を生成 |

### ファイル構造

```
docs/               ← 完成・確定した情報
in-progress/        ← 進行中のすべて
├── ideas.md        ← アイデアの記録
├── backlog.md      ← 作業リスト（優先度順）
├── records/        ← 設計判断ログ
└── plan/           ← 初期計画
   ├── plan.md         　　　← プロジェクト全体の計画
   └── sample-package-a.md   ← パッケージごとの計画

packages/           ← コードとパッケージ固有情報
└── <pkg>/
    ├── src/        ← ソースコード
    ├── docs/       ← パッケージ固有の仕様
    └── CLAUDE.md   ← パッケージ固有の開発方針
```

## アイデア管理フロー

1. **プロジェクト全体としてやりたいことを書く** — `in-progress/plan/plan.md`
2. **パッケージごとにやりたいことを書く** — `in-progress/plan/<パッケージ名>.md`
3. **アイデアを書く** — `in-progress/ideas.md`
4. **やると決めたら** — `/records-add` で設計判断ログを作成
5. **作業リストに追加** — `in-progress/backlog.md`
6. **実装・docs 更新**
7. **record のステータスを完了に更新**

判断に迷うときは `/critique` → `/propose` で批判と修正案を生成。

## ドキュメント

詳しい使い方は以下を参照：

- [概要](./docs/1_概要.md) — テンプレートの仕組み
- [モノレポ構造](./docs/2_モノレポ構造.md) — ファイル配置方針
- [アイデア管理](./docs/3_アイデア管理.md) — アイデア→実装のフロー


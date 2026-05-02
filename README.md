# claude-code-monorepo-template

モノレポテンプレートの設計・管理リポジトリ。

## このリポジトリの目的

以下を実現するためのモノレポテンプレートを設計・管理する：

1. **モノレポ共通構造の提供**  
   複数パッケージを1リポジトリで管理する構造を標準化

2. **意思決定過程の可視化**  
   アイデアから実装までの流れを記録し、設計判断を追跡可能に

3. **他者への伝達を容易に**  
   構造・スキル・ドキュメントで、人間と Claude Code の両方が理解できる形式を提供

## リポジトリ構造

```
packages/
├── template/       ← 配布するモノレポテンプレートの実体
├── skills/         ← Claude Code スキルの正本（.claude/skills/ に同期）
└── docs/           ← このテンプレートの使い方・仕組みの説明

docs/               ← 完成・確定した情報（変化が遅いもの）
in-progress/        ← 進行中のすべて（アイデア・backlog・計画・records）
├── ideas.md        ← まだやるか不明なアイデア
├── backlog.md      ← 作業リスト（優先度順）
├── records/        ← 設計判断ログ
└── plan/           ← パッケージ横断の計画
```

## 使い方

### 新規プロジェクトでテンプレートを使う

Claude Code で以下を実行：

```
/monorepo-init
```

テンプレート（`packages/template/`）が展開され、モノレポ構造が利用できる。

### このリポジトリでの開発フロー

1. **アイデアを書く** — `in-progress/ideas.md`
2. **やると決めたら records 化** — `/records-add`
3. **backlog に追加** — `in-progress/backlog.md`
4. **実装・docs 更新** — 該当ファイルを編集
5. **record のステータスを完了に更新**

詳細は `packages/docs/3_アイデア管理.md` を参照。

### スキルの管理

`packages/skills/` を編集したら以下で同期：

```bash
cd packages/skills
./deploy.sh
```

## ドキュメント

| ファイル | 内容 |
|---|---|
| [packages/docs/1_概要.md](./packages/docs/1_概要.md) | テンプレートで利用できる仕組みの概要 |
| [packages/docs/2_モノレポ構造.md](./packages/docs/2_モノレポ構造.md) | 2ゾーン構造とファイル配置方針 |
| [packages/docs/3_アイデア管理.md](./packages/docs/3_アイデア管理.md) | アイデア→実装のフロー |
| [CLAUDE.md](./CLAUDE.md) | Claude Code への指示（このリポジトリ固有） |

## スキル一覧

| スキル | 用途 |
|---|---|
| `/monorepo-init` | 新規プロジェクトにテンプレートを展開 |
| `/package-add` | 既存モノレポに新しいパッケージを追加 |
| `/records-add` | 設計判断ログを新規作成 |
| `/critique` | ファイルを批判し `_review.md` を生成 |
| `/propose` | `_review.md` をもとに修正案を生成 |

## 開発方針

- テンプレートの構造・スキルを実際のプロジェクトで試用し、フィードバックをもとに改善する
- 設計判断は `in-progress/records/` に記録し、採用後もステータスで追跡する
- このリポジトリ自体が、配布するテンプレート構造を使って運用される

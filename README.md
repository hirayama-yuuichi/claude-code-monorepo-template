# claude-code-monorepo-template

モノレポテンプレートの設計・管理リポジトリ（開発者向け）。

> **テンプレート利用者の方へ**: 使い方は [packages/README.md](./packages/README.md) を参照してください。

## このリポジトリの目的

モノレポテンプレートを設計・改善し、実際のプロジェクトで試用してフィードバックを反映する。

目標：
1. **モノレポ共通構造の標準化**
2. **意思決定過程の可視化（records による追跡）**
3. **他者への伝達を容易に（人間と Claude Code の両方が理解できる形式）**

## リポジトリ構造

```
packages/
├── template/       ← 配布するモノレポテンプレートの実体
├── skills/         ← Claude Code スキルの正本（.claude/skills/ に同期）
└── docs/           ← テンプレートの使い方・仕組みの説明

docs/               ← 完成・確定した情報（変化が遅いもの）
in-progress/        ← 進行中のすべて（アイデア・backlog・計画・records）
├── ideas.md        ← まだやるか不明なアイデア
├── backlog.md      ← 作業リスト（優先度順）
├── records/        ← 設計判断ログ
└── plan/           ← パッケージ横断の計画
```

## 開発フロー

1. **アイデアを記録** — `in-progress/ideas.md`
2. **やると決めたら records 化** — `/records-add`
3. **backlog に追加** — `in-progress/backlog.md`（優先度順）
4. **実装・docs 更新** — 該当ファイルを編集
5. **record のステータスを完了に更新**

詳細は `packages/docs/3_アイデア管理.md` を参照。

### 批判と修正案のループ

重要な判断や提案を受けるとき：

```
/critique <ファイル> → /propose <ファイル> → 採用
```

## スキルの管理

`packages/skills/` を編集したら以下で同期：

```bash
cd packages/skills
./deploy.sh
```

## テンプレートのテスト

実際のプロジェクトで `/monorepo-init` を試し、フィードバックを `in-progress/records/` に記録する。

詳細は `in-progress/records/0017-実際のプロジェクトでの導入テスト.md` を参照。

## ドキュメント

| ファイル | 内容 |
|---|---|
| [packages/docs/1_概要.md](./packages/docs/1_概要.md) | テンプレートで利用できる仕組みの概要 |
| [packages/docs/2_モノレポ構造.md](./packages/docs/2_モノレポ構造.md) | 2ゾーン構造とファイル配置方針 |
| [packages/docs/3_アイデア管理.md](./packages/docs/3_アイデア管理.md) | アイデア→実装のフロー |
| [CLAUDE.md](./CLAUDE.md) | Claude Code への指示（このリポジトリ固有） |

## 開発方針

- このリポジトリ自体が、配布するテンプレート構造を使って運用される
- 設計判断は `in-progress/records/` に記録し、採用後もステータスで追跡
- テンプレートの変更は実際のプロジェクトで試用してから確定

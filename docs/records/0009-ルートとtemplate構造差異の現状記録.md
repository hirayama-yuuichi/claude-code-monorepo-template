# 設計判断ログ

## 0009: ルートとtemplate/の構造差異の現状記録

- 日付: 2026-04-27
- 状態: 記録

### 背景

ルート配下（設計・管理リポジトリ）と `packages/template/`（配布テンプレートの実体）は同じディレクトリ構造を共有している部分が多い。両者の差異を整理し、今後の設計判断の基準とするために現状をスナップショットとして記録する。

### 判断

以下の差異を現状として記録する。

#### 共通構造

| パス | ルート | template/ |
|------|--------|-----------|
| `docs/` | ✅ | ✅ |
| `docs/records/` | ✅ | ✅ |
| `ideas/ideas.md` | ✅ | ✅ |
| `tasks/backlog.md` | ✅ | ✅ |
| `README.md` | ✅ | ✅ |
| `packages/` | ✅ | ✅ |

#### ルートにしかないもの

| パス | 用途 |
|------|------|
| `CLAUDE.md` | Claude Code 向け指示書 |
| `.claude/` | Claude Code 設定（skills 等） |
| `docs/bedrock-setup.md` | AWS Bedrock 固有のセットアップ |
| `docs/モノレポ案.md` | テンプレート設計方針メモ |
| `plan.md`（ルート直下） | `tasks/` の外にある（template は `tasks/plan.md`） |
| `_old/` | アーカイブ |
| `.gitignore` | バージョン管理設定 |

#### template/ にしかないもの

| パス | 用途 |
|------|------|
| `docs/architecture.md` | アーキテクチャドキュメント |
| `docs/setup.md` | セットアップガイド |
| `packages/package-a/` | サンプルパッケージ（spec/, plan.md, setup.md） |
| `packages/package-b/` | 空パッケージサンプル |

#### 構造上の非対称

- **`plan.md` の置き場所**：ルートはルート直下、template は `tasks/plan.md`
- **`docs/records/` の内容**：ルートは実際の ADR が複数存在、template は `0001-xxx.md` のプレースホルダーのみ
- **Claude Code 設定**：ルートのみに存在（`CLAUDE.md`, `.claude/`）

### 理由

設計方針を変更する際に「どちらを正とするか」「差異は意図的か」を判断する基準として、現時点の状態を明文化しておく必要があるため。

### 却下した選択肢

| 案 | 却下理由 |
|---|---|
| 差異を解消してミラーにする | ルートは管理用途、template は配布用途で役割が異なるため差異は自然 |

### 影響

- 今後の構造変更時にこの記録を参照して「意図的な差異か否か」を判断できる
- `plan.md` の置き場所の非対称（ルート直下 vs `tasks/plan.md`）は今後の統一候補として認識される

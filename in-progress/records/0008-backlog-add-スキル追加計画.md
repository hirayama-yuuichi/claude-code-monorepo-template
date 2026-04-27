# 設計判断ログ

## 0008: backlog.md フォーマット統一の手段選択（新仕様前提）

- 日付: 2026-04-27
- 状態: 採用
- [ ] docs/ 更新済み
- [ ] 実装済み

### 背景

`tasks/backlog.md` の仕様が以下に確定した：

```
# Backlog

> やること一覧。思いついたらここに見出しだけ書く。
> 詳細は records で検討する。
> 全体の進捗状況と完了状態を管理する。
> 完了が多くなったら backlog_old.md へ退避する。
> 優先度は表示順。

- タスクA（見出しのみ）
- タスクB

MM/DD
- 済 タスクC
```

この仕様を Claude が知らずに `backlog.md` を編集するとフォーマットが崩れる可能性がある。
フォーマットを担保する手段として、`/backlog-add` スキル新規作成と CLAUDE.md 直書きの2案を比較した。

### 判断

**CLAUDE.md にフォーマット仕様を直書きする**（スキル新規作成は行わない）。

具体的には、ルート `CLAUDE.md` の出力ルール表の「やること追加」行の「書き方」列に以下を記載する：

- 見出し1行のみ（詳細は `docs/records/` で検討）
- 完了したら `MM/DD` 見出し下に「済」付きで移動
- 完了が多くなったら `backlog_old.md` へ退避

あわせて `/records-add` SKILL.md Step 6 の「提案する」を「CLAUDE.md のフォーマット仕様に従って Claude が直接 backlog.md を編集する」に明確化する。

`packages/template/CLAUDE.md` は現時点で存在しないため、テンプレート展開時の初期ファイルに含めるかは別途判断する（`packages/template/` に CLAUDE.md を新規作成する場合は別 ADR で判断する）。

### 理由

- Claude は CLAUDE.md を常に読み込むため、スキル経由・直接編集を問わずフォーマットが適用される
- `/records-add` Step 6 との重複を解消できる（Step 6 が直接書く担い手として機能する）
- 実装コストが低く（CLAUDE.md と SKILL.md の2箇所の追記のみ）、実効性が高い
- フォーマット正本が CLAUDE.md に一元化され、将来の変更時も更新箇所が1箇所になる

### 却下した選択肢

| 案 | 却下理由 |
|---|---|
| `/backlog-add` スキルを新規作成する | Claude が直接 Edit で backlog.md を書く場合はスキルを素通りする。また `/records-add` Step 6 との役割が重複する |
| `/backlog-add` と `/backlog-done` を両方作成する | 上記に加えスキル数が増える。CLAUDE.md 直書きで代替できる |
| `/records-add` Step 6 を廃止し `/backlog-add` に委譲する | 構造が複雑になる割にメリットが薄い |

### 影響

**実施すること（優先順）**:

1. ルート `CLAUDE.md` の出力ルール表を更新し、backlog.md のフォーマット仕様（見出しのみ・完了管理・退避ルール）を追記する
2. `/records-add` SKILL.md Step 6 を「Claude が CLAUDE.md のフォーマット仕様に従って直接 backlog.md を編集する」に更新する（`packages/skills/records-add/SKILL.md` と `.claude/skills/records-add/SKILL.md` の両方）
3. `packages/template/tasks/backlog.md` は新仕様の文言に更新済み（本日実施済み）

**対象外（別途判断）**:
- `packages/template/CLAUDE.md` の新規作成（現時点で存在しないため）
- `plan.md` のスキル一覧への変更なし（`backlog-add` は追加しない）

# 設計判断ログ

## 0007: decision-add スキルを records-add にリネーム

- 日付: 2026-04-27
- 状態: 採用
- [ ] docs/ 更新済み
- [ ] 実装済み

### 背景

`decision-add` スキルは当初「設計判断（decision）」の記録を想定して命名した。
しかし実際には 0004（ドキュメント整備）や 0006（全体評価）のように、
「決定」以外の記録にも使うようになり、名前が実態と合わなくなった。

### 判断

`decision-add` → `records-add` にリネームする。

### 理由

- `docs/records/` ディレクトリ名と一致し直感的
- 「決定」に限らずあらゆる記録を対象にできる名前
- スキルの実態（連番採番・テンプレート生成）は変わらず、名前だけの変更

### 影響

- `packages/skills/decision-add/` → `packages/skills/records-add/`
- `.claude/skills/decision-add/` → `.claude/skills/records-add/`
- `plan.md` / `packages/skills/plan.md` のスキル一覧を更新
- トリガーが `/decision-add` → `/records-add` に変わる

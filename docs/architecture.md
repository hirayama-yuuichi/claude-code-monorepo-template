# アーキテクチャ

## パッケージ構成

```
/
├── CLAUDE.md                    ← Claude Code 向け出力ルール・採用ループ
├── README.md                    ← リポジトリ入口
├── docs/                        ← 完成・確定した情報（変化が遅いもの）
├── in-progress/                 ← 進行中のすべて（アイデア・backlog・計画・records）
│   ├── ideas.md
│   ├── backlog.md
│   ├── plan/
│   │   └── plan.md
│   └── recordss/
│       └── XXXX-*.md
└── packages/
    ├── skills/                  ← スキルの正本
    └── template/                ← 配布するモノレポテンプレートの実体
```

### packages/skills/

Claude Code スキル（`/recordss-add`・`/critique`・`/propose`・`/package-add`・`/monorepo-init`）の正本置き場。
`.claude/skills/` は `deploy.sh` で同期した複製であり、直接編集しない。

### packages/template/

展開先プロジェクトに配布するモノレポテンプレートの実体。
`degit` を使って展開する（`/monorepo-init` スキル参照）。

## 2ゾーン管理方針

完成・確定したものと進行中のものを2ゾーンに分ける。

| ゾーン | 置くもの |
|---|---|
| `docs/` | 確定した設計情報・手順書。変化が遅いもの |
| `in-progress/` | アイデア・backlog・計画・records。変化が速いもの |

records（`in-progress/recordss/`）は採用後も `in-progress/` に置いたまま、ステータスフィールドで反映状態を追跡する。
`docs/` に置くのは records の決定を反映済みの安定情報のみ。

## モノレポ運用方針

- スキルを編集したら `packages/skills/deploy.sh` を実行して `.claude/skills/` に同期する
- `packages/template/` を変更したときは `packages/template/docs/` と `packages/skills/` も合わせて更新する
- アーキテクチャ変更は先に `in-progress/recordss/` に記録してから実施する

# 全体計画

> パッケージ横断の話だけ書く。個別の実装詳細は `packages/<pkg>/plan.md` へ。

## 現在のフェーズ

Phase 2: package-a のコア実装

## マイルストーン

| 時期 | マイルストーン | 状態 |
|---|---|---|
| YYYY-MM | package-a MVP リリース | 進行中 |
| YYYY-MM | package-b 着手 | 未着手 |

## パッケージ間の依存・順序

```
package-a（先行）→ package-b（package-a に依存）
```

## 優先順位の根拠

- package-a を先に出す理由: [理由]
- package-b を後回しにする理由: [理由]

## 関連

- やること一覧: [backlog.md](./backlog.md)
- パッケージ別計画: `packages/<pkg>/plan.md`

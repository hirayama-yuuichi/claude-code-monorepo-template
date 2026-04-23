# データ構造・スキーマ

## [エンティティ名]

```ts
type Foo = {
  id: string       // [説明]
  name: string     // [説明]
  createdAt: Date  // [説明]
}
```

### 制約

- `id`: UUID v4
- `name`: 1〜100文字

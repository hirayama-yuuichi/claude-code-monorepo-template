# API仕様

## `foo(options)`

[説明]

### 引数

| 名前 | 型 | 必須 | 説明 |
|---|---|---|---|
| `options.bar` | `string` | ✓ | [説明] |

### 戻り値

`Promise<Result>`

### 例

```ts
const result = await foo({ bar: 'baz' })
```

### エラー

| エラー | 条件 |
|---|---|
| `ValidationError` | [条件] |

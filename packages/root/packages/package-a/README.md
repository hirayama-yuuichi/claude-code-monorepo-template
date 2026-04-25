# package-a

[このパッケージが何をするか、一言で]

## 使い方

```ts
import { foo } from 'package-a'

foo()
```

## 依存関係

| パッケージ | 理由 |
|---|---|
| package-b | [理由] |

## 開発

```bash
pnpm --filter package-a dev
pnpm --filter package-a test
```

仕様は [spec/](./spec/) を参照。

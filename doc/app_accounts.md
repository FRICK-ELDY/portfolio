## accountsアプリの設計と構築
- 目的
  - カウントの登録・認証・セッション管理をAshで効率的に実現する
  - Ash Authentication拡張機能を利用して認証を簡潔に実装する
- 構成
```
accounts/
├── lib/
│   └── accounts/
│       ├── resources/
│       │   ├── user.ex
│       │   ├── credential.ex
│       │   ├── profile.ex
│       │   └── session.ex
│       ├── accounts.ex         # Ash API
│       └── registry.ex         # Ashリソース登録
├── priv/
│   └── repo/
│       └── migrations/
│           └── *.exs
├── mix.exs
```

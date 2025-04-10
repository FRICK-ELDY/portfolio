umbrella/
├── apps/
│   ├── shared/        # 共通ロジック・Gettext・バリデーションなど
│   ├── top/           # トップページ・静的UI（LiveView）
│   ├── accounts/      # アカウント管理（Ash）
│   ├── inquiry/       # お仕事依頼フォーム（依頼の受付・管理）
│   │   └── Inquiry    # Ash Resource: name, email, message, statusなど
│   │   └── InquiryWeb # LiveView/HTMLでフォームや一覧表示
│   ├── payment/       # Stripe決済など（Ash）
│   ├── subscription/  # プラン管理、契約状態、LiveView画面、Patronページ
│   ├── blog/          # 
│   ├── shop/          # 商品閲覧・カート・購入体験（LiveView + Ash）
│   ├── download/      # 購入済みデータのダウンロード


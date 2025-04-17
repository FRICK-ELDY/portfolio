project-root/
├── README.md
├── .env
├── .gitignore
├── compose.yml
│
├── .github/workflows/
│   ├── ci.yml
│   ├── cd.yml
│
├── prod/
│   ├── compose.prod.yml
│   ├── nginx/
│   │   ├── nginx.prod.conf
│   ├── systemd
│   │   ├── certbot-renew.service
│   │   ├── certbot-renew.timer
│
├── umbrella/
│   ├── apps/
│   │   ├── shared/        # 共通ロジック・Gettext・バリデーションなど
│   │   ├── top/           # トップページ・静的UI（LiveView）
│   │   ├── inquiry/       # お仕事依頼フォーム（依頼の受付・管理）(Ecto)
│   │   │   ├── Inquiry    # name, email, message, statusなど
│   │   │   └── InquiryWeb # LiveView/HTMLでフォームや一覧表示
│   │   ├── accounts/      # アカウント管理（Ash）
│   │   ├── payment/       # Stripe決済など（Ash）
│   │   ├── patron/        # プラン管理、契約状態、LiveView画面、Patronページ
│   │   ├── booth/         # 商品閲覧・カート・購入体験（LiveView + Ash）
│   │   ├── download/      # 購入済みデータのダウンロード
│   │   ├── blog/          # Earmark + NimblePublisher
│   │
├── doc/
│ 

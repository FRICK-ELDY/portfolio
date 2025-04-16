## 新規サブアプリ作成
```
cd umbrella
mix phx.new apps/inquiry --no-html --no-dashboard --no-mailer --no-gettext --module Inquiry --app inquiry
cd apps/inquiry/assets
npm init -y
npm install --save-dev esbuild
```

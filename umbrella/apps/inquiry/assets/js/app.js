import "phoenix_html"
import {Socket} from "phoenix"
import topbar from "topbar"
import {LiveSocket} from "phoenix_live_view"

// CSRF トークン取得
let csrfToken = document
  .querySelector("meta[name='csrf-token']")
  ?.getAttribute("content") || ""

// LiveSocket 初期化
let liveSocket = new LiveSocket("/inquiry_live", Socket, {
  params: () => ({ _csrf_token: csrfToken }),
})

// topbar の読み込み（ロード中アニメーション）
topbar.config({barColors: {0: "#FD4F00"}, shadowColor: "rgba(0, 0, 0, .3)"})

window.addEventListener("phx:page-loading-start", _info => topbar.show())
window.addEventListener("phx:page-loading-stop", _info => topbar.hide())

// 接続
liveSocket.connect()

// デバッグ用に expose
window.liveSocket = liveSocket

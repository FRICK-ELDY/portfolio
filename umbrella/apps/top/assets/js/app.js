import "phoenix_html"
import {Socket} from "phoenix"
import {LiveSocket} from "phoenix_live_view"
import topbar from "../vendor/topbar"

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
let liveSocketPath = "/top/live"
if (window.location.pathname.startsWith("/inquiry")) {
  liveSocketPath = "/inquiry/live"
}
let liveSocket = new LiveSocket(liveSocketPath, Socket, {
  longPollFallbackMs: 2500,
  params: {_csrf_token: csrfToken}
})

topbar.config({barColors: {0: "#29d"}, shadowColor: "rgba(0, 0, 0, .3)"})
window.addEventListener("phx:page-loading-start", _info => topbar.show(300))
window.addEventListener("phx:page-loading-stop", _info => topbar.hide())

liveSocket.connect()

window.liveSocket = liveSocket

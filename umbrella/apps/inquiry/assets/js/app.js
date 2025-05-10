import "phoenix_html"
import {Socket} from "phoenix"
import topbar from "topbar"
import {LiveSocket} from "phoenix_live_view"

let csrfToken = document
  .querySelector("meta[name='csrf-token']")
  ?.getAttribute("content") || ""

let liveSocketPath = "/inquiry/live"
if (window.location.pathname.startsWith("/")) {
  liveSocketPath = "/top/live"
}
let liveSocket = new LiveSocket("/inquiry/live", Socket, {
  params: () => ({ _csrf_token: csrfToken }),
})

topbar.config({barColors: {0: "#FD4F00"}, shadowColor: "rgba(0, 0, 0, .3)"})

window.addEventListener("phx:page-loading-start", _info => topbar.show())
window.addEventListener("phx:page-loading-stop", _info => topbar.hide())

liveSocket.connect()

window.liveSocket = liveSocket

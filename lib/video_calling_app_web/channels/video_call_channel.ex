defmodule VideoCallingAppWeb.VideoCallChannel do
  use Phoenix.Channel

  def join("video_call:lobby", _params, socket) do
    {:ok, socket}
  end

  def handle_in("offer", %{"sdp" => sdp, "to" => to}, socket) do
    broadcast!(socket, "offer:#{to}", %{"sdp" => sdp, "from" => socket.assigns.user_id})
    {:noreply, socket}
  end

    def handle_in("call", %{"to" => to}, socket) do
    broadcast!(socket, "call:#{to}", %{"to" => to})
    {:noreply, socket}
  end

  def handle_in("answer", %{"sdp" => sdp, "to" => to}, socket) do
    broadcast!(socket, "answer:#{to}", %{"sdp" => sdp, "from" => socket.assigns.user_id})
    {:noreply, socket}
  end

  def handle_in("ice-candidate", %{"candidate" => candidate, "to" => to}, socket) do
    broadcast!(socket, "ice-candidate:#{to}", %{"candidate" => candidate, "from" => socket.assigns.user_id})
    {:noreply, socket}
  end
end

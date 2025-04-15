defmodule TopWeb.AboutLive do
  use TopWeb, :live_view

  def render(assigns), do: Phoenix.View.render(TopWeb.AboutLiveView, "main.html", assigns)

  @image_sets [
    %{
      name: "ワールド",
      current_index: 0,
      images: [
        %{title: "月華蝶", url: "./images/world/moonflower_butterfly.png"},
        %{title: "ステラ", url: "./images/world/stela.png"},
        %{title: "幻想的な世界に浸る", url: "./images/world/you_in_a_fantastic_world.png"},
        %{title: "銀河", url: "./images/world/galaxy.png"},
        %{title: "鳥かごの癒し", url: "./images/world/bird_cage_healing.png"},
        %{title: "屋上での思い出", url: "./images/world/memories_on_the rooftop.png"},
        %{title: "クジラと波", url: "./images/world/whale_and_waves.png"},
        %{title: "夕暮れと共に", url: "./images/world/with_the_dusk.png"},
        %{title: "4-7-8 Deep Breath", url: "./images/world/4-7-8_Deep_Breath.png"}
      ]
    },
    %{
      name: "アバター",
      current_index: 0,
      images: [
        %{title: "moonflower_butterfly", url: "./images/world/moonflower_butterfly.png"},
        %{title: "stela", url: "./images/world/stela.png"},
        %{title: "you_in_a_fantastic_world", url: "./images/world/you_in_a_fantastic_world.png"}
      ]
    }
  ]

  def mount(params, session, socket) do
    locale = params["locale"] || session["locale"]
    Gettext.put_locale(Shared.Gettext, locale)

    socket =
      socket
      |> assign(:page_title, "About")
      |> assign(:locale, locale)
      |> assign(:image_sets, @image_sets)
      |> assign(:message, TopWeb.AboutLiveView.t("Peace of mind from prototype to production."))

    {:ok, socket}
  end

  def handle_event("prev", %{"set_index" => set_index_str}, socket) do
    set_index = String.to_integer(set_index_str)
    image_sets = socket.assigns.image_sets

    new_image_sets =
      update_current_index(image_sets, set_index, fn set ->
        new_idx =
          if set.current_index == 0 do
            length(set.images) - 1
          else
            set.current_index - 1
          end

        %{set | current_index: new_idx}
      end)

    {:noreply, assign(socket, :image_sets, new_image_sets)}
  end

  def handle_event("next", %{"set_index" => set_index_str}, socket) do
    set_index = String.to_integer(set_index_str)
    image_sets = socket.assigns.image_sets

    new_image_sets =
      update_current_index(image_sets, set_index, fn set ->
        new_idx = rem(set.current_index + 1, length(set.images))
        %{set | current_index: new_idx}
      end)

    {:noreply, assign(socket, :image_sets, new_image_sets)}
  end

  def handle_event(
        "jump",
        %{"set_index" => set_index_str, "slide_index" => slide_index_str},
        socket
      ) do
    set_index = String.to_integer(set_index_str)
    slide_index = String.to_integer(slide_index_str)

    image_sets = socket.assigns.image_sets

    new_image_sets =
      update_current_index(image_sets, set_index, fn set ->
        max_idx = length(set.images) - 1

        valid_index =
          slide_index
          |> max(0)
          |> min(max_idx)

        %{set | current_index: valid_index}
      end)

    {:noreply, assign(socket, :image_sets, new_image_sets)}
  end

  defp update_current_index(image_sets, set_index, update_fn) do
    List.update_at(image_sets, set_index, fn set ->
      update_fn.(set)
    end)
  end
end

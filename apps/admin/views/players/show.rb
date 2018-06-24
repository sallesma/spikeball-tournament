module Admin::Views::Players
  class Show
    include Admin::View

    def link_to_destroy(player)
      html.form(action: routes.player_path(player.id), method: "POST") do
        input(type: "hidden", name: "_method",  value: "DELETE")
        input(type: "submit", value: "Destroy")
      end
    end
  end
end

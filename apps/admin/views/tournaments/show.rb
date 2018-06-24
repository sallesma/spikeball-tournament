module Admin::Views::Tournaments
  class Show
    include Admin::View

    def link_to_destroy(tournament)
      html.form(action: routes.tournament_path(tournament.id), method: "POST") do
        input(type: "hidden", name: "_method",  value: "DELETE")
        input(type: "submit", value: "Destroy")
      end
    end
  end
end

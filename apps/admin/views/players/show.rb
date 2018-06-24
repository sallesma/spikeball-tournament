module Admin::Views::Players
  class Show
    include Admin::View

    def link_to_players
      link_to 'Players list', routes.players_path
    end
  end
end

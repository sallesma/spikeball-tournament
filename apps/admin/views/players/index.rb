module Admin::Views::Players
  class Index
    include Admin::View

    def link_to_player(player)
      link_to 'Show', routes.player_path(player.id)
    end

    def link_to_new_player
      link_to 'Add a player', routes.new_player_path
    end

    def full_name(player)
      "#{player.first_name} #{player.last_name}"
    end
  end
end

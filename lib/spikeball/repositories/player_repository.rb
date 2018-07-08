class PlayerRepository < Hanami::Repository
  associations do
    has_many :registrations
    has_many :tournaments, through: :registrations
  end

  def find_with_tournaments(id)
    aggregate(:tournaments).where(id: id).map_to(Player).one
  end
end

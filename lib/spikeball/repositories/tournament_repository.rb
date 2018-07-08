class TournamentRepository < Hanami::Repository
  associations do
    has_many :registrations
    has_many :players, through: :registrations
  end

  def find_with_players(id)
    aggregate(:players).where(id: id).map_to(Tournament).one
  end
end

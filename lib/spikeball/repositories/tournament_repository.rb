class TournamentRepository < Hanami::Repository
  associations do
    has_many :registrations
    has_many :players, through: :registrations
  end
end

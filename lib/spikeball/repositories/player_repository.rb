class PlayerRepository < Hanami::Repository
  associations do
    has_many :registrations
    has_many :tournaments, through: :registrations
  end
end

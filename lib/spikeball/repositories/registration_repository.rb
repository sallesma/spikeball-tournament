class RegistrationRepository < Hanami::Repository
  associations do
    belongs_to :tournament
    belongs_to :player
  end
end

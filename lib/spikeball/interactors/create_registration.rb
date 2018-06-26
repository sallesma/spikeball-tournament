require 'hanami/interactor'

class CreateRegistration
  include Hanami::Interactor

  expose :registration, :player

  def initialize(tournament)
    @tournament = tournament
  end

  def call(registration_attributes)
    player_attributes = registration_attributes[:player]
    @player = PlayerRepository.new.create(player_attributes)
    @registration = RegistrationRepository.new.create(
      tournament_id: @tournament.id,
      player_id: @player.id
    )
  end
end

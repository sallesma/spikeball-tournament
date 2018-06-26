require 'spec_helper'

describe CreateRegistration do
  let(:interactor) { CreateRegistration.new(tournament) }
  let(:registration_attributes) do
    {
      player: {
        first_name: 'George',
        last_name: 'Abitbol',
        email: 'george@spikeball.com'
      }
    }
  end
  let(:repository) { RegistrationRepository.new }
  let(:tournament_repository) { TournamentRepository.new }
  let(:tournament) { tournament_repository.create(name: 'Coupe', date: Date.today) }

  after do
    repository.clear
    tournament_repository.clear
  end

  describe "good input" do
    let(:result) { interactor.call(registration_attributes) }

    it "succeeds" do
      result.success?.must_equal true
    end

    it "creates a Player with correct attributes" do
      result.player.first_name.must_equal 'George'
      result.player.last_name.must_equal 'Abitbol'
      result.player.email.must_equal 'george@spikeball.com'
      assert result.player.id != nil
    end

    it "creates a Registration with correct tournament and player" do
      result.registration.player_id.must_equal result.player.id
      result.registration.tournament_id.must_equal tournament.id
      assert result.registration.id != nil
    end
  end
end

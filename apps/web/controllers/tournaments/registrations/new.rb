module Web::Controllers::Tournaments::Registrations
  class New
    include Web::Action

    expose :tournament

    def call(params)
      @tournament = TournamentRepository.new.find(params[:tournament_id])
    end
  end
end

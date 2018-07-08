module Web::Controllers::Tournaments
  class Show
    include Web::Action

    expose :tournament

    def call(params)
      @tournament = TournamentRepository.new.find_with_players(params[:id])
    end
  end
end

module Web::Controllers::Tournaments
  class Show
    include Web::Action

    expose :tournament

    def call(params)
      @tournament = TournamentRepository.new.find(params[:id])
    end
  end
end

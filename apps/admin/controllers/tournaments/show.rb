module Admin::Controllers::Tournaments
  class Show
    include Admin::Action

    expose :tournament

    def call(params)
      @tournament = TournamentRepository.new.find(params[:id])
    end
  end
end

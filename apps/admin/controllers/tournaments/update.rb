module Admin::Controllers::Tournaments
  class Update
    include Admin::Action

    expose :tournament

    params do
      required(:id).filled
      required(:tournament).schema do
        required(:name).filled(:str?)
        required(:date).filled(:date?)
      end
    end

    def call(params)
      if params.valid?
        @tournament = TournamentRepository.new.update(params[:id], params[:tournament])

        redirect_to routes.tournament_path(tournament.id)
      else
        @tournament = TournamentRepository.new.find(params[:id])

        self.status = 422
      end
    end
  end
end

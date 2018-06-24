module Admin::Controllers::Tournaments
  class Create
    include Admin::Action

    expose :tournament

    params do
      required(:tournament).schema do
        required(:name).filled(:str?)
        required(:date).filled(:date?)
      end
    end

    def call(params)
      if params.valid?
        TournamentRepository.new.create(params[:tournament])

        redirect_to routes.tournaments_path
      else
        self.status = 422
      end
    end
  end
end

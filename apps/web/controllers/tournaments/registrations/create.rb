module Web::Controllers::Tournaments::Registrations
  class Create
    include Web::Action

    expose :tournament

    params do
      required(:tournament_id).filled(:int?)
      required(:registration).schema do
        required(:player).schema do
          required(:first_name).filled(:str?)
          required(:last_name).filled(:str?)
          required(:email).filled(:str?)
        end
      end
    end

    def call(params)
      @tournament = TournamentRepository.new.find(params[:tournament_id])

      if params.valid?
        CreateRegistration.new(@tournament).call(params[:registration])

        redirect_to routes.tournament_path(@tournament.id)
      else
        self.status = 422
      end
    end
  end
end

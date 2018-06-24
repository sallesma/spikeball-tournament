module Admin::Controllers::Players
  class Update
    include Admin::Action

    expose :player

    params do
      required(:id).filled
      required(:player).schema do
        required(:first_name).filled(:str?)
        required(:last_name).filled(:str?)
        required(:email).filled(:str?)
      end
    end

    def call(params)
      if params.valid?
        @player = PlayerRepository.new.update(params[:id], params[:player])

        redirect_to routes.player_path(player.id)
      else
        @player = PlayerRepository.new.find(params[:id])

        self.status = 422
      end
    end
  end
end

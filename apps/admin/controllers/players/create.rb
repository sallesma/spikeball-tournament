module Admin::Controllers::Players
  class Create
    include Admin::Action

    expose :player

    params do
      required(:player).schema do
        required(:first_name).filled(:str?)
        required(:last_name).filled(:str?)
        required(:email).filled(:str?)
      end
    end

    def call(params)
      if params.valid?
        PlayerRepository.new.create(params[:player])

        redirect_to '/admin/players'
      else
        self.status = 422
      end
    end
  end
end

module Admin::Controllers::Players
  class Create
    include Admin::Action

    def call(params)
      PlayerRepository.new.create(params[:player])

      redirect_to '/admin/players'
    end
  end
end

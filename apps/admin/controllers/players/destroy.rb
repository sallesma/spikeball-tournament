module Admin::Controllers::Players
  class Destroy
    include Admin::Action

    def call(params)
      PlayerRepository.new.delete(params[:id])

      redirect_to routes.players_path
    end
  end
end

module Admin::Controllers::Tournaments
  class Destroy
    include Admin::Action

    def call(params)
      TournamentRepository.new.delete(params[:id])

      redirect_to routes.tournaments_path
    end
  end
end

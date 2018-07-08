module Web::Controllers::Players
  class Show
    include Web::Action

    expose :player

    def call(params)
      @player = PlayerRepository.new.find_with_tournaments(params[:id])
    end
  end
end

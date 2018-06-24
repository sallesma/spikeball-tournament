module Admin::Controllers::Players
  class Show
    include Admin::Action

    expose :player

    def call(params)
      @player = PlayerRepository.new.find(params[:id])
    end
  end
end

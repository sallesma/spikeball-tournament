module Admin::Controllers::Players
  class Edit
    include Admin::Action

    expose :player

    def call(params)
      @player = PlayerRepository.new.find(params[:id])
    end
  end
end

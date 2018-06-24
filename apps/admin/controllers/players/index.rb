module Admin::Controllers::Players
  class Index
    include Admin::Action

    expose :players

    def call(params)
      @players = PlayerRepository.new.all
    end
  end
end

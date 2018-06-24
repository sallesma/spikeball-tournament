module Web::Controllers::Players
  class Index
    include Web::Action

    expose :players

    def call(params)
      @players = PlayerRepository.new.all
    end
  end
end

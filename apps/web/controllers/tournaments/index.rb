module Web::Controllers::Tournaments
  class Index
    include Web::Action

    expose :tournaments

    def call(params)
      @tournaments = TournamentRepository.new.all
    end
  end
end

module Admin::Controllers::Tournaments
  class Index
    include Admin::Action

    expose :tournaments

    def call(params)
      @tournaments = TournamentRepository.new.all
    end
  end
end

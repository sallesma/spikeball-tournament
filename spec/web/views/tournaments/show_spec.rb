require_relative '../../../spec_helper'

describe Web::Views::Tournaments::Show do
  let(:template)  { Hanami::View::Template.new('apps/web/templates/tournaments/show.html.haml') }
  let(:tournament)    { Tournament.new(id: 1, name: 'Coupe', date: Date.today, players: []) }
  let(:exposures) { Hash[tournament: tournament] }
  let(:view)      { Web::Views::Tournaments::Show.new(template, exposures) }

  it 'exposes #tournament' do
    view.tournament.must_equal exposures.fetch(:tournament)
  end

  describe 'when there are tournaments' do
    let(:rendered)  { view.render }

    it 'shows the tournament' do
      rendered.scan(/class='tournament'/).count.must_equal 1
      rendered.must_include('Coupe')
      rendered.must_include(Date.today.to_s)
    end
  end
end

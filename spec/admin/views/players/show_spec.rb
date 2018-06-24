require_relative '../../../spec_helper'

describe Admin::Views::Players::Show do
  let(:player)     { Player.new(id: 1,first_name: 'George', last_name: 'Abitbol', email: 'george@spikeball.com') }
  let(:exposures) { Hash[player: player] }
  let(:template)  { Hanami::View::Template.new('apps/admin/templates/players/show.html.haml') }
  let(:view)      { Admin::Views::Players::Show.new(template, exposures) }

  it 'exposes #player' do
    view.player.must_equal exposures.fetch(:player)
  end

  describe 'when there are players' do
    let(:rendered)  { view.render }

    it 'shows the player' do
      rendered.scan(/class='player'/).count.must_equal 1
      rendered.must_include('George')
      rendered.must_include('Abitbol')
    end
  end

  describe '#link_to_players' do
    it 'returns link to players list' do
      link = view.link_to_players
      link.to_s.must_equal '<a href="/admin/players">Players list</a>'
    end
  end
end

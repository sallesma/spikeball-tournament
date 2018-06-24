require_relative '../../../spec_helper'

describe Admin::Views::Players::Show do
  let(:player)    { Player.new(id: 1,first_name: 'George', last_name: 'Abitbol', email: 'george@spikeball.com') }
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

  describe '#link_to_destroy' do
    it 'returns link to players list' do
      link = view.link_to_destroy(player)
      link.to_s.must_equal (
        '<form action="/admin/players/1" method="POST">' + "\n" +
          '<input type="hidden" name="_method" value="DELETE">' + "\n" +
          '<input type="submit" value="Destroy">' + "\n" +
        '</form>'
      )
    end
  end
end

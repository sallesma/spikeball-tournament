require_relative '../../../spec_helper'

describe Admin::Views::Players::Index do
  let(:exposures) { Hash[players: []] }
  let(:template)  { Hanami::View::Template.new('apps/admin/templates/players/index.html.erb') }
  let(:view)      { Admin::Views::Players::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #players' do
    view.players.must_equal exposures.fetch(:players)
  end

  describe 'when there are no players' do
    it 'shows a placeholder message' do
      rendered.must_include('<p class="placeholder">There are no players yet.</p>')
    end
  end

  describe 'when there are players' do
    let(:player1)     { Player.new(first_name: 'George', last_name: 'Abitbol', email: 'george@spikeball.com') }
    let(:player2)     { Player.new(first_name: 'Noel', last_name: 'Flantier', email: 'noel@spikeball.com') }
    let(:exposures) { Hash[players: [player1, player2]] }

    it 'lists them all' do
      rendered.scan(/class="player"/).count.must_equal 2
      rendered.must_include('George')
      rendered.must_include('Noel')
    end

    it 'hides the placeholder message' do
      rendered.wont_include('<p class="placeholder">There are no players yet.</p>')
    end
  end
end

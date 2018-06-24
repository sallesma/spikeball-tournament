require_relative '../../../spec_helper'

describe Web::Views::Players::Index do
  let(:exposures) { Hash[players: []] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/players/index.html.haml') }
  let(:view)      { Web::Views::Players::Index.new(template, exposures) }

  it 'exposes #players' do
    view.players.must_equal exposures.fetch(:players)
  end

  describe 'rendering' do
    let(:rendered)  { view.render }

    describe 'when there are no players' do
      it 'shows a placeholder message' do
        rendered.must_include('There are no players yet.')
      end
    end

    describe 'when there are players' do
      let(:player1)     { Player.new(id: 1,first_name: 'George', last_name: 'Abitbol', email: 'george@spikeball.com') }
      let(:player2)     { Player.new(id: 2,first_name: 'Noel', last_name: 'Flantier', email: 'noel@spikeball.com') }
      let(:exposures) { Hash[players: [player1, player2]] }

      it 'lists them all' do
        rendered.scan(/class='player'/).count.must_equal 2
        rendered.must_include('George')
        rendered.must_include('Noel')
      end

      it 'hides the placeholder message' do
        rendered.wont_include('<p class="placeholder">There are no players yet.</p>')
      end
    end
  end
end

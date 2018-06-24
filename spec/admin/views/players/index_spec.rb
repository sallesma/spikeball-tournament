require_relative '../../../spec_helper'

describe Admin::Views::Players::Index do
  let(:exposures) { Hash[players: []] }
  let(:template)  { Hanami::View::Template.new('apps/admin/templates/players/index.html.haml') }
  let(:view)      { Admin::Views::Players::Index.new(template, exposures) }

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

  describe '#link_to_player' do
    let(:player) { Player.new(id: 1, first_name: 'George', last_name: 'Abitbol', email: 'george@spikeball.com') }
    let(:exposures) { Hash[players: [player]] }

    it 'returns link to special player' do
      link = view.link_to_player(player)
      link.to_s.must_equal '<a href="/admin/players/1">Show</a>'
    end
  end

  describe '#link_to_edit_player' do
    let(:player) { Player.new(id: 1, first_name: 'George', last_name: 'Abitbol', email: 'george@spikeball.com') }
    let(:exposures) { Hash[players: [player]] }

    it 'returns link to special player' do
      link = view.link_to_edit_player(player)
      link.to_s.must_equal '<a href="/admin/players/1/edit">Edit</a>'
    end
  end

  describe '#link_to_new_ player' do
    it 'returns link to special player' do
      link = view.link_to_new_player
      link.to_s.must_equal '<a href="/admin/players/new">Add a player</a>'
    end
  end

  describe '#full_name' do
    let(:player) { Player.new(id: 1, first_name: 'George', last_name: 'Abitbol', email: 'george@spikeball.com') }
    let(:exposures) { Hash[players: [player]] }

    it 'returns the full name' do
      view.full_name(player).must_equal 'George Abitbol'
    end
  end
end

require_relative '../../../spec_helper'

describe Admin::Views::Tournaments::Index do
  let(:exposures) { Hash[tournaments: []] }
  let(:template)  { Hanami::View::Template.new('apps/admin/templates/tournaments/index.html.haml') }
  let(:view)      { Admin::Views::Tournaments::Index.new(template, exposures) }

  it 'exposes #tournaments' do
    view.tournaments.must_equal exposures.fetch(:tournaments)
  end

  describe 'rendering' do
    let(:rendered)  { view.render }

    describe 'when there are no tournaments' do
      it 'shows a placeholder message' do
        rendered.must_include('There are no tournaments yet.')
      end
    end

    describe 'when there are tournaments' do
      let(:tournament1)     { Tournament.new(id: 1,name: 'Coupe', date: Date.today) }
      let(:tournament2)     { Tournament.new(id: 2,name: 'Competition', date: Date.today + 1) }
      let(:exposures) { Hash[tournaments: [tournament1, tournament2]] }

      it 'lists them all' do
        rendered.scan(/class='tournament'/).count.must_equal 2
        rendered.must_include('Coupe')
        rendered.must_include('Competition')
      end

      it 'hides the placeholder message' do
        rendered.wont_include('<p class="placeholder">There are no tournaments yet.</p>')
      end
    end
  end
end

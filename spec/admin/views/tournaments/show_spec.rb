require_relative '../../../spec_helper'

describe Admin::Views::Tournaments::Show do
  let(:tournament)    { Tournament.new(id: 1,name: 'Coupe', date: Date.today) }
  let(:exposures) { Hash[tournament: tournament] }
  let(:template)  { Hanami::View::Template.new('apps/admin/templates/tournaments/show.html.haml') }
  let(:view)      { Admin::Views::Tournaments::Show.new(template, exposures) }

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

  describe '#link_to_destroy' do
    it 'returns link to tournaments list' do
      link = view.link_to_destroy(tournament)
      link.to_s.must_equal (
        '<form action="/admin/tournaments/1" method="POST">' + "\n" +
          '<input type="hidden" name="_method" value="DELETE">' + "\n" +
          '<input type="submit" value="Destroy">' + "\n" +
        '</form>'
      )
    end
  end
end

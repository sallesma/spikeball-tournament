require_relative '../../../spec_helper'

describe Admin::Views::Tournaments::Update do
  let(:tournament)    { Tournament.new(id: 1, name: 'Coupe', date: Date.today) }
  let(:exposures) { Hash[format: :html, tournament: tournament] }
  let(:template)  { Hanami::View::Template.new('apps/admin/templates/tournaments/edit.html.haml') }
  let(:view)      { Admin::Views::Tournaments::Update.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #format' do
    view.format.must_equal exposures.fetch(:format)
  end
end

require_relative '../../../spec_helper'

describe Admin::Views::Players::Update do
  let(:player)    { Player.new(id: 1,first_name: 'George', last_name: 'Abitbol', email: 'george@spikeball.com') }
  let(:exposures) { Hash[format: :html, player: player] }
  let(:template)  { Hanami::View::Template.new('apps/admin/templates/players/edit.html.haml') }
  let(:view)      { Admin::Views::Players::Update.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #format' do
    view.format.must_equal exposures.fetch(:format)
  end
end

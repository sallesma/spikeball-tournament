require_relative '../../../spec_helper'

describe Admin::Views::Players::New do
  let(:exposures) { Hash[format: :html] }
  let(:template)  { Hanami::View::Template.new('apps/admin/templates/players/new.html.erb') }
  let(:view)      { Admin::Views::Players::New.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #format' do
    view.format.must_equal exposures.fetch(:format)
  end
end

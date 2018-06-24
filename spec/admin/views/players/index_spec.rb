require_relative '../../../spec_helper'

describe Admin::Views::Players::Index do
  let(:exposures) { Hash[format: :html] }
  let(:template)  { Hanami::View::Template.new('apps/admin/templates/players/index.html.erb') }
  let(:view)      { Admin::Views::Players::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #format' do
    view.format.must_equal exposures.fetch(:format)
  end
end

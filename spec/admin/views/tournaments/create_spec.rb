require_relative '../../../spec_helper'

describe Admin::Views::Tournaments::Create do
  let(:exposures) { Hash[format: :html] }
  let(:template)  { Hanami::View::Template.new('apps/admin/templates/tournaments/new.html.haml') }
  let(:view)      { Admin::Views::Tournaments::Create.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #format' do
    view.format.must_equal exposures.fetch(:format)
  end
end

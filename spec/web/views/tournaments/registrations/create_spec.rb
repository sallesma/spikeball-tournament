require_relative '../../../../spec_helper'

describe Web::Views::Tournaments::Registrations::Create do
  let(:exposures) { Hash[format: :html] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/tournaments/registrations/new.html.haml') }
  let(:view)      { Web::Views::Tournaments::Registrations::Create.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #format' do
    view.format.must_equal exposures.fetch(:format)
  end
end

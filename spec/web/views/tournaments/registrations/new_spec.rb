require_relative '../../../../spec_helper'

describe Web::Views::Tournaments::Registrations::New do
  let(:tournament)    { Tournament.new(id: 1, name: 'Coupe', date: Date.today) }
  let(:exposures) { Hash[format: :html, params: params, tournament: tournament] }
  let(:params)    { OpenStruct.new(valid?: false, error_messages: ['Date must be valid']) }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/tournaments/registrations/new.html.haml') }
  let(:view)      { Web::Views::Tournaments::Registrations::New.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #format' do
    view.format.must_equal exposures.fetch(:format)
  end

  it 'displays list of errors when params contains errors' do
    rendered.must_include('There was a problem with your submission')
    rendered.must_include('Date must be valid')
  end
end

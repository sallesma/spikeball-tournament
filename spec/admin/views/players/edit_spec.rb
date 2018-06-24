require_relative '../../../spec_helper'

describe Admin::Views::Players::Edit do
  let(:player)     { Player.new(id: 1,first_name: 'George', last_name: 'Abitbol', email: 'george@spikeball.com') }
  let(:params)    { OpenStruct.new(valid?: false, error_messages: ['First Name must be filled', 'Last Name must be filled', 'Email must be filled']) }
  let(:exposures) { Hash[format: :html, params: params, player: player] }
  let(:template)  { Hanami::View::Template.new('apps/admin/templates/players/edit.html.haml') }
  let(:view)      { Admin::Views::Players::Edit.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #format' do
    view.format.must_equal exposures.fetch(:format)
  end

  it 'displays list of errors when params contains errors' do
    rendered.must_include('There was a problem with your submission')
    rendered.must_include('First Name must be filled')
    rendered.must_include('Last Name must be filled')
    rendered.must_include('Email must be filled')
  end
end

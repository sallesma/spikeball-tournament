require_relative '../../../spec_helper'

describe Admin::Controllers::Tournaments::New do
  let(:action) { Admin::Controllers::Tournaments::New.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end

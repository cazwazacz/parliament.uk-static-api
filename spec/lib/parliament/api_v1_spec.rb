require 'spec_helper'
require 'rack/test'

RSpec.describe Parliament::APIv1 do
  include Rack::Test::Methods

  def app
    Rack::Builder.new do
      run Parliament::APIv1
    end
  end

  def assert_last_response_matches(expected_data)
    data = JSON.parse(last_response.body)
    data.delete('information') # this is the v1 API deprecation notice.
    expect(data).to eq(expected_data)
  end

  before do
    # before
  end

  describe 'GET /parties' do
    before do
      get '/parties'
    end

    it 'returns a 200 status' do
      expect(last_response.status).to eq(200)
    end
  end
end

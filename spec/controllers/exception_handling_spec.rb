require 'spec_helper'

describe ExceptionController, type: :controller do
  it 'handles exception' do
    client = Raven.client
    expect(client).to receive(:send) { true }

    expect { get :index }.to raise_error
  end
end

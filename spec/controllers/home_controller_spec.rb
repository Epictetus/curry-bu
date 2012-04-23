require 'spec_helper'

describe HomeController do
  describe "GET /" do
    describe :routes do
      subject { { get: "/" } }
      it { should route_to(controller: "home", action: "index") }
    end

    before { get :index }

    describe :response do
      subject { response }
      it { should be_success }
    end
  end
end

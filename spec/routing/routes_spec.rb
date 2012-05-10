# coding: utf-8
require 'spec_helper'

describe :routes do

  describe "shops" do

    describe "GET /shops" do
      subject { { get: "/shops" } }
      it { should route_to("shops#index") }
    end

    describe "GET /shops/new" do
      subject { { get: "/shops/new" } }
      it { should route_to("shops#new") }
    end

    describe "POST /shops" do
      subject { { post: "/shops" } }
      it { should route_to("shops#create") }
    end

    describe "GET /shops/1" do
      subject { { get: "/shops/1" } }
      it { should route_to("shops#show", id: '1') }
    end

    describe "GET /shops/1/edit" do
      subject { { get: "/shops/1/edit" } }
      it { should route_to("shops#edit", id: '1') }
    end

    describe "PUT /shops/1" do
      subject { { put: "/shops/1" } }
      it { should route_to("shops#update", id: '1') }
    end

    describe "DELETE /shops/1" do
      subject { { delete: "/shops/1" } }
      it { should route_to("shops#destroy", id: '1') }
    end

  end

end


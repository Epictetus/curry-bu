# coding: utf-8
require 'spec_helper'

describe :routes do

  describe :root do

    describe "GET /" do
      subject { { get: "/" } }
      it { should route_to("home#index") }
    end

  end

  describe :settings do

    describe "GET /settings/account" do
      subject { { get: "/settings/account" } }
      it { should route_to("registrations#edit") }
    end

    describe "PUT /settings/account" do
      subject { { put: "/settings/account" } }
      it { should route_to("registrations#update") }
    end

    describe "DELETE /settings/account" do
      subject { { delete: "/settings/account" } }
      it { should route_to("registrations#destroy") }
    end

  end

  describe :shops do

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

  describe :items do

    describe "GET /items" do
      subject { { get: "/items" } }
      it { should route_to("items#index") }
    end

    describe "GET /items/new" do
      subject { { get: "/items/new" } }
      it { should route_to("items#new") }
    end

    describe "POST /items" do
      subject { { post: "/items" } }
      it { should route_to("items#create") }
    end

    describe "GET /items/1" do
      subject { { get: "/items/1" } }
      it { should route_to("items#show", id: '1') }
    end

    describe "GET /items/1/edit" do
      subject { { get: "/items/1/edit" } }
      it { should route_to("items#edit", id: '1') }
    end

    describe "PUT /items/1" do
      subject { { put: "/items/1" } }
      it { should route_to("items#update", id: '1') }
    end

    describe "DELETE /items/1" do
      subject { { delete: "/items/1" } }
      it { should route_to("items#destroy", id: '1') }
    end

  end

  describe :users do

    # devise
    describe "GET /login" do
      subject { { get: "/login" } }
      it { should route_to("devise/sessions#new") }
    end

    describe "POST /login" do
      subject { { post: "/login" } }
      it { should route_to("devise/sessions#create") }
    end

    describe "DELETE /logout" do
      subject { { delete: "/logout" } }
      it { should route_to("devise/sessions#destroy") }
    end

    describe "GET /signup" do
      subject { { get: "/signup" } }
      it { should route_to("registrations#new") }
    end

    describe "POST /signup" do
      subject { { post: "/signup" } }
      it { should route_to("registrations#create") }
    end

    # application
    describe "GET /users" do
      subject { { get: "/users" } }
      it { should route_to("users#index") }
    end

    describe "GET /users/1" do
      subject { { get: "/users/1" } }
      it { should route_to("users#show", id: '1') }
    end

  end

end

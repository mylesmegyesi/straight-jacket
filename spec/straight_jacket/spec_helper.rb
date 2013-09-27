require 'rack/test'
require 'active_support/all'
require 'action_controller'
require 'action_dispatch'
require 'action_dispatch/testing/integration'

module StraightJacket
  module SpecHelper

      def build_request(params)
        helper = Helper.new
        helper.get '/', params
      end

    private

    class Helper

      def get(path, params)
        session.get(path, params)
        session.request
      end

      private

      def session
        @session ||= ActionDispatch::Integration::Session.new(app)
      end

      def app
        FakeApp.new
      end

    end

    class FakeApp
      def call(env)
        [200, {}, 'OK']
      end
    end
  end
end

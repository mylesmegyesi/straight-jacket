require 'straight_jacket/match'

module StraightJacket
  module Matchers

    def match(request)
      StraightJacket::Match.new(request)
    end

  end
end

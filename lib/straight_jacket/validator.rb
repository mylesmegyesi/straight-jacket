module StraightJacket
  module Validator

    def self.int?(value)
      if match = /\d+/.match(value)
        match[0] == value
      else
        false
      end
    end

  end
end

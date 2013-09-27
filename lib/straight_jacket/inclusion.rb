require 'active_support/core_ext/object'

module StraightJacket
  class Inclusion

    def initialize(param, valid_values, required = false)
      @param = param
      @valid_values = valid_values
      @required = required
    end

    def matches?(request)
      if value = request.parameters[param].presence
        valid_values.include?(value)
      else
        !required
      end
    end

    private

    attr_reader :param, :valid_values, :required

  end
end

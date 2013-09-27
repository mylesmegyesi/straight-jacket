module StraightJacket
  class Equals
    def initialize(param, value, required = false)
      @param = param
      @expected_value = value
      @required = required
    end

    def matches?(request)
      if value = request.parameters[param].presence
        expected_value == value
      else
        !required
      end
    end

    private

    attr_reader :param, :expected_value, :required
  end
end


module StraightJacket
  class Match

    def initialize(request)
      @request = request
    end

    def matches?(constrainer)
      @actual = constrainer
      constrainer.matches?(request)
    end

    def failure_message_for_should
      "expected #{actual} to match #{request.parameters} but did not"
    end

    def failure_message_for_should_not
      "expected #{actual} not to match #{request.parameters} but did"
    end

    alias failure_message              failure_message_for_should
    alias failure_message_when_negated failure_message_for_should_not

    def description
      "match parameters #{request.parameters}"
    end

    private

    attr_reader :request, :actual

  end
end


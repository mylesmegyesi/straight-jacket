module StraightJacket
  class Composite

    def initialize(constrainers, options = {})
      method = options[:method] || :all
      @matcher = build_matcher(method, options, constrainers)
    end

    def matches?(request)
      matcher.call(request)
    end

    private

    attr_reader :matcher

    def build_matcher(method, options, constrainers)
      case method
      when :all
        lambda do |request|
          constrainers.all? do |constrainer|
            constrainer.matches?(request)
          end
        end
      when :any
        lambda do |request|
          constrainers.any? do |constrainer|
            constrainer.matches?(request)
          end
        end
      when :at_least
        lambda do |request|
          number_of_matches(request, constrainers) >= options[:count]
        end
      when :exactly
        lambda do |request|
          number_of_matches(request, constrainers) == options[:count]
        end
      else
        raise 'unknown'
      end
    end

    def number_of_matches(request, constrainers)
      constrainers.reduce(0) do |acc, constrainer|
        if constrainer.matches?(request)
          acc + 1
        else
          acc
        end
      end
    end

  end
end

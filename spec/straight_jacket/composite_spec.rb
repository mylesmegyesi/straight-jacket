require 'straight_jacket/spec_helper'
require 'straight_jacket/composite'

describe StraightJacket::Composite do
  include StraightJacket::SpecHelper

  def constrainer(request, match)
    mock = double(:constrainer)
    mock.stub(matches?: match)
    mock
  end

  it 'matches if all constrainers match and method is all' do
    request = double(:request)
    constrainers = [constrainer(request, true), constrainer(request, true)]
    constrainer = described_class.new(constrainers, method: :all)
    constrainer.matches?(request).should be_true
  end

  it 'does not matches if one constrainer fails match and method is all' do
    request = double(:request)
    constrainers = [constrainer(request, true), constrainer(request, false)]
    constrainer = described_class.new(constrainers)
    constrainer.matches?(request).should be_false
  end

  it 'matches if only one constrainer matches and method is any' do
    request = double(:request)
    constrainers = [constrainer(request, true), constrainer(request, false)]
    constrainer = described_class.new(constrainers, method: :any)
    constrainer.matches?(request).should be_true
  end

  it 'matches if both constrainers match and method is at least and number is one' do
    request = double(:request)
    constrainers = [constrainer(request, true), constrainer(request, false)]
    constrainer = described_class.new(constrainers, method: :at_least, count: 1)
    constrainer.matches?(request).should be_true
  end

  it 'matches if both constrainers match and method is at least and number is two' do
    request = double(:request)
    constrainers = [constrainer(request, true), constrainer(request, true)]
    constrainer = described_class.new(constrainers, method: :at_least, count: 2)
    constrainer.matches?(request).should be_true
  end

  it 'fails if both constrainers match and method is at least and number is three' do
    request = double(:request)
    constrainers = [constrainer(request, true), constrainer(request, true)]
    constrainer = described_class.new(constrainers, method: :at_least, count: 3)
    constrainer.matches?(request).should be_false
  end

  it 'matches if only one constrainer matches and method is exactly number is 1' do
    request = double(:request)
    constrainers = [constrainer(request, true), constrainer(request, false)]
    constrainer = described_class.new(constrainers, method: :exactly, count: 1)
    constrainer.matches?(request).should be_true
  end

  it 'fails if only one constrainer matches and method is exactly number is 2' do
    request = double(:request)
    constrainers = [constrainer(request, true), constrainer(request, false)]
    constrainer = described_class.new(constrainers, method: :exactly, count: 2)
    constrainer.matches?(request).should be_false
  end

end


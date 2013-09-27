require 'straight_jacket/spec_helper'
require 'straight_jacket/collection'
require 'straight_jacket/validator'

describe StraightJacket::Collection do
  include StraightJacket::SpecHelper

  def request(value = nil)
    if value
      build_request({'val' => value})
    else
      build_request({})
    end
  end

  def constrainer
    described_class.new('val') do |value|
      StraightJacket::Validator.int?(value)
    end
  end

  it 'does not match if one of the items in the collection is invalid' do
    constrainer.matches?(request(['1', 'not-int'])).should be_false
  end

  it 'does not match if the parameter is required but not present' do
    constrainer = described_class.new('val', true) { |value| true }
    constrainer.matches?(request).should be_false
  end

  it 'matches if the parameter is not required and not present' do
    constrainer = described_class.new('val', false) { |value| true }
    constrainer.matches?(request).should be_true
  end

  it 'matches if all of the items in the collection is invalid' do
    constrainer.matches?(request(['1', '2'])).should be_true
  end

  it 'does not match for an empty collection if the parameter is required' do
    constrainer = described_class.new('val', true) { |value| true }
    constrainer.matches?(request([])).should be_false
  end

end

require 'straight_jacket/spec_helper'
require 'straight_jacket/required_parameter'

describe StraightJacket::RequiredParameter do
  include StraightJacket::SpecHelper

  it 'matches if the parameter is present' do
    r = build_request(value: 'here')
    described_class.new('value').matches?(r).should be_true
  end

  it 'does not matches if the parameter is present' do
    r = build_request(value: nil)
    described_class.new('value').matches?(r).should be_false
    r = build_request({})
    described_class.new('value').matches?(r).should be_false
    r = build_request(value: '')
    described_class.new('value').matches?(r).should be_false
  end

end

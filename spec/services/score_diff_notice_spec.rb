require 'rails_helper'

RSpec.describe ScoreDiffNotice do
  let(:action) { :removed }
  let(:service) { ScoreDiffNotice.new(action, score_diff) }

  context 'when action is :added and score_diff is positive' do
    let(:action) { :added }
    let(:score_diff) { 2 }
    it { expect(service.call).to eq('Score added, you went up by 2') }
  end

  context 'when action is :added and score_diff is negative' do
    let(:action) { :added }
    let(:score_diff) { -2 }
    it { expect(service.call).to eq('Score added, you dropped by 2') }
  end

  context 'when action is :added and score_diff is zero' do
    let(:action) { :added }
    let(:score_diff) { 0 }
    it { expect(service.call).to eq('Score added, you have maintained your position') }
  end

  context 'when action is :removed and score_diff is positive' do
    let(:action) { :removed }
    let(:score_diff) { 2 }
    it { expect(service.call).to eq('Score removed, you went up by 2') }
  end

  context 'when action is :removed and score_diff is negative' do
    let(:action) { :removed }
    let(:score_diff) { -2 }
    it { expect(service.call).to eq('Score removed, you dropped by 2') }
  end

  context 'when action is :removed and score_diff is zero' do
    let(:action) { :removed }
    let(:score_diff) { 0 }
    it { expect(service.call).to eq('Score removed, you have maintained your position') }
  end
end

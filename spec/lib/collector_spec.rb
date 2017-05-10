# frozen_string_literal: true

require 'spec_helper'

describe Collector do
  describe '#charge' do
    subject(:collector) { described_class.new(calls) }

    context 'when there are more than one call to the same caller' do
      let(:call_one) { Call.new(['09:11:00', '09:16:00', '+351914374373', '+351215355312']) }
      let(:call_two) { Call.new(['09:11:30', '09:13:30', '+351914374373', '+351215355312']) }
      let(:call_three) { Call.new(['09:11:30', '09:15:30', '+351914374999', '+351215355312']) }
      let(:calls) { [call_one, call_two, call_three] }

      it 'returns list of callers' do
        expect(subject.charge).to eq('+351914374373' => 3.5, '+351914374999' => 2.0)
      end
    end

    context 'when there is not call at all' do
      let(:calls) { nil }

      it 'returns nil' do
        expect(subject.charge).to be_nil
      end
    end
  end
end

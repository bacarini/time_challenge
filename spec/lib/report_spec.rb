# frozen_string_literal: true

require 'spec_helper'

describe Report do
  subject(:report) { described_class.new(data) }

  describe '#ranking' do
    context 'when data is empty' do
      let(:data) { {} }

      it 'sorts list descending' do
        expect(report.ranking).to be_empty
      end
    end

    context 'when there is data' do
      let(:data) { { foo: 1, bar: 3 } }

      it 'sorts list descending' do
        expect(report.ranking).to eq [[:bar, 3], [:foo, 1]]
      end
    end
  end

  describe '#publish' do
    let(:data) { { foo: 1.00111, bar: 3.333333 } }
    let(:expected_response) { "Caller bar should pay 3.33 (not to be charged)\nCaller foo should pay 1.0 \n" }

    it 'outputs the report' do
      expect { report.publish }.to output(expected_response).to_stdout
    end
  end
end

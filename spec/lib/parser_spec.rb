# frozen_string_literal: true

require 'spec_helper'

describe Parser do
  describe '.parse' do
    context 'when there is a problem with Call initialization' do
      let(:file) do
        ["09:20:30;09:15:22;+351914374373;+351215355312\n",
         "15:20:04;15:23:49;+351217538222;+351214434422\n"]
      end

      it 'returns error' do
        expect { described_class.parse(file) }.to raise_error(Exceptions::TimeChallengeException)
      end
    end

    context 'when line is empty' do
      let(:file) { ["\n"] }

      it 'returns error' do
        error_msg = 'Error: There is something wrong with the file input - '
        expect { described_class.parse(file) }.to raise_error(Exceptions::TimeChallengeException, error_msg)
      end
    end

    context 'when there is not four parameters as input' do
      let(:file) { ["15:20:04;15:23:49;+351217538222\n"] }

      it 'returns error' do
        error_msg = 'Error: There is something wrong with the file input - 15:20:04, 15:23:49, +351217538222'
        expect { described_class.parse(file) }.to raise_error(Exceptions::TimeChallengeException, error_msg)
      end
    end

    context 'when input is right' do
      let(:file) do
        ["09:10:30;09:15:22;+351914374373;+351215355312\n",
         "15:20:04;15:23:49;+351217538222;+351214434422\n"]
      end

      it 'returns list of calls' do
        calls = described_class.parse(file)

        calls.each { |call| expect(call).to be_a Call }
        expect(calls).to be_a Array
      end
    end
  end
end

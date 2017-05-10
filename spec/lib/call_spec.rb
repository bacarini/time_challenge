# frozen_string_literal: true

require 'spec_helper'

describe Call do
  describe '#validate_dates' do
    context 'when start is bigger than finish' do
      it 'raises error' do
        expect do
          Call.new(['09:21:00', '09:16:00', '+351914374373', '+351215355312'])
        end.to raise_error(Exceptions::TimeChallengeException, 'Error: start time cannot be bigger than finish time')
      end
    end

    context 'when start is not bigger than finish' do
      it 'does not return an error' do
        expect { Call.new(['09:11:00', '09:16:00', '+351914374373', '+351215355312']) }.not_to raise_error
      end
    end
  end

  describe '#duration_in_sec' do
    context 'when time is the same' do
      it 'returns zero' do
        call = Call.new(['09:11:00', '09:11:00', '+351914374373', '+351215355312'])
        expect(call.duration_in_sec).to eq 0.0
      end
    end

    context 'when start is less than finish' do
      it 'returns difference between two times' do
        call = Call.new(['09:10:00', '09:11:00', '+351914374373', '+351215355312'])
        expect(call.duration_in_sec).to eq 60
      end
    end
  end

  describe '#cost' do
    context 'when call is leass then 5 minutes' do
      it 'returns cost' do
        call = Call.new(['09:10:00', '09:12:00', '+351914374373', '+351215355312'])
        expect(call.cost).to eq 1
      end
    end

    context 'when call is 5 minutes' do
      it 'returns cost' do
        call = Call.new(['09:10:00', '09:15:00', '+351914374373', '+351215355312'])
        expect(call.cost).to eq 2.5
      end
    end

    context 'when call is bigger then 5 minutes' do
      it 'returns cost' do
        call = Call.new(['09:10:00', '09:20:00', '+351914374373', '+351215355312'])
        expect(call.cost).to eq 3.5
      end
    end

    context 'when call somehow is zero' do
      it 'returns zero' do
        call = Call.new(['09:10:00', '09:10:00', '+351914374373', '+351215355312'])
        expect(call.cost).to eq 0
      end
    end
  end
end

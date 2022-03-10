# frozen_string_literal: true

RSpec.describe Faraday::ParseDates::Middleware, type: :response do
  subject { process(body).body&.dig(*body_keys) }

  let(:body) { { 'x' => x } }
  let(:body_keys) { ['x'] }

  let(:parsed) { Time.utc(2012, 2, 1, 13, 14, 15, parsed_microseconds) }
  let(:parsed_microseconds) { 0 }

  context 'with correct dates' do
    context 'without microseconds' do
      context 'with Zulu timezone offset' do
        let(:x) { '2012-02-01T13:14:15Z' }

        it { is_expected.to eq parsed }
      end

      context 'with positive timezone offset' do
        let(:x) { '2012-02-01T15:14:15+02:00' }

        it { is_expected.to eq parsed }
      end

      context 'with negative timezone offset' do
        let(:x) { '2012-02-01T11:14:15-0200' }

        it { is_expected.to eq parsed }
      end
    end

    context 'with microseconds' do
      let(:parsed_microseconds) { 123_000 }

      context 'with Zulu timezone offset' do
        let(:x) { '2012-02-01T13:14:15.123Z' }

        it { is_expected.to eq parsed }
      end

      context 'with negative timezone offset' do
        let(:x) { '2012-02-01T11:14:15.123-02:00' }

        it { is_expected.to eq parsed }
      end
    end

    context 'when inside Hash' do
      let(:body_keys) { super().push('y') }

      let(:x) { { 'y' => '2012-02-01T13:14:15Z' } }

      it { is_expected.to eq parsed }
    end

    context 'when inside Array' do
      let(:body_keys) { super().push(0, 'y') }

      let(:x) { [{ 'y' => '2012-02-01T13:14:15Z' }] }

      it { is_expected.to eq parsed }
    end
  end

  context 'when body is nil' do
    let(:body) { nil }

    it { is_expected.to be_nil }
  end

  context 'when Arrays has no Time strings' do
    let(:x) { [1, 2, 3] }

    it { is_expected.to eq x }
  end

  context 'with incorrect Time-like strings' do
    [
      '2012-02-01T13:14:15Z bla',
      '12012-02-01T13:14:15Z',
      "2012-02-01T13:14:15Z\nfoo"
    ].each do |string|
      context "when String is #{string}" do
        let(:x) { string }

        it { is_expected.to eq string }
      end
    end
  end
end

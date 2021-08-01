# frozen_string_literal: true

RSpec.describe User do
  let(:first_name) { 'Luke' }
  let(:last_name) { 'Skywalker' }

  let(:user) { User.new(first_name: first_name, last_name: last_name) }

  describe '#full_name' do
    subject { user.full_name }

    it { is_expected.to eq 'Luke Skywalker' }

    context 'no first name' do
      let(:first_name) { nil }

      it { is_expected.to eq 'Skywalker' }
    end

    context 'no last name' do
      let(:last_name) { nil }

      it { is_expected.to eq 'Luke' }
    end
  end
end

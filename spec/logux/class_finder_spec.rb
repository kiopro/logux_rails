# frozen_string_literal: true

require 'spec_helper'

describe Logux::ClassFinder do
  let(:finder) { described_class.new(params) }

  describe '#class_name' do
    subject { finder.class_name }

    let(:params) { create(:logux_actions_add, type: 'test/test/name/try/user/add') }

    it 'returns nested classes' do
      expect(subject).to eq('Test::Test::Name::Try::User')
    end
  end

  describe '#find_policy_class' do
    subject { finder.find_policy_class }

    let(:params) { create(:logux_actions_add, type: 'test/test/name/try/user/add') }

    it 'raise an error' do
      expect { subject }.to raise_error(Logux::NoPolicyError)
    end
  end
end

require 'rspec'
require_relative '../../lib/valera'
require_relative '../../lib/action/singing_subway'
require_relative '../../lib/action/modification'

RSpec.describe SingingSubway do
  describe 'decorator' do
    let(:actual) do
      Modification.next_iteration(Valera.new, '5').stats!
    end

    let(:expected) do
      { 'fatigue' => 20, 'fun' => 10, 'health' => 100, 'mana' => 10, 'money' => 20,
        'state?' => {
          '1' => true, '2' => true, '3' => true, '4' => true, '5' => true, '6' => true, '7' => true, 'dead' => false
        } }
    end

    context 'Decorator singing subway reset' do
      it {
        expect(actual).to eq expected
      }
    end
  end
end

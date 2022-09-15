require_relative './../app/application_report'

RSpec.describe ApplicationReport do
  let(:service) { described_class.new('applications.json') }

  describe 'when channel set to :all' do
    let(:expected_response) do
      {
        0 => 1,
        1 => 3,
        2 => 2,
        3 => 3,
        4 => 1,
        5 => 2,
        6 => 1,
        7 => 1,
        8 => 1,
        9 => 4,
        10 => 3,
        11 => 4,
        12 => 3,
        13 => 4,
        14 => 2,
        15 => 3,
        16 => 2,
        17 => 3,
        18 => 3,
        19 => 3,
        20 => 3,
        21 => 4,
        22 => 1,
        23 => 3
      }
    end

    it 'returns proper response' do

    end
  end
end

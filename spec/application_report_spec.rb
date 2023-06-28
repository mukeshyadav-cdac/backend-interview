require_relative './../app/application_report'

RSpec.describe ApplicationReport do
  let(:service) { ApplicationReport.new('applications.json') }

  context ' channel parameter is "all" ' do
    let(:expected_response) do
      {
        0 => 2.0, 1 => 2.67, 2 => 3.5, 3 => 2.67, 4 => 1.5, 5 => 3.0, 6 => 3.0,
        7 => 2.0, 8 => 2.0, 9 => 4.33, 10 => 3.0, 11 => 4.33, 12 => 3.33,
        13 => 4.33, 14 => 3.5, 15 => 4.0, 16 => 2.0, 17 => 3.33, 18 => 4.0,
        19 => 2.67, 20 => 3.33, 21 => 4.33, 22 => 2.0, 23 => 3.33
      }
    end
    it 'calculates average number of application per day' do
      expect(service.retrieve_trend).to eq(expected_response)
    end
  end

  context ' channel parameter is "sales" ' do
    let(:expected_response) do
      {
        0 => 2.0, 1 => 2.0, 2 => 4.0, 3 => 1.33, 5 => 1.0, 6 => 1.0, 8 => 3.0,
        9 => 2.0, 10 => 1.67, 11 => 2.5, 12 => 2.5, 13 => 1.0, 14 => 2.0,
        15 => 1.5, 16 => 2.0, 17 => 1.0, 18 => 1.0, 19 => 2.0, 20 => 2.33,
        21 => 1.0, 23 => 1.5
      }
    end

    it 'calculates average number of application per day' do
      expect(service.retrieve_trend('sales')).to eq(expected_response)
    end
  end

  context ' number of records when channel parameter is "sales" ' do
    let(:sales_data) { service.filter_trend('sales') }

    it 'gets only sales channel data' do
      reject_data = sales_data.reject { |item| item['channel'] == 'sales' }

      expect(reject_data).to eq([])
    end

    it ' gets correct number of records for sales channel' do
      total_records = service.filter_trend
      non_sales_records = total_records.reject { |item| item['channel'] == 'sales' }

      expect(non_sales_records.length + sales_data.length).to eq(total_records.length)
    end
  end
end

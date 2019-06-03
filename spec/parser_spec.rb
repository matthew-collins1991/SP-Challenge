describe 'Parser' do

  let!(:test) { Parser.new("./test_data.log") }

  it 'is defined' do
    expect(defined?(Parser)).to be_truthy
    expect(Parser).to be_a(Class)
  end

  describe '#get_log' do

    it 'responds to the #get_log instance method' do
      expect(test).to respond_to(:get_log)
    end

    it 'creates an array of correct length' do
      expect(Parser.class_variable_get(:@@log_array)).to be_an(Array)
      expect(Parser.class_variable_get(:@@log_array).size).to eq(33)
    end
  end

  describe '#count_site_visits' do

    it 'responds to the #count_site_visits instance method' do
      expect(test).to respond_to(:count_site_visits)
    end

    it 'Removes user ID from array' do
      expect(test.instance_variable_get(:@sites_array)).to be_an(Array)
      expect(test.instance_variable_get(:@sites_array)[0].split.length).to eq(1)
    end

    it 'Creates a hash of key/ values pairs in site/visit format' do
      expect(test.instance_variable_get(:@visit_count)).to be_a(Hash)
      expect(test.instance_variable_get(:@visit_count).keys.has_string?).to eq true
      expect(test.instance_variable_get(:@visit_count).keys.has_number?).to eq false
      expect(test.instance_variable_get(:@visit_count).values.has_string?).to eq false
      expect(test.instance_variable_get(:@visit_count).values.has_number?).to eq true
    end
  end

  describe '#order_log_by_visit_count' do
    it 'responds to the #order_log_by_visit_count instance method' do
      expect(test).to respond_to(:order_log_by_visit_count)
    end

    it 'Is an Array' do
      expect(test.instance_variable_get(:@ordered_count)).to be_an(Array)
    end

    it 'Is ordered from highest to lowest' do
      array = test.instance_variable_get(:@ordered_count).map { |x| x.split[1]  }
      expect(array).to eq([10,8,6,4,3,2])
    end

  end

  describe '#create_table' do
    it 'responds to the #create_table instance method' do
    end

    it 'puts @table' do
      expect($stdout).to receive(:puts).with(test.instance_variable_get(:@table))
    end
  end

  describe '#remove_duplicate_visits' do
    it 'responds to the #remove_duplicate_visits instance method' do
      expect(test).to respond_to(:remove_duplicate_visits)
    end

    it 'Removes Duplicates' do
      expect(test.instance_variable_get(:@unique_visits_array).is_unique?).to eq true
    end
  end


end

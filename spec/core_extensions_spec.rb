require_relative "spec_helper.rb"

describe Array do
  context "#all_empty?" do
    it 'returns true if all elements of the Array are empty' do
      expect(['', '', ''].all_empty?).to be_truthy
    end

    it 'returns false if some of the Array elements are not empty' do
      expect(['', 'bradva', Object.new, :a].all_empty?).to be_falsey
    end

    it 'returns true for an empty Array' do
      expect([].all_empty?).to be_truthy
    end
  end

  context "#all_same?" do
    it 'returns true if all elements of an Array are the same' do
      expect(['a', 'a', 'a'].all_same?).to be_truthy
    end

    it 'returns false if some of the elements of an Array are not the same' do
      expect(['b', 'b', 1, :b].all_same?).to be_falsey
    end

    it 'returns true for an empty array' do
      expect([].all_same?).to be_truthy
    end
  end

  context "#any_empty?" do
    it 'returns true if any of the elements of an Array are empty' do
      expect(['a', 'b', ''].any_empty?).to be_truthy
    end

    it 'returns false if any elements of an Array are not empty' do
      expect(['a', :a, []].any_empty?).to be_falsey
    end

    it 'returns false for an empty array' do
      expect([].any_empty?).to be_falsey
    end
  end

  context "#none_empty?" do
    it 'returns true if none of the elements of an Array are empty' do
      expect(['a', 'a', :a].none_empty?).to be_truthy
    end

    it 'returns false if none of the elements of an Array are not empty' do
      expect(['a', 'b', ''].none_empty?).to be_falsey
    end

    it 'returns true for an empty Array' do
      expect([].none_empty?).to be_truthy
    end
  end
end

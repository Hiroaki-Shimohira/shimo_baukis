require 'spec_helper'

describe String  do
  describe '#<<' do
    example '文字列の追加' do
      s = "abc"
      s<< "d"
      expect(s.size).to eq(4)
    end
  end
end
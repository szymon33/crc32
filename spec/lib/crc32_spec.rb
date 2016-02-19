require 'spec_helper'
require 'crc32'

describe Crc32 do
  describe '#algorythm' do
    it 'is valid' do
      expect(
        described_class.algorythm('123456789').to_s(16)
      ).to eql 'cbf43926'
    end
  end

  describe 'QUOTIENT' do
    it 'is valid' do
      expect(described_class::QUOTIENT).to eql 0xEDB88320
    end

    it 'is reversed 32-bit word of 0x4C11DB7' do
      expect(described_class::QUOTIENT.to_s(2).reverse
        .to_i(2).to_s(16)).to eql '4c11db7'
    end
  end
end

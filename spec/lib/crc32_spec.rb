require 'spec_helper'
require 'crc32'

describe CRC32 do
  describe '#algorythm' do
    it 'is valid' do
      expect(
        described_class.algorythm('123456789').to_s(16)
      ).to eql 'cbf43926'
    end
  end

  it 'has QUOTIENT' do
    expect(described_class::QUOTIENT).to eql 0xEDB88320
  end
end

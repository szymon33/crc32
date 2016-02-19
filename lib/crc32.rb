require 'crc32/version'

module Crc32
  QUOTIENT = 0xEDB88320.freeze

  def self.algorythm(str)
    crc = 0xFFFFFFFF          # initialize 32 bit register
    str.each_byte do |b|      # get next byte
        crc ^= b              # modulo that byte
        8.times do            # do eight times
          mask = (crc & 1)    # check less significient bit
          crc >>= 1           # always shift
          crc ^= QUOTIENT unless mask.zero?
        end
    end
    crc ^ 0xFFFFFFFF          # XOR the final register
  end
end

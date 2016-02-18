module CRC32
  QUOTIENT = 0xEDB88320.freeze

  def self.algorythm(str)
    crc = 0xFFFFFFFF
    str.each_byte do |b|      # get next byte
        crc ^= b              # modulo next byte
        8.times do            # do eight times
          mask = (crc & 1)    # check less significient bit
          crc >>= 1           # always shift
          crc ^= QUOTIENT unless mask.zero?
        end
    end
    crc ^ 0xFFFFFFFF
  end
end

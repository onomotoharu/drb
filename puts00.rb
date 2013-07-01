require 'drb/drb'                                        # (1)

class Puts                                               # (2)
  def initialize(stream=$stdout)
    @stream = stream
  end

  def puts(str)
    @stream.puts(str)
  end
end

uri = ARGV.shift
DRb.start_service(uri, Puts.new)                        # (3)
puts DRb.uri
sleep                                                   # (4)

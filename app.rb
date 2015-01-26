require 'optparse'
require 'ostruct'

require_relative 'init'

$options = OpenStruct.new
$options.inputs = []

optparser = OptionParser.new do |opts|
  opts.banner = "Usage: ruby #{__FILE__} -s /path/to/space-delimited-input -p /path/to/pipe-delimited-input -c /path/to/comma-delimited-input -o /path/to/output"

  opts.on('-s', '--space-input=', 'Input file path for space delimited file') do |i|
    $options.inputs << { file: i, delimiter: ' ' }
  end

  opts.on('-c', '--comma-input=', 'Input file path for comma delimited file') do |i|
    $options.inputs << { file: i, delimiter: ',' }
  end

  opts.on('-p', '--pipe-input=', 'Input file path for pipe delimited file') do |i|
    $options.inputs << { file: i, delimiter: '|' }
  end

  opts.on('-o', '--output=', 'Output file path') do |o|
    $options.output = o
  end
end

optparser.parse!

unless $options.inputs
  puts optparser.help
  fail("Require at least one input types: -s | -c | -p")
end

unless $options.output
  puts optparser.help
  fail("Require an output file option: -o")
end

inputs.each do |input|
  persons = Priori::FormatterFactory.get_formatter(
    $options.inputs[:delimiter],
    input:  $options.input[:file],
    output: $options.output
  ).format
end

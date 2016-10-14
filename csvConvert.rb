require 'json'
require 'csv'
require 'unicode_utils/titlecase'

in_filename = ARGV[0] 
out_filename = ARGV[1]

if in_filename == nil || out_filename == nil
  puts "usage:\t\t csvConvert.rb <name of file to convert> <name of output file>"
  puts "example:\t csvConvert.rb unformattedSeZipCodes.csv seZipCodes.json"
else 
  converted_array = Array.new
  
  CSV.foreach(in_filename, :col_sep => "\t") do |zip_code_row|
    converted_element = { :zip => zip_code_row[0], :name => UnicodeUtils.titlecase(zip_code_row[1])}
    converted_array << converted_element
  end
  
  output_file = File.open(out_filename, "w")
  output_file.write(JSON.pretty_generate(converted_array))
  output_file.close
  
  puts "🎉 done 🎉"
end
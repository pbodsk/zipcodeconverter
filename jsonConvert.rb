require 'json'

in_filename = ARGV[0] 
out_filename = ARGV[1]

if in_filename == nil || out_filename == nil
  puts "usage:\t\t jsonConvert.rb <name of file to convert> <name of output file>"
  puts "example:\t jsonConvert.rb unformattedSeZipCodes.json seZipCodes.json"
else 
  converted_array = Array.new
  
  zip_codes_json = JSON.parse(File.read(in_filename))
  zip_code_results = zip_codes_json["results"]
  zip_code_results.each do | zip_code |
    address = zip_code["address"].split(',').first
    converted_element = { :zip => zip_code["zipcode"], :name => address}
    converted_array << converted_element
  end
  output_file = File.open(out_filename, "w")
  output_file.write(JSON.pretty_generate(converted_array))
  output_file.close
  
  puts "🎉 done 🎉"
end



@file_name="/Users/vivien/Desktop/options.txt" 
f= File.new(@file_name)

fileOut = File.new("/Users/vivien/Desktop/countries.yaml", "w")
#$stdout = fileOut
begin
while (line = f.readline)
line.chomp
info=line
puts info.strip.gsub(/[-\.']/,'_').gsub(/\s/,'_').gsub(/\*./,"stars").chomp.downcase + ": \"" + line.strip.gsub(/\s/," ") + "\""
end

rescue EOFError
    f.close
end

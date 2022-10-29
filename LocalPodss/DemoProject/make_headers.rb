require  'find'

podspecFile = (`find ./ -name "*.podspec"`.lines)
    .map(&:strip)
    .map {|line| File.basename(line)}
    .map {|line| line.gsub(/\s+/, '')}
    .map {|line| line.gsub('.podspec', '')}
    .uniq

puts podName = podspecFile[0]

raise "当前目录无podspec" unless podName

all_headers = (`find Classes/ -name "*.h"`.lines)
	.map(&:strip)
	.map {|line| File.basename(line)}
	.uniq

def export_def_for_name(name)
	"#import \"#{name}\""
end

all_headers.delete("#{podName}.h")

puts all_headers

header = all_headers.map {|name| export_def_for_name(name)}.join("\n")
header1 = "//"

File.write("Classes/#{podName}.h", header)
File.write("Classes/#{podName}.h", header1)

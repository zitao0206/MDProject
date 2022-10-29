require  'find'
require  'date'

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

def export_def_for_name(podName, name)
	"#import \<#{podName}/#{name}\>"
end

all_headers.delete("#{podName}.h")

puts all_headers

header = "//\n//  #{podName}.h\n//  Pods\n//\n//  Created by AutoTools on #{Date.today.strftime("%Y/%m/%d")}.\n//  Copyright © #{Date.today.strftime("%Y")} netease. All rights reserved.\n//\n\n"

header1 = header + all_headers.map {|name| export_def_for_name(podName, name)}.join("\n")

File.write("Classes/#{podName}.h", header1)

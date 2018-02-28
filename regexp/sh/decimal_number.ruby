file = ARGV.first
IO.foreach("#{file}") { |line| 
if (line =~ /^-?\d+(,\d+)*(\.\d+(e\d+)?)?$/)
	puts line
end
}

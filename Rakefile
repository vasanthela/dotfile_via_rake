task :default => [:test]

desc "test"
task :test do
end

desc "diff a repo file"
task :diff, :repo_file do |t,args|

  file = "./#{args.repo_file}"
  home = `cd; pwd`.strip
  sourced = "#{home}/#{args.repo_file}"
  
  if not File.exist? file
    puts "#{file} doesn't exist"
    next
  end

  if not File.exist? sourced
    puts "#{sourced} doesn't exist"
    next
  end

  puts `diff #{file} #{sourced}`
end


# DIFF OPTIONS

# diff -q
# diff --brief Report only whether the files differ, not the details of the differences

# diff -C line
# diff --context=[lines] Use the context output format, showing lines of context

# diff --ignore-blank-lines

# diff -r
# diff --recursive Recursively compare

# diff --side-by-side
# diff -y

# diff --suppress-common-lines Do not print common lines in side by side format

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

  puts `diff #{file} #{file}`
end


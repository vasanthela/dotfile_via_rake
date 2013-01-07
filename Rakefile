task :default => ["diff:all"]

HEADING_BREAK = "**********************************"

IGNORE_FILES = ['.','..',
                'DS_Store','.git',
                'irb-history','irb_history','.rbenv-version']

namespace :diff do
  desc "diff all files in repo"
  task :all do
    repo = Dir.glob('.?*')
    repo = repo - IGNORE_FILES

    home_dir = Dir.open Dir.home
    home = home_dir.entries.select {|v| v =~ /^\..*/ }
    home_dir.close
    home - IGNORE_FILES
   
    puts HEADING_BREAK 
    puts "Only in home:", home - repo
    
    puts "",HEADING_BREAK 
    puts "Only in repo:", repo - home 

    puts "",HEADING_BREAK 
    puts "Comparing files:"
    files = home & repo
  
    for file in files do
      puts `diff -q #{file} #{Dir.home}/#{file}`
    end
  end

  desc "diff a repo file"
  task :file, :repo_file do |t,args|

    file = "./#{args.repo_file}"
    sourced = "#{Dir.home}/#{args.repo_file}"
  
    if not File.exist? file
      puts "#{file} doesn't exist"
      next
    end

    if not File.exist? sourced
      puts "#{sourced} doesn't exist"
      next
    end

    puts `diff --context=5 #{file} #{sourced}`
  end
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

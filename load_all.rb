require 'adjacency_list_builder'

def not_ignored(path)
  !%w(load_all.rb run.rb README.md Gemfile Gemfile.lock).include?(path)
end

Dir.glob("**/*")
   .sort_by do |path|
     if path =~ /\Acommons/
      0
     elsif  path =~ /\Atools/
       0.5
     elsif path == 'dfs/dfs.rb'
      1
     elsif path =~ /examples\.rb/
      3
     else
      2
     end
   end
   .select { |path| File.file?(path) && not_ignored(path) }.each do |path|
  require_relative path
end

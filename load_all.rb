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
   .select { |path| File.file?(path) && path != 'load_all.rb' && path != 'run.rb' && path != 'README.md' }.each do |path|
  require_relative path
end

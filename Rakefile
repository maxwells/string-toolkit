task :compile do
  `coffee --output lib --compile src/string-toolkit.coffee`
end

task :spec do
  `coffee --output spec --compile spec/string-toolkit-spec.coffee`
end

task :default => [:compile, :spec]
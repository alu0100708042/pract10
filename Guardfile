# A sample Guardfile
# More info at https://github.com/guard/guard#readme

# Cuando se modifica el gemfile se activa
guard 'bundler' do
  watch('Gemfile')
end

# Cuando se modifica el rspec o el lib se activa
guard 'rspec', :version => 2 do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end

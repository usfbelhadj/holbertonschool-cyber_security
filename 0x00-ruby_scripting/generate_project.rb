# generate_project.rb

require 'fileutils'

project_name = ARGV[0] || 'cyber_security_project'

# Create directories
FileUtils.mkdir_p("#{project_name}/lib")
FileUtils.mkdir_p("#{project_name}/test")

# Create files
File.open("#{project_name}/Gemfile", 'w') do |f|
  f.puts "source 'https://rubygems.org'"
  f.puts "gem 'openssl'"
  f.puts "gem 'secure_random'"
  # Add other gems as needed
end

File.open("#{project_name}/README.md", 'w') do |f|
  f.puts "# #{project_name.capitalize}\n\n"
  f.puts "This is a Ruby project template for cybersecurity.\n\n"
  f.puts "## Project Structure\n\n"
  f.puts "```\n"
  f.puts "#{project_name}/\n"
  f.puts "├── Gemfile\n"
  f.puts "├── Gemfile.lock\n"
  f.puts "├── README.md\n"
  f.puts "├── lib/\n"
  f.puts "│   ├── encryption.rb\n"
  f.puts "│   ├── secure_communication.rb\n"
  f.puts "│   ├── vulnerability_scanner.rb\n"
  f.puts "│   └── utils.rb\n"
  f.puts "└── test/\n"
  f.puts "    ├── test_encryption.rb\n"
  f.puts "    ├── test_secure_communication.rb\n"
  f.puts "    ├── test_vulnerability_scanner.rb\n"
  f.puts "    └── test_utils.rb\n"
  f.puts "```\n\n"
  f.puts "## Getting Started\n\n"
  f.puts "1. Install dependencies:\n\n"
  f.puts "```sh\n"
  f.puts "bundle install\n"
  f.puts "```\n\n"
  f.puts "2. Run tests:\n\n"
  f.puts "```sh\n"
  f.puts "ruby -Itest test/test_encryption.rb\n"
  f.puts "ruby -Itest test/test_secure_communication.rb\n"
  f.puts "ruby -Itest test/test_vulnerability_scanner.rb\n"
  f.puts "ruby -Itest test/test_utils.rb\n"
  f.puts "```\n\n"
end

# Create module files
['encryption', 'secure_communication', 'vulnerability_scanner', 'utils'].each do |module_name|
  File.open("#{project_name}/lib/#{module_name}.rb", 'w') do |f|
    f.puts "module #{module_name.capitalize}\n"
    f.puts "  # Add your #{module_name.capitalize} functionality here\n"
    f.puts "end\n"
  end
end

# Create test files
['encryption', 'secure_communication', 'vulnerability_scanner', 'utils'].each do |module_name|
  File.open("#{project_name}/test/test_#{module_name}.rb", 'w') do |f|
    f.puts "require 'test/unit'\n\n"
    f.puts "class Test#{module_name.capitalize} < Test::Unit::TestCase\n"
    f.puts "  # Add your unit tests for #{module_name.capitalize} here\n"
    f.puts "end\n"
  end
end

puts "Project structure created for #{project_name}."

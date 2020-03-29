require 'json'

# create destination name options
def create_destination_name_options (destination_names)
  return "" if destination_names.empty?

  str = ""
  destination_names.each { |name|
    str << "-destination name='#{name}' "
  }
  return str.strip
end

# parse json
file = File.open("snapshot.json")
setting_hash = JSON.load(file)

workspace = setting_hash["workspace"]
scheme = setting_hash["scheme"]
test_target = setting_hash["test_target"]
test_path = setting_hash["test_path"]
destination_names = setting_hash["destination_names"]

# create command
destination_name_options = create_destination_name_options destination_names
command = "xcodebuild -workspace #{workspace}.xcworkspace -scheme #{scheme} #{destination_name_options} -only-testing:#{test_target}/#{test_path} clean test"

p "executing...."
p "#{command}"

system(command)

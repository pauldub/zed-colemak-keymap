require 'json'

# Define the key mappings for Colemak
key_mappings = {
  'j' => 'n',
  'k' => 'e',
  'l' => 'i',
  'n' => 'k',
  'i' => 'u',
  'u' => 'l',
  'e' => 'f',
  'f' => 't',
  't' => 'j'
}

# Function to swap keys according to the key_mappings
def colemak_friendly(bindings, key_mappings)
  new_bindings = {}

  bindings.each do |key, value|
    # Split the key by space to handle combinations like 'ctrl-w k'
    parts = key.split(' ')

    # Map each part of the combination using key_mappings
    new_parts = parts.map do |part|
      # Handle the case where '-' is a keybinding by itself
      if part == '-'
        '-'
      else
        part.split('-').map { |subpart| key_mappings.fetch(subpart, subpart) }.join('-')
      end
    end

    # Join the parts back together to form the new key
    new_key = new_parts.join(' ')

    # Recursively process nested hashes or arrays
    new_value = if value.is_a?(Hash)
                  colemak_friendly(value, key_mappings)
                elsif value.is_a?(Array)
                  value.map { |v| v.is_a?(Hash) ? colemak_friendly(v, key_mappings) : v }
                else
                  value
                end

    new_bindings[new_key] = new_value
  end

  new_bindings
end

def zed_version_tag
  version = `zed --version`.strip.split.at(1)

  if `zed --version`.downcase.include?('preview')
    "v#{version}-pre"
  else
    "v#{version}"
  end
end

# Read the JSON configuration from a file
file_path = 'vim.json'

puts "Downloading vim.json for zed version #{zed_version_tag}..."

system("curl -L https://raw.githubusercontent.com/zed-industries/zed/#{zed_version_tag}/assets/keymaps/vim.json > #{file_path}")
json_data = File.read(file_path)
config = JSON.parse(json_data)

# Apply the key swaps
config.each do |entry|
  entry['bindings'] = colemak_friendly(entry['bindings'], key_mappings)
end

# Apply the user key bindings from user.json
user_file_path = 'user.json'
if File.exist?(user_file_path)
  user_json_data = File.read(user_file_path)
  user_config = JSON.parse(user_json_data)

  config.concat(user_config)
end


# Write the modified configuration back to a file or print it
File.write('colemak_keybindings.json', JSON.pretty_generate(config))

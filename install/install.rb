require "tty-prompt"

def dir_exists?(dir)
  if File.exist?(File.expand_path(dir))
    p "#{dir} already exists"
    true
  else
    false
  end
end

fragments = %w[
  brew
  zsh
  git
  dotfiles
  asdf
  nvim
]

TTY::Prompt.new.multi_select("What do you want to install?", fragments).each do |fragment|
  require_relative "fragments/#{fragment}"
  puts "Installing #{fragment}"
  Module.const_get(fragment.capitalize).install
  puts "Done installing #{fragment}"
end

puts "All done! Go ahead and restart your terminal."

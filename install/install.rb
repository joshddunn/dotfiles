require "tty-prompt"

fragments = %w[
  brew
  zsh
  git
  dotfiles
  asdf
]

TTY::Prompt.new.multi_select("What do you want to install?", fragments).each do |fragment|
  require_relative "fragments/#{fragment}"
  puts "Installing #{fragment}"
  Module.const_get(fragment.capitalize).install
  puts "Done installing #{fragment}"
end

puts "All done! Go ahead and restart your terminal."

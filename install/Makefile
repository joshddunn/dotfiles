install:
	/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew install ruby
	make reinstall

reinstall:
	bundle install
	bundle exec ruby install.rb

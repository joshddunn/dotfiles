class Utils
  def self.append(filename, string)
    return if File.readlines(File.expand_path(filename)).grep(Regexp.new(string)).any?
    File.open(File.expand_path(filename), 'a') do |file|
      file.puts string
    end
  end

  def self.touch(filename)
    File.write(File.expand_path(filename), '')
  end

  def self.symlink(source, destination)
    File.symlink(File.expand_path(source), File.expand_path(destination)) unless exists?(destination)
  end

  def self.mkdir(directory)
    Dir.mkdir(File.expand_path(directory)) unless exists?(directory)
  end

  def self.exists?(dir)
    path = File.expand_path(dir)
    if File.exist?(path) || File.symlink?(path)
      p "#{dir} already exists"
      true
    else
      false
    end
  end
end

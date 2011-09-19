require "launchit/version"

module Launchit
  APPS =  Dir['/Applications/*'].select { |n| n =~ /.app$/ }.map do |n|
    {
      :name => n.sub('.app', '').downcase.sub(' ','_').split('/').last,
      :path => n
    }
  end
  def self.list
    puts APPS.map { |a| "#{a[:name]} => #{a[:path].split('/').last}" }.join("\n")
    exit 0
  end

  def self.help
    puts 'launchit-l for list of available apps, launchit <name> to launch an app'

  end

  def self.open app
    puts "Opening #{app[:path]}"
    `open #{app[:path]}`
  end

  def self.fail app
    puts "Couldn't find an app which matches #{args}"
    exit 1
  end

  def self.execute! arg
    help if arg.nil? or arg.empty?
    list if arg == '-l'

    app = APPS.select do |app|
      app[:name] =~ /#{arg}/
    end.first

    unless app.nil?
      open app
    else
      fail app
    end
  end
end

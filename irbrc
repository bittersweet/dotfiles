#!/usr/bin/ruby
require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

IRB.conf[:PROMPT_MODE] = :SIMPLE

IRB.conf[:AUTO_INDENT] = true

class Object
  def local_methods
    (methods - Object.new.methods).sort
  end
end

class Class
  def local_methods
    (methods - Object.methods).sort
  end
end

# Output stack with just the project local files, no gems
def local_caller
  pp caller.reject{ |path| path.include?("rbenv") }
end

# Springest extensions
def c(domain)
  C18n.domain = domain
end

def fr(object)
  if object =~ /http/
    # Split http://www.springest.nl.dev:3000/arbo-veiligheid into:
    # ["http:", "", "www.springest.nl.dev:3000", "arbo-veiligheid"]
    # This works with any amount of nesting, so also training and subject pages
    object = object.split("/")[3..-1].join("/")
    path = "/#{object}"
    find_object(path)
  else
    find_object(object)
  end
end

def find_object(path)
  training = Training.find_route(path)
  return training if training

  subject = Subject.find_route(path)
  return subject if subject

  category = Category.find_route(path)
  return category if category
end

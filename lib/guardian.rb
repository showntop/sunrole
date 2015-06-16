require 'guardian/controller_extensions'
require 'guardian/resourceable'
require 'guardian/roleable'
require 'guardian/subjectable'
require 'guardian/ruleable'
require 'machine'
require 'guardian/exception'
User.send(:include, Guardian::Subjectable)
Role.send(:include, Guardian::Roleable)
Permission.send(:include, Guardian::Ruleable)
ActiveRecord::Base.send(:include, Guardian::Resourceable)



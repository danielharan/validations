require File.join(File.dirname(__FILE__), 'lib', 'validations')
::ActiveRecord::Base.send :include, Validations
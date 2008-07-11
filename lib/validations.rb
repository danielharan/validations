module Validations
  #module ActiveRecord
      # Email regexps shamelessly stolen from restful_authentication
      # This is purposefully imperfect -- it's just a check for bogus input. See
      # http://www.regular-expressions.info/email.html
      RE_EMAIL_NAME   = '[\w\.%\+\-]+'                          # what you actually see in practice
      #RE_EMAIL_NAME   = '0-9A-Z!#\$%\&\'\*\+_/=\?^\-`\{|\}~\.' # technically allowed by RFC-2822
      RE_DOMAIN_HEAD  = '(?:[A-Z0-9\-]+\.)+'
      RE_DOMAIN_TLD   = '(?:[A-Z]{2}|com|org|net|gov|mil|biz|info|mobi|name|aero|jobs|museum)'
      RE_EMAIL_OK     = /\A#{RE_EMAIL_NAME}@#{RE_DOMAIN_HEAD}#{RE_DOMAIN_TLD}\z/i
      MSG_EMAIL_BAD   = "should look like an email address."
  
      def self.included(base)
        base.extend Validations::ClassMethods
      end
  
      module ClassMethods
        def validates_email(*fields)
          fields.each do |field|
            validates_presence_of   field
            validates_length_of     field, :within => 6..100 #r@a.wk
            validates_uniqueness_of field, :case_sensitive => false
            validates_format_of     field, :with => RE_EMAIL_OK, :message => MSG_EMAIL_BAD
          end
        end
      end
  #end
end
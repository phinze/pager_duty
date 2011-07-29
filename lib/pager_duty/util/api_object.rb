require 'pager_duty/util'

module Util::ApiObject
  def self.included(base)
    base.extend ClassMethods
    base.class_eval do
      class << self
        alias_method :from_hash, :new
      end
    end
  end

  module ClassMethods
    def top_level_attribute(*attributes)
      attributes.each do |attribute|
        define_method(attribute) do
          _hash_data[attribute.to_s]
        end
      end
    end
    alias_method :top_level_attributes, :top_level_attribute

    def delegate_subhash(key, klass)
      define_method(key) do
        klass.from_hash(_hash_data[key])
      end
    end
  end

  def initialize(hash_data)
    @__hash_data = hash_data
  end

  def _hash_data
    @__hash_data
  end
end

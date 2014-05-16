require "hasho/version"

module Hasho

  def self.included(base)
    base.send(:include, InstanceMethods)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def hash_methods(*attrs)
      @selected_attrs = attrs
    end

    def selected_attrs
      @selected_attrs
    end
  end

  module InstanceMethods
    def to_h
      selected_attrs.each_with_object(Hash.new) do |method, hash_representation|
        hash_representation[method] = send(method)
      end
    end

    private

    def selected_attrs
      self.class.selected_attrs || public_methods(false)
    end
  end
end

require 'danske_helligdage'

module DanskeHelligdage
  module Juleaftensdag

    def self.included(base)
      base.class_eval do
        alias_method :helligdag_without_juleaften, :helligdag
        alias_method :helligdag, :helligdag_with_juleaften
      end
    end

    def helligdag_with_juleaften
      juleaftensdag? ? 'Juleaftensdag' : helligdag_without_juleaften
    end

  end
end

Date.send(:include, DanskeHelligdage::Juleaftensdag)

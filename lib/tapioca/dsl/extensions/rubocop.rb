# typed: strict
# frozen_string_literal: true

begin
  require "rubocop"
rescue LoadError
  return
end

module Tapioca
  module Dsl
    module Compilers
      module Extensions
        module RuboCop
          extend T::Sig

          MethodName = T.type_alias { T.any(String, Symbol) }

          sig { params(name: MethodName, _args: T.untyped, defaults: T.untyped).returns(MethodName) }
          def def_node_matcher(name, *_args, **defaults)
            __tapioca_node_methods << name
            __tapioca_node_methods << :"without_defaults_#{name}" unless defaults.empty?

            super
          end

          sig { params(name: MethodName, _args: T.untyped, defaults: T.untyped).returns(MethodName) }
          def def_node_search(name, *_args, **defaults)
            __tapioca_node_methods << name
            __tapioca_node_methods << :"without_defaults_#{name}" unless defaults.empty?

            super
          end

          sig { returns(T::Array[MethodName]) }
          def __tapioca_node_methods
            @__tapioca_node_methods = T.let(@__tapioca_node_methods, T.nilable(T::Array[MethodName]))
            @__tapioca_node_methods ||= []
          end

          ::RuboCop::Cop::Base.singleton_class.prepend(self)
        end
      end
    end
  end
end

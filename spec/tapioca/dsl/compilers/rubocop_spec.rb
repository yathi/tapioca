# typed: strict
# frozen_string_literal: true

require "spec_helper"
require "rubocop"
require "rubocop-sorbet"

module Tapioca
  module Dsl
    module Compilers
      class RuboCopSpec < ::DslSpec
        # Collect constants from gems, before defining any in tests.
        EXISTING_CONSTANTS = T.let(
          Runtime::Reflection
            .descendants_of(::RuboCop::Cop::Base)
            .filter_map { |constant| Runtime::Reflection.name_of(constant) },
          T::Array[String],
        )

        class << self
          extend T::Sig

          sig { override.returns(String) }
          def target_class_file
            # Against convention, RuboCop uses "rubocop" in its file names, so we do too.
            super.gsub("rubo_cop", "rubocop")
          end
        end

        describe "Tapioca::Dsl::Compilers::RuboCop" do
          sig { void }
          def before_setup
            require "tapioca/dsl/extensions/rubocop"
            super
          end

          describe "initialize" do
            it "gathered constants exclude irrelevant classes" do
              add_ruby_file("content.rb", <<~RUBY)
                class Unrelated
                end
              RUBY
              assert_empty(relevant_gathered_constants)
            end

            it "gathers constants inheriting RuboCop::Cop::Base in gems" do
              # Sample of miscellaneous constants that should be found from Rubocop and plugins
              missing_constants = [
                "RuboCop::Cop::Bundler::GemVersion",
                "RuboCop::Cop::Cop",
                "RuboCop::Cop::Gemspec::DependencyVersion",
                "RuboCop::Cop::Lint::Void",
                "RuboCop::Cop::Metrics::ClassLength",
                "RuboCop::Cop::Migration::DepartmentName",
                "RuboCop::Cop::Naming::MethodName",
                "RuboCop::Cop::Security::CompoundHash",
                "RuboCop::Cop::Sorbet::ValidSigil",
                "RuboCop::Cop::Style::YodaCondition",
              ] - gathered_constants

              assert_empty(missing_constants, "expected constants to be gathered")
            end

            it "gathers constants inheriting from RuboCop::Cop::Base in the host app" do
              add_ruby_file("content.rb", <<~RUBY)
                class MyCop < ::RuboCop::Cop::Base
                end

                class MyLegacyCop < ::RuboCop::Cop::Cop
                end

                module ::RuboCop
                  module Cop
                    module MyApp
                      class MyNamespacedCop < Base
                      end
                    end
                  end
                end
              RUBY

              assert_equal(
                ["MyCop", "MyLegacyCop", "RuboCop::Cop::MyApp::MyNamespacedCop"],
                relevant_gathered_constants,
              )
            end
          end

          describe "decorate" do
            it "generates empty RBI when no DSL used" do
              add_ruby_file("content.rb", <<~RUBY)
                class MyCop < ::RuboCop::Cop::Base
                  def on_send(node);end
                end
              RUBY

              expected = <<~RBI
                # typed: strong
              RBI

              assert_equal(expected, rbi_for(:MyCop))
            end

            it "generates correct RBI file" do
              add_ruby_file("content.rb", <<~RUBY)
                class MyCop < ::RuboCop::Cop::Base
                  def_node_matcher :some_matcher, "(...)"
                  def_node_matcher :some_matcher_with_params, "(%1 %two ...)"
                  def_node_matcher :some_matcher_with_params_and_defaults, "(%1 %two ...)", two: :default
                  def_node_matcher :some_predicate_matcher?, "(...)"
                  def_node_search :some_search, "(...)"
                  def_node_search :some_search_with_params, "(%1 %two ...)"
                  def_node_search :some_search_with_params_and_defaults, "(%1 %two ...)", two: :default

                  def on_send(node);end
                end
              RUBY

              expected = <<~RBI
                # typed: strong

                class MyCop
                  sig { params(param0: T.untyped).returns(T.untyped) }
                  def some_matcher(param0 = T.unsafe(nil)); end

                  sig { params(param0: T.untyped, param1: T.untyped, two: T.untyped).returns(T.untyped) }
                  def some_matcher_with_params(param0 = T.unsafe(nil), param1, two:); end

                  sig { params(args: T.untyped, values: T.untyped).returns(T.untyped) }
                  def some_matcher_with_params_and_defaults(*args, **values); end

                  sig { params(param0: T.untyped).returns(T.untyped) }
                  def some_predicate_matcher?(param0 = T.unsafe(nil)); end

                  sig { params(param0: T.untyped).returns(T.untyped) }
                  def some_search(param0); end

                  sig { params(param0: T.untyped, param1: T.untyped, two: T.untyped).returns(T.untyped) }
                  def some_search_with_params(param0, param1, two:); end

                  sig { params(args: T.untyped, values: T.untyped).returns(T.untyped) }
                  def some_search_with_params_and_defaults(*args, **values); end

                  sig { params(param0: T.untyped, param1: T.untyped, two: T.untyped).returns(T.untyped) }
                  def without_defaults_some_matcher_with_params_and_defaults(param0 = T.unsafe(nil), param1, two:); end

                  sig { params(param0: T.untyped, param1: T.untyped, two: T.untyped).returns(T.untyped) }
                  def without_defaults_some_search_with_params_and_defaults(param0, param1, two:); end
                end
              RBI

              assert_equal(expected, rbi_for(:MyCop))
            end
          end

          private

          sig { returns(T::Array[String]) }
          def relevant_gathered_constants
            gathered_constants - EXISTING_CONSTANTS
          end
        end
      end
    end
  end
end

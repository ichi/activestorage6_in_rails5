module ActiveRecord
  module Reflection
    class << self
      def create(macro, name, scope, options, ar)
        reflection = reflection_class_for(macro).new(name, scope, options, ar)
        options[:through] ? ThroughReflection.new(reflection) : reflection
      end

      private
        def reflection_class_for(macro)
          case macro
          when :composed_of
            AggregateReflection
          when :has_many
            HasManyReflection
          when :has_one
            HasOneReflection
          when :belongs_to
            BelongsToReflection
          else
            raise "Unsupported Macro: #{macro}"
          end
        end
    end
  end
end

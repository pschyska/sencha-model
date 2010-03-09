##
# MongoMapper adapter to Whorm::Model mixin
#
    
module Whorm
  module Model
    ##
    # ClassMethods
    #
    module ClassMethods

      def whorm_primary_key
        :id
      end

      def whorm_column_names
        self.column_names
      end

      def whorm_columns_hash
        self.keys
      end

      def whorm_associations
        @whorm_associations ||= self.associations.inject({}) do |memo, (key, assn)|
          memo[key.to_sym] = {
            :name => key.to_sym,
            :type => assn.type,
            :class => assn.class_name.constantize,
            :foreign_key => assn.foreign_key,
            :is_polymorphic => false
          }
          memo
        end
      end

      def whorm_type(col)
        type = col.type.to_s
        case type
          when "DateTime", "Date", "Time"
            type = :date
          when "String"
            type = :string
          when "Float"
            type = :float
          when "Integer", "BigDecimal"
            type = :int
          else
            type = "auto"
        end
      end

      def whorm_allow_blank(col)
        (col.name == '_id') || (col.options[:required] != true)
      end
      
      def whorm_default(col)
        col.default_value
      end
      
    end
  end
end


##
# DataMapper adapter for Whorm::Model mixin
#

module Whorm
  module Model
    module ClassMethods
      
      def whorm_primary_key
        self.key.first.name
      end
      
      def whorm_column_names
        self.properties.collect {|p| p.name.to_s }
      end
      
      def whorm_columns_hash
        if @whorm_columns_hash.nil?
          @whorm_columns_hash = {}
          self.properties.each do |p|
            @whorm_columns_hash[p.name] = p
          end
        end
        @whorm_columns_hash
      end
      
      def whorm_allow_blank(col)
         (col === self.key.first) ? true : col.nullable?
      end
      
      def whorm_type(col)
        type = ((col.type.respond_to?(:primitive)) ? col.type.primitive : col.type).to_s
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
      
      def whorm_associations
        if @whorm_associations.nil?  
          @whorm_associations = {}
          self.relationships.keys.each do |key|
            assn = self.relationships[key]
            @whorm_associations[key.to_sym] = {
              :name => key, 
              :type => type = (assn.options[:max].nil? && assn.options[:min].nil?) ? :belongs_to : (assn.options[:max] > 1) ? :many : nil ,
              :class => assn.parent_model,
              :foreign_key => assn.child_key.first.name,
              :is_polymorphic => false # <-- No impl. for DM is_polymorphic.  Anyone care to implement this?
            }
          end
        end
        @whorm_associations
      end
    end
  end
end


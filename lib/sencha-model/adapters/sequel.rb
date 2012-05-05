##
# Sequel adapter to Sencha::Model mixin
#
module Sencha
  module Model
    module ClassMethods
      def sencha_primary_key
        self.primary_key.to_sym
      end
      
      def sencha_column_names
        self.column_names.map(&:to_sym)
      end
      
      def sencha_columns_hash
        self.columns
      end
      
      ##
      # determine if supplied Column object is nullable
      # @param {ActiveRecord::ConnectionAdapters::Column}
      # @return {Boolean}
      #
      def sencha_allow_blank(col)
        # if the column is the primary key always allow it to be blank.
        # Otherwise we could not create new records with sencha because
        # new records have no id and thus cannot be valid
        col.name == self.primary_key || col.null
      end
      
      ##
      # returns the default value
      # @param {ActiveRecord::ConnectionAdapters::Column}
      # @return {Mixed}
      #
      def sencha_default(col)
        col.default
      end
      
      ##
      # returns the corresponding column name of the type column for a polymorphic association
      # @param {String/Symbol} the id column name for this association
      # @return {Symbol}
      def sencha_polymorphic_type(id_column_name)
        id_column_name.to_s.gsub(/_id\Z/, '_type').to_sym
      end
      
      ##
      # determine datatype of supplied Column object
      # @param {ActiveRecord::ConnectionAdapters::Column}
      # @return {String}
      #
      def sencha_type(col)
        type = col.type.to_s
        case type
          when "datetime", "date", "time", "timestamp"
            type = "date"
          when "text"
            type = "string"
          when "integer"
            type = "int"
          when "decimal"
            type = "float"
        end
        type
      end
      
      ##
      # return a simple, normalized list of AR associations having the :name, :type and association class
      # @return {Array}
      #
      def sencha_associations
        @sencha_associations ||= self.all_association_reflections.inject({}) do |memo, assn|
          type=case assn.class
          when Sequel::Model::Associations::OneToOneAssociationReflection
            :one
          when Sequel::Model::Associations::ManyToOneAssociationReflection
            :one
          when Sequel::Model::Associations::OneToManyAssociationReflection
            :many
          when Sequel::Model::Associations::ManyToManyAssociationReflection
            :many
          end
          memo[assn[:key]] = {
            :name => assn[:name], 
            :type => type, 
            :class => assn[:class],
            :foreign_key => assn[:foreign_key],
            :is_polymorphic => false
          }
          p memo
          memo
        end
      end
    end
  end
end


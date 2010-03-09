class Test::Unit::TestCase
    ##
    # Asserts that the passed list of fields are specified in the whorm_fields call
    # in the model class.
    # @fields {Symbols} fields A list of fields
    #
  def self.should_have_whorm_fields *fields
    klass = described_type
    should "have the correct whorm_fields" do
      fields.each do |field|
        found_record = klass.whorm_record_fields.find do|record_field|
          record_field[:name] == field.to_s
        end
        assert_not_nil found_record, "whorm field #{field} isn't listed in the #{klass.name} model"
      end
    end
  end
end

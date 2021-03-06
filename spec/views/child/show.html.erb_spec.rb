require 'spec_helper'

class Schema;
end

describe "children/show.html.erb" do

  describe "displaying a child's details"  do

    it "displays the Child's photo"

    it "renders all fields found on the FormSection" do

      form_section = FormSection.new :unique_id => "section_name"
      form_section.add_field Field.new_text_field("age")
      form_section.add_field Field.new_radio_button("gender", ["male", "female"])
      form_section.add_field Field.new_select_box("date_of_separation", ["1-2 weeks ago", "More than"])

      child = Child.new :age => "27", :gender => "male", :date_of_separation => "1-2 weeks ago", :unique_identifier => "georgelon12345", :_id => "id12345"

      assigns[:form_sections] = [form_section]
      assigns[:child] = child

      render

      response.should have_selector("dt:first") do |dt|
        dt.should contain("Unique Id")
      end
      response.should have_selector("dd:first") do |dd|
        dd.should contain("georgelon12345")
      end

      response.should have_selector("dl.section_name dt") do |fields|
        fields[0].should contain("Age")
        fields[1].should contain("Gender")
        fields[2].should contain("Date of separation")
      end
      
      response.should have_selector("dl.section_name dd") do |fields|
        fields[0].should contain("27")
        fields[1].should contain("male")
        fields[2].should contain("1-2 weeks ago")
      end
    end

  end

end

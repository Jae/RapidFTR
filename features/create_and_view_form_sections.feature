Feature: As an admin I should be able to create and view form sections
  Scenario:      To view a list of existing forms as an admin
    Given the following form sections exist in the system:
      | name   | description | unique_id |
      | Basic Details | Basic details about a child | basic_details |
      | Family Details   | Details of the child's family | family_details |
      | Caregiver Details   |  | caregiver_details |
    Given "admin" is logged in
    When I am on form section page
    Then I should see the "Basic Details" form section link
    And I should see the "Family Details" form section link
    And I should see the "Caregiver Details" form section link
    And I should see the description text "Basic details about a child" for form section "basic_details"
    And I should see the description text "Details of the child's family" for form section "family_details"

  Scenario: To be able to view the disabled and enabled status of form sections
    Given the following form sections exist in the system:
      | name   |  enabled | unique_id |
      | Basic Details | true | section_1 |
      | Caregiver Details   | false | section_2 |
    Given "admin" is logged in
    When I am on form section page
    Then I should see a tick in the enabled column for the form section "section_1"
    And I should see a cross in the enabled column for the form section "section_2"
    And I should see the text "Enabled" in the enabled column for the form section "section_1"
    And I should see the text "Disabled" in the enabled column for the form section "section_2"

  Scenario: To be able to view current order of the form sections
    Given the following form sections exist in the system:
      | name   |  order | unique_id |
      | Basic Details | 10 | section_1 |
      | Caregiver Details   | 1 | section_2 |
    Given "admin" is logged in
    When I am on form section page
    Then I should see the form section "section_1" in row 2
    And I should see the form section "section_2" in row 1
    And I should see a current order of "10" for the "section_1" form section
    And I should see a current order of "1" for the "section_2" form section 

    

  


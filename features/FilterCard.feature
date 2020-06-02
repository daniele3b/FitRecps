Feature: User can filter cards

Scenario: Filter cards
    Given I am on the FitRecps cards page
    When I follow "Filter"
    Then I should be on the Filter Card Page
    When I fill in "zona" with "Lombare"
    And I press "Save"
    Then I should be on the Fitrecps filter card page
    And I should see 'Lombare' 



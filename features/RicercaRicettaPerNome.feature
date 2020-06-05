Feature: User can find recipes using a name

Scenario: Find recipes with a name
    Given I am on the FitRecps recipes page
    When I follow "Filtra"
    Then I should be on the Filter Recipe Page
    When I fill in "nome" with "pizza"
    And I press "Save"
    Then I should be on the Fitrecps filter recipe page
    And I should see 'pizza' 
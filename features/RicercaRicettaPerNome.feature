Feature: User can find recipes using a name


Scenario: Find recipes with a name
    
    Given I am on the FitRecps login page
    When I follow "Registrati"
    Then I should be on the FitRecps registration page
    When I fill in "email" with "federeristheway@gmail.com"
    And I fill in "password" with "roger100x100"
    And I fill in "password_confirmation" with "roger100x100"
    And I press "Entra in FitRecps!"
    Then I should be on the FitRecps cards page
    When I follow "Ricette"
    Then I should be on the FitRecps recipes page
    When I follow "Filtra"
    Then I should be on the Filter Recipe Page
    When I fill in "nome" with "pizza"
    And I press "Cerca"
    Then I should be on the Fitrecps filter recipe page
    And I should see "pizza" 
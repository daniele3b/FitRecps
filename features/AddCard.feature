Feature: Employee can add a card
   

Scenario: Find recipes with a name
    Given I am on the FitRecps login page
    When I follow "Registrati"
    Then I should be on the FitRecps registration page
    When I fill in "email" with "federeristheway@gmail.com"
    And I fill in "password" with "roger100x100"
    And I fill in "password_confirmation" with "roger100x100"
    And I press "Entra in FitRecps!"
    Then I should be on the FitRecps cards page
    When I follow "Le mie schede"
    Then I should be on the FitRecps my cards page
    When I follow "Aggiungi"
    Then I should be on the Fitrecps add card page
    When I fill in "durata" with "1h 20m"
    And I fill in "zona" with "Spalle"
    And I select "body building" from "categoria"
    And I fill in "esercizi" with "20x Spartan push up"
    And I fill in "energia" with "666"
    And I fill in "tutorial" with "http://youtube.com"
    And I press "Save"
    Then I should be on the FitRecps cards page
    And I should see "Spalle" 
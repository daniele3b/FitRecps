Feature: User can add a rating to a recipe
   

Scenario: Add a rating to a recipe
    Given I am on the FitRecps login page
    When Employee is created
    And I fill in "email" with "federeristheway@gmail.com"
    And I fill in "password" with "roger100x100"
    And I get promoted
    And I press "Log in"
    Then I should be on the FitRecps cards page
    When I follow "Le mie Ricette"
    Then I should be on the FitRecps my recipes page
    When I follow "Aggiungi"
    Then I should be on the Fitrecps add recipes page
    When I fill in "Nome" with "pizza"
    And I select "Primo" from "Tipo"
    And I fill in "Ingredienti" with "sugo mozzarella basilico"
    And I fill in "Proteine" with "1"
    And I fill in "Grassi" with "2"
    And I fill in "Carboidrati" with "10"
    And I fill in "Energia" with "2"
    And I press "Aggiungi"
    Then I should be on the FitRecps cards page
    When I follow "Ricette"
    Then I should be on the FitRecps recipes page
    When I follow "Info pizza"
    Then I should see "Dettagli ricetta"
    When I follow "Rating"
    Then I should see "Inserisci un rating alla ricetta"
    When I fill in "Valore" with "5.0"
    And I press "Rate"
    Then I should be on the FitRecps recipes page
    When I follow "Info pizza"
    Then I should see "5.0"
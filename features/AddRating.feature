Feature: User can add a rating to a recipe
   

Scenario: Add a rating to a recipe
    Given I am on the FitRecps login page
    When I follow "Registrati"
    Then I should be on the FitRecps registration page
    When I fill in "email" with "federeristheway@gmail.com"
    And I fill in "password" with "roger100x100"
    And I fill in "password_confirmation" with "roger100x100"
    And I press "Entra in FitRecps!"
    Then I should be on the FitRecps cards page
    When I follow "Le mie ricette"
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
    When I follow "Infopizza"
    Then I should see "Dettagli ricetta"
    When I follow "Rating"
    Then I should see "Inserisci un rating alla ricetta"
    When I fill in "Valore" with "5.0"
    And I press "Rate"
    Then I should be on the FitRecps recipes page
    When I follow "Infopizza"
    Then I should see "5.0"
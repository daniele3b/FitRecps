Canard::Abilities.for(:User) do
  #can [:read], Recipe
  #can [:read], Card
  #cannot [:destroy, :update, :create], Recipe
  #cannot [:destroy, :update, :create], Card
end

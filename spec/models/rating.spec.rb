require 'rails_helper'


RSpec.describe Recipe, :type => :model do
    User.delete_all
    Recipe.delete_all
    Rating.delete_all

    describe "Create rating " do
        it "should be permitted" do
            m1 = User.new(:id => '1', :nome=>'bho',:cognome=>'bho9',:luogoNascita=>'ciao',:dataNascita=>'1998/12/2',:sesso=>'m',:email => 'prova1@example.it', :password => 'useruser')
            m1.save!
            recipe = Recipe.new(:foto=>'foto', :codice=>'codice', :nome=>'persona', :tipo=>'Primo', :arachidi_e_derivati=>'SI',
                :frutta_a_guscio=>'NO', :latte_e_derivati=>'SI', :molluschi=>'NO',
                :pesce=>'SI', :sesamo=>'NO', :soia=>'SI', :crostacei=>'NO', :glutine=>'SI',
                :lupini=>'NO', :senape=>'SI', :sedano=>'NO',
                :anidride_solforosa_e_solfiti=>'SI', :uova_e_derivati=>'NO',
                :ingredienti=>'200 gr sdaf 2edncsdv', :procedimento=>'a caso', :energia=>200, :carboidrati=>5,
                :grassi=>231, :proteine=>123, :fibre=>12312, :sodio=>1214, :video_tutorial=>'sdasf',
                :user_id=>m1.id, :interazioni=>0)
            recipe.save!
            rating=Rating.new(:valore=>5.0,:recipes=>recipe.id,:users=>m1.id)

            expect(rating).to be_valid
        end
    end

    describe "Create rating without valore" do
        it "shouldn't be permitted" do
            m1 = User.new(:id => '1', :nome=>'bho',:cognome=>'bho9',:luogoNascita=>'ciao',:dataNascita=>'1998/12/2',:sesso=>'m',:email => 'prova1@example.it', :password => 'useruser')
            m1.save!
            recipe = Recipe.new(:foto=>'foto', :codice=>'codice', :nome=>'persona', :tipo=>'Primo', :arachidi_e_derivati=>'SI',
                :frutta_a_guscio=>'NO', :latte_e_derivati=>'SI', :molluschi=>'NO',
                :pesce=>'SI', :sesamo=>'NO', :soia=>'SI', :crostacei=>'NO', :glutine=>'SI',
                :lupini=>'NO', :senape=>'SI', :sedano=>'NO',
                :anidride_solforosa_e_solfiti=>'SI', :uova_e_derivati=>'NO',
                :ingredienti=>'200 gr sdaf 2edncsdv', :procedimento=>'a caso', :energia=>200, :carboidrati=>5,
                :grassi=>231, :proteine=>123, :fibre=>12312, :sodio=>1214, :video_tutorial=>'sdasf',
                :user_id=>m1.id, :interazioni=>0)
            recipe.save!
            rating=Rating.new(:recipes=>recipe.id,:users=>m1.id)

            expect(rating).not_to be_valid
        end
    end

    describe "Create rating without users" do
        it "should be permitted" do
            m1 = User.new(:id => '1', :nome=>'bho',:cognome=>'bho9',:luogoNascita=>'ciao',:dataNascita=>'1998/12/2',:sesso=>'m',:email => 'prova1@example.it', :password => 'useruser')
            m1.save!
            recipe = Recipe.new(:foto=>'foto', :codice=>'codice', :nome=>'persona', :tipo=>'Primo', :arachidi_e_derivati=>'SI',
                :frutta_a_guscio=>'NO', :latte_e_derivati=>'SI', :molluschi=>'NO',
                :pesce=>'SI', :sesamo=>'NO', :soia=>'SI', :crostacei=>'NO', :glutine=>'SI',
                :lupini=>'NO', :senape=>'SI', :sedano=>'NO',
                :anidride_solforosa_e_solfiti=>'SI', :uova_e_derivati=>'NO',
                :ingredienti=>'200 gr sdaf 2edncsdv', :procedimento=>'a caso', :energia=>200, :carboidrati=>5,
                :grassi=>231, :proteine=>123, :fibre=>12312, :sodio=>1214, :video_tutorial=>'sdasf',
                :user_id=>m1.id, :interazioni=>0)
            recipe.save!
            rating=Rating.new(:valore=>5.0,:recipes=>recipe.id)

            expect(rating).not_to be_valid
        end
    end

    describe "Create rating without valore" do
        it "should be permitted" do
            m1 = User.new(:id => '1', :nome=>'bho',:cognome=>'bho9',:luogoNascita=>'ciao',:dataNascita=>'1998/12/2',:sesso=>'m',:email => 'prova1@example.it', :password => 'useruser')
            m1.save!
            recipe = Recipe.new(:foto=>'foto', :codice=>'codice', :nome=>'persona', :tipo=>'Primo', :arachidi_e_derivati=>'SI',
                :frutta_a_guscio=>'NO', :latte_e_derivati=>'SI', :molluschi=>'NO',
                :pesce=>'SI', :sesamo=>'NO', :soia=>'SI', :crostacei=>'NO', :glutine=>'SI',
                :lupini=>'NO', :senape=>'SI', :sedano=>'NO',
                :anidride_solforosa_e_solfiti=>'SI', :uova_e_derivati=>'NO',
                :ingredienti=>'200 gr sdaf 2edncsdv', :procedimento=>'a caso', :energia=>200, :carboidrati=>5,
                :grassi=>231, :proteine=>123, :fibre=>12312, :sodio=>1214, :video_tutorial=>'sdasf',
                :user_id=>m1.id, :interazioni=>0)
            recipe.save!
            rating=Rating.new(:recipes=>recipe.id,:users=>m1.id)

            expect(rating).not_to be_valid
        end
    end

    



end

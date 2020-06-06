require 'rails_helper'


RSpec.describe Recipe, :type => :model do

    describe "Create recipe " do
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
            expect(recipe).to be_valid
        end
    end

    describe "Create recipe without foto " do
        it "should be permitted" do
            m1 = User.new(:id => '1', :nome=>'bho',:cognome=>'bho9',:luogoNascita=>'ciao',:dataNascita=>'1998/12/2',:sesso=>'m',:email => 'prova1@example.it', :password => 'useruser')
            m1.save!
            recipe = Recipe.new( :codice=>'codice', :nome=>'persona', :tipo=>'Primo', :arachidi_e_derivati=>'SI',
                :frutta_a_guscio=>'NO', :latte_e_derivati=>'SI', :molluschi=>'NO',
                :pesce=>'SI', :sesamo=>'NO', :soia=>'SI', :crostacei=>'NO', :glutine=>'SI',
                :lupini=>'NO', :senape=>'SI', :sedano=>'NO',
                :anidride_solforosa_e_solfiti=>'SI', :uova_e_derivati=>'NO',
                :ingredienti=>'200 gr sdaf 2edncsdv', :procedimento=>'a caso', :energia=>200, :carboidrati=>5,
                :grassi=>231, :proteine=>123, :fibre=>12312, :sodio=>1214, :video_tutorial=>'sdasf',
                :user_id=>m1.id, :interazioni=>0)
            expect(recipe).to be_valid
        end
    end


    describe "Create recipe without nome" do
        it "shouldn't be permitted" do
            m1 = User.new(:id => '1', :nome=>'bho',:cognome=>'bho9',:luogoNascita=>'ciao',:dataNascita=>'1998/12/2',:sesso=>'m',:email => 'prova1@example.it', :password => 'useruser')
            m1.save!
            recipe = Recipe.new(:foto=>'foto', :codice=>'codice', :tipo=>'Primo', :arachidi_e_derivati=>'SI',
                :frutta_a_guscio=>'NO', :latte_e_derivati=>'SI', :molluschi=>'NO',
                :pesce=>'SI', :sesamo=>'NO', :soia=>'SI', :crostacei=>'NO', :glutine=>'SI',
                :lupini=>'NO', :senape=>'SI', :sedano=>'NO',
                :anidride_solforosa_e_solfiti=>'SI', :uova_e_derivati=>'NO',
                :ingredienti=>'200 gr sdaf 2edncsdv', :procedimento=>'a caso', :energia=>200, :carboidrati=>5,
                :grassi=>231, :proteine=>123, :fibre=>12312, :sodio=>1214, :video_tutorial=>'sdasf',
                :user_id=>m1.id, :interazioni=>0)
            expect(recipe).not_to be_valid
        end
    end


    describe "Create recipe without tipo" do
        it "shouldn't be permitted" do
            m1 = User.new(:id => '1', :nome=>'bho',:cognome=>'bho9',:luogoNascita=>'ciao',:dataNascita=>'1998/12/2',:sesso=>'m',:email => 'prova1@example.it', :password => 'useruser')
            m1.save!
            recipe = Recipe.new(:foto=>'foto', :codice=>'codice', :nome=>'persona', :arachidi_e_derivati=>'SI',
                :frutta_a_guscio=>'NO', :latte_e_derivati=>'SI', :molluschi=>'NO',
                :pesce=>'SI', :sesamo=>'NO', :soia=>'SI', :crostacei=>'NO', :glutine=>'SI',
                :lupini=>'NO', :senape=>'SI', :sedano=>'NO',
                :anidride_solforosa_e_solfiti=>'SI', :uova_e_derivati=>'NO',
                :ingredienti=>'200 gr sdaf 2edncsdv', :procedimento=>'a caso', :energia=>200, :carboidrati=>5,
                :grassi=>231, :proteine=>123, :fibre=>12312, :sodio=>1214, :video_tutorial=>'sdasf',
                :user_id=>m1.id, :interazioni=>0)
            expect(recipe).not_to be_valid
        end
    end

    describe "Create recipe without arachidi_derivati" do
        it "should be permitted" do
            m1 = User.new(:id => '1', :nome=>'bho',:cognome=>'bho9',:luogoNascita=>'ciao',:dataNascita=>'1998/12/2',:sesso=>'m',:email => 'prova1@example.it', :password => 'useruser')
            m1.save!
            recipe = Recipe.new(:foto=>'foto', :codice=>'codice', :nome=>'persona', :tipo=>'Primo', 
                :frutta_a_guscio=>'NO', :latte_e_derivati=>'SI', :molluschi=>'NO',
                :pesce=>'SI', :sesamo=>'NO', :soia=>'SI', :crostacei=>'NO', :glutine=>'SI',
                :lupini=>'NO', :senape=>'SI', :sedano=>'NO',
                :anidride_solforosa_e_solfiti=>'SI', :uova_e_derivati=>'NO',
                :ingredienti=>'200 gr sdaf 2edncsdv', :procedimento=>'a caso', :energia=>200, :carboidrati=>5,
                :grassi=>231, :proteine=>123, :fibre=>12312, :sodio=>1214, :video_tutorial=>'sdasf',
                :user_id=>m1.id, :interazioni=>0)
            expect(recipe).to be_valid
        end
    end


    describe "Create recipe without frutta" do
        it "should be permitted" do
            m1 = User.new(:id => '1', :nome=>'bho',:cognome=>'bho9',:luogoNascita=>'ciao',:dataNascita=>'1998/12/2',:sesso=>'m',:email => 'prova1@example.it', :password => 'useruser')
            m1.save!
            recipe = Recipe.new(:foto=>'foto', :codice=>'codice', :nome=>'persona', :tipo=>'Primo', :arachidi_e_derivati=>'SI',
                :latte_e_derivati=>'SI', :molluschi=>'NO',
                :pesce=>'SI', :sesamo=>'NO', :soia=>'SI', :crostacei=>'NO', :glutine=>'SI',
                :lupini=>'NO', :senape=>'SI', :sedano=>'NO',
                :anidride_solforosa_e_solfiti=>'SI', :uova_e_derivati=>'NO',
                :ingredienti=>'200 gr sdaf 2edncsdv', :procedimento=>'a caso', :energia=>200, :carboidrati=>5,
                :grassi=>231, :proteine=>123, :fibre=>12312, :sodio=>1214, :video_tutorial=>'sdasf',
                :user_id=>m1.id, :interazioni=>0)
            expect(recipe).to be_valid
        end
    end


    describe "Create recipe without ingredienti " do
        it "shouldn't be permitted" do
            m1 = User.new(:id => '1', :nome=>'bho',:cognome=>'bho9',:luogoNascita=>'ciao',:dataNascita=>'1998/12/2',:sesso=>'m',:email => 'prova1@example.it', :password => 'useruser')
            m1.save!
            recipe = Recipe.new(:foto=>'foto', :codice=>'codice', :nome=>'persona', :tipo=>'Primo', :arachidi_e_derivati=>'SI',
                :frutta_a_guscio=>'NO', :latte_e_derivati=>'SI', :molluschi=>'NO',
                :pesce=>'SI', :sesamo=>'NO', :soia=>'SI', :crostacei=>'NO', :glutine=>'SI',
                :lupini=>'NO', :senape=>'SI', :sedano=>'NO',
                :anidride_solforosa_e_solfiti=>'SI', :uova_e_derivati=>'NO', :procedimento=>'a caso', :energia=>200, :carboidrati=>5,
                :grassi=>231, :proteine=>123, :fibre=>12312, :sodio=>1214, :video_tutorial=>'sdasf',
                :user_id=>m1.id, :interazioni=>0)
            expect(recipe).not_to be_valid
        end
    end

    describe "Create recipe without carboidrati " do
        it "shouldn't be permitted" do
            m1 = User.new(:id => '1', :nome=>'bho',:cognome=>'bho9',:luogoNascita=>'ciao',:dataNascita=>'1998/12/2',:sesso=>'m',:email => 'prova1@example.it', :password => 'useruser')
            m1.save!
            recipe = Recipe.new(:foto=>'foto', :codice=>'codice', :nome=>'persona', :tipo=>'Primo', :arachidi_e_derivati=>'SI',
                :frutta_a_guscio=>'NO', :latte_e_derivati=>'SI', :molluschi=>'NO',
                :pesce=>'SI', :sesamo=>'NO', :soia=>'SI', :crostacei=>'NO', :glutine=>'SI',
                :lupini=>'NO', :senape=>'SI', :sedano=>'NO',
                :anidride_solforosa_e_solfiti=>'SI', :uova_e_derivati=>'NO',
                :ingredienti=>'200 gr sdaf 2edncsdv', :procedimento=>'a caso', :energia=>200,
                :grassi=>231, :proteine=>123, :fibre=>12312, :sodio=>1214, :video_tutorial=>'sdasf',
                :user_id=>m1.id, :interazioni=>0)
            expect(recipe).not_to be_valid
        end
    end

    describe "Create recipe without grassi " do
        it "shouldn't be permitted" do
            m1 = User.new(:id => '1', :nome=>'bho',:cognome=>'bho9',:luogoNascita=>'ciao',:dataNascita=>'1998/12/2',:sesso=>'m',:email => 'prova1@example.it', :password => 'useruser')
            m1.save!
            recipe = Recipe.new(:foto=>'foto', :codice=>'codice', :nome=>'persona', :tipo=>'Primo', :arachidi_e_derivati=>'SI',
                :frutta_a_guscio=>'NO', :latte_e_derivati=>'SI', :molluschi=>'NO',
                :pesce=>'SI', :sesamo=>'NO', :soia=>'SI', :crostacei=>'NO', :glutine=>'SI',
                :lupini=>'NO', :senape=>'SI', :sedano=>'NO',
                :anidride_solforosa_e_solfiti=>'SI', :uova_e_derivati=>'NO',
                :ingredienti=>'200 gr sdaf 2edncsdv', :procedimento=>'a caso', :energia=>200, :carboidrati=>5, :proteine=>123, :fibre=>12312, :sodio=>1214, :video_tutorial=>'sdasf',
                :user_id=>m1.id, :interazioni=>0)
            expect(recipe).not_to be_valid
        end
    end

    describe "Create recipe without proteine " do
        it "shouldn't be permitted" do
            m1 = User.new(:id => '1', :nome=>'bho',:cognome=>'bho9',:luogoNascita=>'ciao',:dataNascita=>'1998/12/2',:sesso=>'m',:email => 'prova1@example.it', :password => 'useruser')
            m1.save!
            recipe = Recipe.new(:foto=>'foto', :codice=>'codice', :nome=>'persona', :tipo=>'Primo', :arachidi_e_derivati=>'SI',
                :frutta_a_guscio=>'NO', :latte_e_derivati=>'SI', :molluschi=>'NO',
                :pesce=>'SI', :sesamo=>'NO', :soia=>'SI', :crostacei=>'NO', :glutine=>'SI',
                :lupini=>'NO', :senape=>'SI', :sedano=>'NO',
                :anidride_solforosa_e_solfiti=>'SI', :uova_e_derivati=>'NO',
                :ingredienti=>'200 gr sdaf 2edncsdv', :procedimento=>'a caso', :energia=>200, :carboidrati=>5,
                :grassi=>231, :fibre=>12312, :sodio=>1214, :video_tutorial=>'sdasf',
                :user_id=>m1.id, :interazioni=>0)
            expect(recipe).not_to be_valid
        end
    end

    describe "Create recipe without energia" do
        it "shouldn't be permitted" do
            m1 = User.new(:id => '1', :nome=>'bho',:cognome=>'bho9',:luogoNascita=>'ciao',:dataNascita=>'1998/12/2',:sesso=>'m',:email => 'prova1@example.it', :password => 'useruser')
            m1.save!
            recipe = Recipe.new(:foto=>'foto', :codice=>'codice', :nome=>'persona', :tipo=>'Primo', :arachidi_e_derivati=>'SI',
                :frutta_a_guscio=>'NO', :latte_e_derivati=>'SI', :molluschi=>'NO',
                :pesce=>'SI', :sesamo=>'NO', :soia=>'SI', :crostacei=>'NO', :glutine=>'SI',
                :lupini=>'NO', :senape=>'SI', :sedano=>'NO',
                :anidride_solforosa_e_solfiti=>'SI', :uova_e_derivati=>'NO',
                :ingredienti=>'200 gr sdaf 2edncsdv', :procedimento=>'a caso', :carboidrati=>5,
                :grassi=>231, :proteine=>123, :fibre=>12312, :sodio=>1214, :video_tutorial=>'sdasf',
                :user_id=>m1.id, :interazioni=>0)
            expect(recipe).not_to be_valid
        end
    end

    


    





end

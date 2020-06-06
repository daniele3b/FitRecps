require 'rails_helper'


RSpec.describe Card, :type => :model do
  
   describe "Create card " do
        it "should be permitted" do
            m1 = User.new( :id=>'1',:nome=>'bho',:cognome=>'bho9',:luogoNascita=>'ciao',:dataNascita=>'1998/12/2',:sesso=>'m',:email => 'prova1@example.it', :password => 'useruser')
            m1.save!
            card = Card.new(:spiegazione=>'sfasfsa',:user_id =>m1.id, :idf => 'Titolo', :durata => '1h20m', :categoria => 'body building',:zona=>'Lombare',:energia=>200, :esercizi => '20xsquat',:tutorial=>'sasf',:interazioni=>0)
            expect(card).to be_valid
        end
    end

    describe "Create card without an idf" do
        it "shouldn't be permitted" do
            m1 = User.new(:id => '1', :nome=>'bho',:cognome=>'bho9',:luogoNascita=>'ciao',:dataNascita=>'1998/12/2',:sesso=>'m',:email => 'prova1@example.it', :password => 'useruser')
            m1.save!
            card = Card.new(:user_id => m1, :durata => '1h20m', :categoria => 'body building',:zona=>'Lombare',:energia=>200, :esercizi => '20xsquat',:tutorial=>'sasf',:interazioni=>0,:spiegazione=>'sfasfsa')
          expect(card).not_to be_valid
        end
    end

    describe "Create card without durata" do
        it "shouldn't be permitted" do
            m1 = User.new(:id => '1', :nome=>'bho',:cognome=>'bho9',:luogoNascita=>'ciao',:dataNascita=>'1998/12/2',:sesso=>'m',:email => 'prova1@example.it', :password => 'useruser')
            m1.save!
            card = Card.new(:user_id => m1, :idf => 'Titolo', :categoria => 'body building',:zona=>'Lombare',:energia=>200, :esercizi => '20xsquat',:tutorial=>'sasf',:interazioni=>0,:spiegazione=>'sfasfsa')
            expect(card).not_to be_valid
        end
    end

    describe "Create card without categoria" do
        it "shouldn't be permitted" do
            m1 = User.new(:id => '1', :nome=>'bho',:cognome=>'bho9',:luogoNascita=>'ciao',:dataNascita=>'1998/12/2',:sesso=>'m',:email => 'prova1@example.it', :password => 'useruser')
            m1.save!
            card = Card.new(:user_id => m1, :idf => 'Titolo', :durata => '1h20m' ,:zona=>'Lombare',:energia=>200, :esercizi => '20xsquat',:tutorial=>'sasf',:interazioni=>0,:spiegazione=>'sfasfsa')
            expect(card).not_to be_valid
        end
    end


    describe "Create card without zona " do
        it "shouldn't be permitted" do
            m1 = User.new(:id => '1', :nome=>'bho',:cognome=>'bho9',:luogoNascita=>'ciao',:dataNascita=>'1998/12/2',:sesso=>'m',:email => 'prova1@example.it', :password => 'useruser')
            m1.save!
            card = Card.new(:user_id => m1, :idf => 'Titolo', :durata => '1h20m', :categoria => 'body building',:energia=>200, :esercizi => '20xsquat',:tutorial=>'sasf',:interazioni=>0,:spiegazione=>'sfasfsa')
            expect(card).not_to be_valid
        end
    end

    describe "Create card without energia " do
        it "shouldn't be permitted" do
            m1 = User.new(:id => '1', :nome=>'bho',:cognome=>'bho9',:luogoNascita=>'ciao',:dataNascita=>'1998/12/2',:sesso=>'m',:email => 'prova1@example.it', :password => 'useruser')
            m1.save!
            card = Card.new(:user_id => m1, :idf => 'Titolo', :durata => '1h20m', :categoria => 'body building',:zona=>'Lombare', :esercizi => '20xsquat',:tutorial=>'sasf',:interazioni=>0,:spiegazione=>'sfasfsa')
            expect(card).not_to be_valid
        end
    end

    describe "Create card without esercizi " do
        it "shouldn't be permitted" do
            m1 = User.new(:id => '1', :nome=>'bho',:cognome=>'bho9',:luogoNascita=>'ciao',:dataNascita=>'1998/12/2',:sesso=>'m',:email => 'prova1@example.it', :password => 'useruser')
            m1.save!
            card = Card.new(:user_id => m1, :idf => 'Titolo', :durata => '1h20m', :categoria => 'body building',:zona=>'Lombare',:energia=>200,:tutorial=>'sasf',:interazioni=>0,:spiegazione=>'sfasfsa')
            expect(card).not_to be_valid
        end
    end

    describe "Create card without tutorial" do
        it "shouldn't be permitted" do
            m1 = User.new(:id => '1', :nome=>'bho',:cognome=>'bho9',:luogoNascita=>'ciao',:dataNascita=>'1998/12/2',:sesso=>'m',:email => 'prova1@example.it', :password => 'useruser')
            m1.save!
            card = Card.new(:user_id => m1, :idf => 'Titolo', :durata => '1h20m', :categoria => 'body building',:zona=>'Lombare',:energia=>200, :esercizi => '20xsquat',:interazioni=>0,:spiegazione=>'sfasfsa')
            expect(card).not_to be_valid
        end
    end

    describe "Create card without interazioni " do
        it "shouldn't be permitted" do
            m1 = User.new(:id => '1', :nome=>'bho',:cognome=>'bho9',:luogoNascita=>'ciao',:dataNascita=>'1998/12/2',:sesso=>'m',:email => 'prova1@example.it', :password => 'useruser')
            m1.save!
            card = Card.new(:user_id => m1, :idf => 'Titolo', :durata => '1h20m', :categoria => 'body building',:zona=>'Lombare',:energia=>200, :esercizi => '20xsquat',:tutorial=>'sasf',:spiegazione=>'sfasfsa')
            expect(card).not_to be_valid
        end
    end


    describe "Create card without spiegazione " do
        it "should  be permitted" do
            m1 = User.new( :id=>'1',:nome=>'bho',:cognome=>'bho9',:luogoNascita=>'ciao',:dataNascita=>'1998/12/2',:sesso=>'m',:email => 'prova1@example.it', :password => 'useruser')
            m1.save!
            card = Card.new(:user_id =>m1.id, :idf => 'Titolo', :durata => '1h20m', :categoria => 'body building',:zona=>'Lombare',:energia=>200, :esercizi => '20xsquat',:tutorial=>'sasf',:interazioni=>0)
            expect(card).to be_valid
        end
    end


  


  
  end
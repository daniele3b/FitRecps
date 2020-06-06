require 'rails_helper'


RSpec.describe 'Search by name a recipe', type: :feature do
  Recipe.delete_all
  User.delete_all
  m1 = User.new( :id=>'1',:nome=>'bho',:cognome=>'bho9',:luogoNascita=>'ciao',:dataNascita=>'1998/12/2',:sesso=>'m',:email => 'd@gmail.com', :password => '12345678')
  m1.save!
  r1=Recipe.new( :codice=>'666', :nome=>'Ricetta per nome', :tipo=>'Primo',
    :ingredienti=>'200gr di guanciale 4 uova pecorino q.b.', :procedimento=>'cucinare con molta attenzione e NO PARMIGIANO', :energia=>55, :carboidrati=>2,
    :grassi=>12, :proteine=>34, :fibre=>234, :sodio=>234,
    :user_id=>m1.id, :interazioni=>0)
 r1.save!

  scenario 'Search a recipe by name' do
    visit new_user_session_path
    fill_in 'email', with: 'd@gmail.com'
    fill_in 'password', with: '12345678'
    click_on 'Log in'
    click_on 'Ricette'
    click_on 'Filtra'

    fill_in 'nome', with: 'Ricetta per nome'
   
    click_on 'Cerca'
    expect(page).to have_content('Ricetta per nome')
  end
end

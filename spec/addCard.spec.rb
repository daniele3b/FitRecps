require 'rails_helper'


RSpec.describe 'Add a new card if is an employee or admin', type: :feature do
  Card.delete_all
  User.delete_all
  m1 = User.new( :id=>'1',:admin=>1,:employee=>1,:nome=>'bho',:cognome=>'bho9',:luogoNascita=>'ciao',:dataNascita=>'1998/12/2',:sesso=>'m',:email => 'd@gmail.com', :password => '12345678')
  m1.save!

  scenario 'Add a new card' do
    visit new_user_session_path
    fill_in 'email', with: 'd@gmail.com'
    fill_in 'password', with: '12345678'
    click_on 'Log in'
    click_on 'Le mie schede'
    click_on 'Aggiungi'

    fill_in 'durata', with: '1h 20m'
    fill_in 'zona',with: 'Spalle'
    select 'body building', :from => 'categoria'
    fill_in 'esercizi',with:'20x Spartan push up'
    fill_in 'energia',with:666
    fill_in 'tutorial', with:'http://youtube.com'
    click_on 'Save'
    expect(page).to have_content('Spalle')
  end
end
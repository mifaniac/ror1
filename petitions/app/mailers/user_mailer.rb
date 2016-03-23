class UserMailer < ApplicationMailer

  def successful_petition_user(petition)
    @petition = petition
    @user = petition.user
    mail to: @user.email, subject: 'Петиция набрала необходимое количество голосов'
  end

  def successful_petition_admin(petition)
    @petition = petition
    mail to: "yadianna13@gmail.com", subject: 'Петиция набрала необходимое количество голосов'
  end  

  def unsuccessful_petition_user(petition)
    @petition = petition
    @user = petition.user
    mail to: @user.email, subject: 'Петиция не набрала необходимое количество голосов' 
  end

end

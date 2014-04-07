class Betauser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  # devise :token_authenticatable, :database_authenticatable,
  #   :recoverable, :rememberable, :trackable, :omniauthable

  after_create :flash_thank_you

  def flash_thank_you
    # flash[:notice] = "Thanks! We will let you know about major product updates!"
  end

end

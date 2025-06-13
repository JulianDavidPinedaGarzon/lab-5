class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :sent_chats, class_name: "Chat", foreign_key: "sender_id", dependent: :destroy
    has_many :received_chats, class_name: "Chat", foreign_key: "receiver_id", dependent: :destroy
  
    has_many :messages, dependent: :destroy
  
    has_many :received_messages, through: :received_chats, source: :messages
  
    validates :email, presence: true, uniqueness: true
    validates :first_name, presence: true
    validates :last_name, presence: true

    def full_name
    # Adjust based on your User model attributes, e.g., first_name, last_name, or just name
    "#{first_name} #{last_name}".strip # Example for first_name and last_name
    # If you only have a 'name' attribute:
    # name
  end

  end
  
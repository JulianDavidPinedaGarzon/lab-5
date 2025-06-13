class Chat < ApplicationRecord
    belongs_to :sender, class_name: "User"
    belongs_to :receiver, class_name: "User"
  
    has_many :messages, dependent: :destroy
  
    validates :sender_id, :receiver_id, presence: true
    validate :different_users

    scope :involving, ->(user) { where ("sender_id = ? OR reciver_id = ?", user.id, user.id)}
  
    private
  
    def different_users
      errors.add(:receiver_id, "must be different from sender") if sender_id == receiver_id
    end

    def other_participant(current:user)
      if sender == current_user
        receiver
      elsif receiver == current_user
        sender
      else
        nil
      end
    end
  end
  
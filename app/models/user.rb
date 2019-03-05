class User
  include Mongoid::Document
  include MongoidEnumerable
  include Devise::JWT::RevocationStrategies::JTIMatcher
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :validatable, :registerable, :jwt_authenticatable, jwt_revocation_strategy: Devise::JWT::RevocationStrategies::Null

  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""
  field :first_name, type: String, default: ""
  field :last_name, type: String, default: ""
  field :jti, type: String
  field :avatar, type: BSON::Binary

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  enumerable :role, [:customer, :manager, :admin]

  has_many :adverts

  index({ jti: 1 }, { unique: true, name: "jti_index" })

  ## Trackable
  # field :sign_in_count,      type: Integer, default: 0
  # field :current_sign_in_at, type: Time
  # field :last_sign_in_at,    type: Time
  # field :current_sign_in_ip, type: String
  # field :last_sign_in_ip,    type: String

  ## Confirmable
  # field :confirmation_token,   type: String
  # field :confirmed_at,         type: Time
  # field :confirmation_sent_at, type: Time
  # field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time

  def will_save_change_to_email?
    false
  end

  def avatar_decode
    avatar&.data
  end
end

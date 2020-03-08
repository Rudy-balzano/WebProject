class Client < ApplicationRecord

    has_secure_password

    validates :mail, format: {with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/, message: " : Invalid email"}, uniqueness: {case_sensitive: false, message: "Email has already been used"}

    validates :prenom, presence: true

    validates :nom, presence: true

    validates :rue, presence: true

    validates :ville, presence: true

    validates :numero, presence: true

    validates :codePostal, presence: true



end
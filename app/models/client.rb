class Client < ApplicationRecord

    has_secure_password

    #validates :mail, format: {with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/}, uniqueness: {case_sensitive: false}

    validates :prenom, format: {with: /\A[a-zA-Z]+$\z/}

    validates :nom, format: {with: /\A[a-zA-Z]+$\z/}

    validates :rue, format: {with: /\A[a-zA-Z]+$\z/}

    validates :ville, format: {with: /\A[a-zA-Z]+$\z/}

    validates :numero, presence: true

    validates :codePostal, presence: true



end
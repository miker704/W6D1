# == Schema Information
#
# Table name: dogs
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Dog < ApplicationRecord

    validates :name, presence: true
    validate(:check_name_length)

    def check_name_length
        unless self.name.length >=4
            errors[:name]<< "invalid name length 4 chars or more!"
        end
    end

    # def toys
    #     Toy.where({dog_id: self.id})
    # end

    has_many(:toys,{
        primary_key: :id,
        foreign_key: :dog_id,
        class_name: :Toy
    }


    )

end

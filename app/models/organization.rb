# == Schema Information
#
# Table name: organizations
#
#  id                  :bigint           not null, primary key
#  external_data_count :integer          default(0)
#  name                :citext
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class Organization < ApplicationRecord

  has_many :external_data
  
end

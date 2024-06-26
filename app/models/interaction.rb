# == Schema Information
#
# Table name: interactions
#
#  id         :bigint           not null, primary key
#  answer     :text
#  question   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_interactions_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Interaction < ApplicationRecord
  belongs_to :user
end

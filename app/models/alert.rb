# == Schema Information
#
# Table name: alerts
#
#  id               :bigint           not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  external_data_id :bigint           not null
#
# Indexes
#
#  index_alerts_on_external_data_id  (external_data_id)
#
# Foreign Keys
#
#  fk_rails_...  (external_data_id => external_data.id)
#
class Alert < ApplicationRecord

  belongs_to :external_data

end

# == Schema Information
#
# Table name: external_data
#
#  id              :bigint           not null, primary key
#  alerts_count    :integer          default(0)
#  ext_email       :citext           default(""), not null
#  ext_username    :citext
#  main_email      :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint           not null
#  user_id         :bigint           not null
#
# Indexes
#
#  index_external_data_on_ext_email        (ext_email)
#  index_external_data_on_ext_username     (ext_username)
#  index_external_data_on_organization_id  (organization_id)
#  index_external_data_on_user_id          (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (organization_id => organizations.id)
#  fk_rails_...  (user_id => users.id)
#
class ExternalDatum < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :organization, counter_cache: true

  has_many :alerts, dependent: :destroy
end

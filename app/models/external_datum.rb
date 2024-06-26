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

  scope :grouped_by_email, -> { group(:ext_email, :id) }

  validates :ext_email, uniqueness: { scope: :organization_id, message: 'Email must be unique per organization',case_sensitive: false }
  validates :ext_username, uniqueness: { scope: :organization_id, message: 'Username must be unique per organization' }

  def formatted_email
    ext_email.split('@').map(&:capitalize).join('@')
  end
  
end

json.extract! external_datum, :id, :user_id, :ext_username, :ext_email, :organization_id, :main_email, :alerts_count, :created_at, :updated_at
json.url external_datum_url(external_datum, format: :json)

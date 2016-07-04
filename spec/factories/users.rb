# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  roles_mask             :integer
#  first_name             :string
#  last_name              :string
#

FactoryGirl.define do
  factory(:user) do
    current_sign_in_at '2016-06-26T12:43 UTC'
    current_sign_in_ip '127.0.0.1'
    email 'kamasi.washington@gmail.com'
    password 'password'
    password_confirmation 'password'
    last_sign_in_at '2016-06-26T12:43 UTC'
    last_sign_in_ip '127.0.0.1'
    remember_created_at ''
    reset_password_sent_at ''
    reset_password_token ''
    sign_in_count 1
    roles_mask 0
    first_name "Kamasi"
    last_name "Washington"

    factory(:volunteer_center_admin) do
      roles_mask 1
      email "stump@buffalo.com"
      first_name "Stump"
      last_name "Buffalo"
    end

    factory(:user_org_admin) do
      roles_mask 2
      email "breaking_lines@pastels.com"
      first_name "Breaking"
      last_name "Lines"
    end

  end
end

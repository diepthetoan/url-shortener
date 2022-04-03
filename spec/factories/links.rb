FactoryBot.define do
  factory :link do
    user
    original_url { 'https://www.google.com/' }
    clicked_times { 0 }
  end
end
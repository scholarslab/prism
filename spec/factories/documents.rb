# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :document do
    title "Bring the Noise"
    author "Benny Banassi"
    pub_date 2010
    description "Dub step remix of the classic Public Enemy song"
    format "Song"
    content "Bass! How low can you go?\nDeath row. What a brother knows.\nOnce again, back is the incredible\nThe rhyme animal"
  end
end

module PSCFactories
  NAMES = ["Sherwood Giguere", "Lorretta Howe", "Ellan Hammill", "Theresa Ham", "Taylor Vezina", "Sterling Sautter", "Meda Rentz", "Shani Even", "Colin Ratner", "Myrtie Doctor", "Lynna Stjean", "Hiedi Seipel", "Valarie Fury", "Clint Hood", "Paige Mosca", "Gabrielle Millwood", "Annemarie Coombe", "Odell Vanostrand", "Kaye Tomes", "Lacie Ulrich", "Cletus Armes", "Gertrude Villagomez", "Fredda Michener", "Nick Lager", "Liza Burkholder", "Norberto Daffron", "Cammie Keyser", "Shirly Villalon", "Antonietta Irons", "Fleta Edmondson", "Nicolle Alli", "Collette Hagood", "Cornelius Mcreynolds", "Heather Dannenberg", "Julie Simonetti", "Karen Plowman", "Rodger Stoecker", "Edwin Pettway", "Rosita Kinsler", "Marinda Melendy", "Donnie Snellgrove", "Shaquita Kyte", "Latrina Hedley", "Marlana Marlowe", "Kayce Mena", "Ernestina Donofrio", "Janae Noyes", "Marlin Biron", "Teisha Hassett", "Elissa Garmany"]
end
# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  sequence :email do |n| "person#{n}@example.com" end
  sequence :name  do |n| PSCFactories::NAMES[n % PSCFactories::NAMES.size] end
end

FactoryGirl.define do
  factory :admin do
    name     { generate(:name) }
    email    { generate(:email) }
    password 'supersekret'
  end
end

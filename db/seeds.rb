# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Tag.create([
  { name: '500点レベル' },
  { name: '600点レベル' },
  { name: '700点レベル' },
  { name: '800点レベル' },
  { name: '900点レベル' },
  { name: '文法' },
  { name: '単語' },
  { name: 'リスニング' },
  { name: 'ライティング' },
  { name: 'その他' }
])

Check.create([
  { name: "500点レベル" },
  { name: "600点レベル" },
  { name: "700点レベル" },
  { name: "800点レベル" },
  { name: "900点レベル" },
  { name: "文法" },
  { name: "単語" },
  { name: "リスニング" },
  { name: "ライティング" },
  { name: "その他" }
])
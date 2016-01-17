# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     DreadnoughtHangar.Repo.insert!(%DreadnoughtHangar.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias DreadnoughtHangar.{Repo, Ship}
#Corvettes
Repo.insert!(%Ship{id: 1, name: "Defiant", armor: 9001, class: "Corvette", subclass: "Light", icon_uri: "http://dreadnoughthangar.com/images/ships/corvette_light.png"})
Repo.insert!(%Ship{id: 2, name: "Fulgora", armor: 9001, class: "Corvette", subclass: "Medium", icon_uri: "http://dreadnoughthangar.com/images/ships/corvette_medium.png"})
Repo.insert!(%Ship{id: 3, name: "Veles", armor: 9001, class: "Corvette", subclass: "Heavy", icon_uri: "http://dreadnoughthangar.com/images/ships/corvette_heavy.png"})

#Destroyers
Repo.insert!(%Ship{id: 4, name: "Vulcan", armor: 9001, class: "Destroyer", subclass: "Light", icon_uri: "http://dreadnoughthangar.com/images/ships/destroyer_light.png"})
Repo.insert!(%Ship{id: 5, name: "Renegade", armor: 9001, class: "Destroyer", subclass: "Medium", icon_uri: "http://dreadnoughthangar.com/images/ships/destroyer_medium.png"})
Repo.insert!(%Ship{id: 6, name: "Morena", armor: 9001, class: "Destroyer", subclass: "Heavy", icon_uri: "http://dreadnoughthangar.com/images/ships/destroyer_heavy.png"})

#Dreadnoughts
Repo.insert!(%Ship{id: 7, name: "Invictus", armor: 9001, class: "Dreadnought", subclass: "Light", icon_uri: "http://dreadnoughthangar.com/images/ships/dreadnought_light.png"})
Repo.insert!(%Ship{id: 8, name: "Zmey", armor: 9001, class: "Dreadnought", subclass: "Medium", icon_uri: "http://dreadnoughthangar.com/images/ships/dreadnought_medium.png"})
Repo.insert!(%Ship{id: 9, name: "Monarch", armor: 9001, class: "Dreadnought", subclass: "Heavy", icon_uri: "http://dreadnoughthangar.com/images/ships/dreadnought_heavy.png"})

#Tactical Cruisers
Repo.insert!(%Ship{id: 10, name: "Defender", armor: 9001, class: "Tactical Cruiser", subclass: "Light", icon_uri: "http://dreadnoughthangar.com/images/ships/tactical_light.png"})
Repo.insert!(%Ship{id: 11, name: "Aion", armor: 9001, class: "Tactical Cruiser", subclass: "Medium", icon_uri: "http://dreadnoughthangar.com/images/ships/tactical_medium.png"})
Repo.insert!(%Ship{id: 12, name: "Koschei", armor: 9001, class: "Tactical Cruiser", subclass: "Heavy", icon_uri: "http://dreadnoughthangar.com/images/ships/tactical_heavy.png"})

#Artillery Cruiser
Repo.insert!(%Ship{id: 13, name: "Nox", armor: 9001, class: "Artillery Cruiser", subclass: "Light", icon_uri: "http://dreadnoughthangar.com/images/ships/artillery_light.png"})
Repo.insert!(%Ship{id: 14, name: "Svarog", armor: 9001, class: "Artillery Cruiser", subclass: "Medium", icon_uri: "http://dreadnoughthangar.com/images/ships/artillery_medium.png"})
Repo.insert!(%Ship{id: 15, name: "Vigilant", armor: 9001, class: "Artillery Cruiser", subclass: "Heavy", icon_uri: "http://dreadnoughthangar.com/images/ships/artillery_heavy.png"})

local card = {}

---@param e Mob
---@return table<number, number>
function card.Inspect(e)

    local cards = {}

    if e:GetRace() == 195 then -- Zland
        cards[150100] = 100 -- Dragon Card
    end

    if e:GetRace() == 19 then -- Trak
        cards[150100] = 100 -- Dragon Card
    end
    if e:GetRace() == 49 then -- Sev
        cards[150100] = 100 -- Dragon Card
    end
    if e:GetNPCTypeID() == 96073 then -- Fey
        cards[150100] = 100 -- Dragon Card
    end
    if e:GetRace() == 184 then -- aary
        cards[150100] = 100 -- Dragon Card
    end

    if e:GetNPCTypeID() == 96089 then -- Faydedar
        cards[150100] = 100 -- Dragon Card
    end

    if e:GetBodyType() == BT['Insect'] then
        cards[150101] = 100 -- Insect Card
    end
    if e:GetBodyType() == BT['Animal'] then
        cards[150102] = 100 -- Animal Card
    end
    if e:GetRace() == 36 then -- rat
        cards[150102] = 100 -- Animal Card
    end
    if e:GetRace() == 156 then -- wolf
        cards[150102] = 100 -- Animal Card
    end
    if e:GetRace() == 415 then -- spider
        cards[150102] = 100 -- Animal Card
    end
    if e:GetBodyType() == BT['Construct'] then
        cards[150103] = 100 -- Construct Card
    end
    if e:GetBodyType() == BT['Extraplanar'] then
        cards[150104] = 100 -- Extraplanar Card
    end
    if e:GetBodyType() == BT['Giant'] then
        cards[150105] = 100 -- Giant Card
    end
    if e:GetBodyType() == BT['RaidGiant'] then
        cards[150105] = 100 -- Giant Card
    end
    if e:GetBodyType() == BT['Zek'] then
        cards[150105] = 100 -- Giant Card
    end
    if e:GetBodyType() == BT['Humanoid'] then
        cards[150106] = 100 -- Humanoid Card
    end
    if e:GetBodyType() == BT['Lycanthrope'] then
        cards[150107] = 100 -- Lycanthrope Card
    end
    if e:GetBodyType() == BT['Magical'] then
        cards[150108] = 100 -- Magical Card
    end
    if e:GetBodyType() == BT['Monster'] then
        cards[150109] = 100 -- Monster Card
    end
    if e:GetBodyType() == BT['Plant'] then
        cards[150110] = 100 -- Plant Card
    end
    if e:GetRace() == 209 then -- earth elemental (G)
        cards[150111] = 100 -- Summoned Card
    end

    if e:GetRace() == 210 then -- air elemental (G)
        cards[150111] = 100 -- Summoned Card
    end

    if e:GetRace() == 211 then -- water elemental (G)
        cards[150111] = 100 -- Summoned Card
    end

    if e:GetRace() == 212 then -- fire elemental (G)
        cards[150111] = 100 -- Summoned Card
    end

    if e:GetRace() == 475 then -- air elemental (G)
        cards[150111] = 100 -- Summoned Card
    end

    if e:GetRace() == 476 then -- earth elemental (G)
        cards[150111] = 100 -- Summoned Card
    end

    if e:GetRace() == 477 then -- fire elemental (G)
        cards[150111] = 100 -- Summoned Card
    end

    if e:GetRace() == 478 then -- water elemental (G)
        cards[150111] = 100 -- Summoned Card
    end

    if e:GetBodyType() == BT['Summoned'] then
        cards[150111] = 100 -- Summoned Card
    end
    if e:GetBodyType() == BT['Summoned2'] then
        cards[150111] = 100 -- Summoned Card
    end
    if e:GetBodyType() == BT['Summoned3'] then
        cards[150111] = 100 -- Summoned Card
    end
    if e:GetBodyType() == BT['SummonedUndead'] then
        cards[150111] = 100 -- Summoned Card
    end
    if e:GetBodyType() == BT['Undead'] then
        cards[150112] = 100 -- Undead Card
    end
    if e:GetBodyType() == BT['SummonedUndead'] then
        cards[150112] = 100 -- Undead Card
    end
    if e:GetBodyType() == BT['Vampire'] then
        cards[150112] = 100 -- Undead Card
    end
    if e:GetRace() == 85 then -- Spectre (G)
        cards[150112] = 100 -- Undead Card
    end
    if e:GetRace() == 174 then -- Ice Spectre
        cards[150112] = 100 -- Undead Card
    end
    if e:GetRace() == 485 then -- Spectre
        cards[150112] = 100 -- Undead Card
    end
    if e:GetRace() == 39 then -- Gnoll
        cards[150113] = 100 -- Gnoll Card
    end
    if e:GetRace() == 13 then -- Aviak
        cards[150114] = 100 -- Aviak Card
    end
    if e:GetRace() == 14 then -- Werewolf
        cards[150115] = 100 -- Werewolf Card
    end
    if e:GetRace() == 48 then -- Kobold
        cards[150116] = 100 -- Kobold Card
    end

    if e:GetRace() == 54 then -- Orc
        cards[150117] = 100 -- Orc Card
    end

    if e:GetRace() == 28 then -- Fungus
        cards[150118] = 100 -- Fungus Card
    end

    if e:GetRace() == 40 then -- Goblin
        cards[150119] = 100 -- Goblin Card
    end
    if e:GetRace() == 433 then -- Goblin
        cards[150119] = 100 -- Goblin Card
    end
    if e:GetRace() == 137 then -- Goblin
        cards[150119] = 100 -- Goblin Card
    end

    if e:GetRace() == 21 then -- Evil Eye
        cards[150120] = 100 -- Evil Eye Card
    end

    if e:GetRace() == 1 then -- Human
        cards[150121] = 100 -- Human Card
    end
    if e:GetRace() == 44 then -- Freeport Guard
        cards[150121] = 100 -- Human Card
    end
    if e:GetRace() == 71 then -- InnKeeper
        cards[150121] = 100 -- Human Card
    end

    if e:GetRace() == 2 then -- Barbarian
        cards[150122] = 100 -- Barbarian Card
    end

    if e:GetRace() == 3 then -- Erudite
        cards[150123] = 100 -- Erudite Card
    end

    if e:GetRace() == 4 then -- Wood Elf
        cards[150124] = 100 -- Wood Elf Card
    end

    if e:GetRace() == 5 then -- High Elf
        cards[150125] = 100 -- High Elf Card
    end

    if e:GetRace() == 6 then -- Dark Elf
        cards[150126] = 100 -- Dark Elf Card
    end

    if e:GetRace() == 7 then -- Half Elf
        cards[150127] = 100 -- Half Elf Card
    end

    if e:GetRace() == 8 then -- Dwarf
        cards[150128] = 100 -- Dwarf Card
    end

    if e:GetRace() == 9 then -- Troll
        cards[150129] = 100 -- Troll Card
    end

    if e:GetRace() == 10 then -- Ogre
        cards[150130] = 100 -- Ogre Card
    end

    if e:GetRace() == 11 then -- Halfling
        cards[150131] = 100 -- Halfling Card
    end

    if e:GetRace() == 12 then -- Gnome
        cards[150132] = 100 -- Gnome Card
    end

    if e:GetRace() == 26 then -- Old Model Froglok
        cards[150133] = 100 -- Froglok Card
    end

    if e:GetRace() == 27 then -- Old Model Undead Froglok
        cards[150133] = 100 -- Froglok Card
    end

    if e:GetRace() == 127 then -- Invisible Man
        cards[150134] = 100 -- Dervish Card
    end

    if e:GetRace() == 170 then -- Snow Dervish
        cards[150134] = 100 -- Dervish Card
    end

    if e:GetRace() == 372 then -- Dervish
        cards[150134] = 100 -- Dervish Card
    end

    if e:GetRace() == 431 then -- Rock Dervish
        cards[150134] = 100 -- Dervish Card
    end

    if e:GetRace() == 660 then -- Book Dervish
        cards[150134] = 100 -- Dervish Card
    end

    if e:GetRace() == 38 then -- Spider
        cards[150135] = 100 -- Spider Card
    end

    if e:GetRace() == 440 then -- NewSpider
        cards[150135] = 100 -- Spider Card
    end

    if e:GetRace() == 450 then -- Lavaspinner
        cards[150135] = 100 -- Spider Card
    end

    if e:GetRace() == 451 then -- LavaSpider Queen
        cards[150135] = 100 -- Spider Card
    end

    if e:GetRace() == 452 then -- LavaSpider Egg
        cards[150135] = 100 -- Spider Card
    end

    if e:GetRace() == 22 then -- Beetle
        cards[150136] = 100 -- Beetle Card
    end

    if e:GetRace() == 37 then -- Snake
        cards[150137] = 100 -- Snake Card
    end

    if e:GetRace() == 42 then -- Wolf
        cards[150138] = 100 -- Wolf Card
    end

    if e:GetRace() == 43 then -- Bear
        cards[150139] = 100 -- Bear Card
    end

    if e:GetRace() == 33 then -- Ghoul
        cards[150140] = 100 -- Ghoul Card
    end

    if e:GetRace() == 33 then -- Zombie
        cards[150141] = 100 -- Zombie Card
    end

    if e:GetRace() == 161 then -- Skeleton
        cards[150142] = 100 -- Skeleton Card
    end

    if e:GetRace() == 367 then -- Skeleton
        cards[150142] = 100 -- Skeleton Card
    end

    if e:GetRace() == 154 and e:GetName():findi("chroma") then -- Chromadrac
        cards[150143] = 100 -- Chromadrac Card
    end

    if e:GetName():findi("Dozekar") then -- Dozekar
        cards[150144] = 1 -- Dozekar the Cursed Card
    end

    if e:GetBodyType() == 26 then -- Drake
        cards[150145] = 100 -- Drake Card
    end

    return cards
end


return card;
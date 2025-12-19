-- Utils/Database.lua - Base de données des items de housing et types de bois
local _, addonTable = ...

addonTable.Database = {}

-- Types de bois disponibles (Mapping 1 Bois = 1 Extension)
addonTable.Database.WoodTypes = {
    { key = "DORNIC", localeKey = "BOIS_DORNIC" },
    { key = "DRAGONPINE", localeKey = "BOIS_DRAGONPINE" },
    { key = "ARDEN", localeKey = "BOIS_ARDEN" },
    { key = "DARKPINE", localeKey = "BOIS_DARKPINE" },
    { key = "FELTOUCHED", localeKey = "BOIS_FELTOUCHED" },
    { key = "SHADOWMOON", localeKey = "BOIS_SHADOWMOON" },
    { key = "BAMBOO", localeKey = "BOIS_BAMBOO" },
    { key = "ASHWOOD", localeKey = "BOIS_ASHWOOD" },
    { key = "COLDWIND", localeKey = "BOIS_COLDWIND" },
    { key = "OLEMBA", localeKey = "BOIS_OLEMBA" },
    { key = "IRONWOOD", localeKey = "BOIS_IRONWOOD" },
}

-- Base de données structurée par Type de Bois (Extension)
addonTable.Database.Items = {

    ["DORNIC"] = { -- The War Within
        { itemID = 252755, category = "Accents", subCategory = "Floor", labels = "Terrestre", name = "Tapis encadré de Dornogal", profession = "Couture" },
        { itemID = 253022, category = "Accents", subCategory = "Ornamental", labels = "Terrestre", name = "Bibliothèque de Dornogal", profession = "Calligraphie" },
        { itemID = 253039, category = "Lighting", subCategory = "Large", labels = "Terrestre", name = "Bougeoir suspendu de Dornogal", profession = "Enchantement" },
        { itemID = 253164, category = "Structural", subCategory = "Misc", labels = "Terrestre", name = "Clôture algarie", profession = "Calligraphie" },
        { itemID = 253165, category = "Structural", subCategory = "Misc", labels = "Terrestre", name = "Piquet algari", profession = "Calligraphie" },
        { itemID = 253167, category = "Furnishings", subCategory = "Storage", labels = "Terrestre", name = "Bacs du marché de la Placeforge", profession = "Calligraphie" },
        { itemID = 253169, category = "Furnishings", subCategory = "Storage", labels = "Terrestre", name = "Coffre de stockage de l'hydromellerie", profession = "Calligraphie" },
        { itemID = 252758, category = "Furnishings", subCategory = "Bath", labels = "", name = "Bain de Sourceroc", profession = "Alchimie" },
        { itemID = 253036, category = "Furnishings", subCategory = "Table", labels = "", name = "Table de Landefrey", profession = "Calligraphie" },
        { itemID = 253253, category = "Lighting", subCategory = "Large Lights", labels = "Terrestre", name = "Candélabre de Gundargaz", profession = "Joaillerie" },
        -- Lot 5 Additions
        { itemID = 246066, category = "Lighting", subCategory = "Small Lights", labels = "Horde", name = "Guirlande lumineuse gobeline chic", profession = "Ingénierie" },
        { itemID = 245559, category = "Structural", subCategory = "Windows", labels = "", name = "Fenêtre ocre octogonale", profession = "Calligraphie" },
        { itemID = 253171, category = "Accents", subCategory = "Wall", labels = "Terrestre", name = "Réplique de nacelle de stase", profession = "Enchantement" },
        { itemID = 253252, category = "Accents", subCategory = "Ornamental", labels = "Terrestre", name = "Réplique de nacelle de foreuse", profession = "Ingénierie" },
        { itemID = 245312, category = "Furnishings", subCategory = "Seating", labels = "Horde", name = "Banc boulonné oxydé", profession = "Forge" },
        { itemID = 257102, category = "Accents", subCategory = "Ornamental", labels = "Nérubien", name = "Cornue d'alchimiste nérubienne", profession = "Alchimie" },
        -- Manual Additions
        { itemID = 245305, category = "Furnishings", subCategory = "Seating", labels = "Terrestre", name = "Pouf de Terremine", profession = "Couture" },
        { itemID = 245323, category = "Furnishings", subCategory = "Storage", labels = "Terrestre", name = "Coffre de stockage à roue dentée", profession = "Forge" },
        { itemID = 245324, category = "Structural", subCategory = "Fences", labels = "Terrestre", name = "Clôture algarie", profession = "Forge" },
        { itemID = 243327, category = "Accents", subCategory = "Floor", labels = "Peluche", name = "Tapis à zhévrures", profession = "Travail du cuir" },
    },

    ["DRAGONPINE"] = { -- Dragonflight
        { itemID = 264679, category = "Furnishings", subCategory = "Storage", labels = "Draconique", name = "Étagère murale de Valdrakken", profession = "Calligraphie" },
        { itemID = 248111, category = "Accents", subCategory = "Ornamental", labels = "Draconique", name = "Vase verdoyant de Valdrakken", profession = "Alchimie" },
        { itemID = 248113, category = "Accents", subCategory = "Ornamental", labels = "Draconique", name = "Télescope de Thaldraszus", profession = "Ingénierie" },
        { itemID = 248654, category = "Furnishings", subCategory = "Seating", labels = "Draconique", name = "Trône doré de Valdrakken", profession = "Joaillerie" },
        { itemID = 248110, category = "Structural", subCategory = "Fences", labels = "Draconique", name = "Piquet de Valdrakken", profession = "Joaillerie" },
        { itemID = 248106, category = "Furnishings", subCategory = "Storage", labels = "Draconique", name = "Tonneau ficelé de Valdrakken", profession = "Calligraphie" },
        { itemID = 248108, category = "Furnishings", subCategory = "Storage", labels = "Draconique", name = "Longue caisse de stockage de Valdrakken", profession = "Calligraphie" },
        { itemID = 248107, category = "Furnishings", subCategory = "Storage", labels = "Draconique", name = "Caisse de stockage de Valdrakken", profession = "Calligraphie" },
        { itemID = 248109, category = "Structural", subCategory = "Fences", labels = "Draconique", name = "Clôture de Valdrakken", profession = "Joaillerie" },
        { itemID = 248657, category = "Structural", subCategory = "Large Structures", labels = "Draconique", name = "Tonnelle pliante de Valdrakken", profession = "Travail du cuir" },
        { itemID = 248121, category = "Accents", subCategory = "Floor", labels = "Draconique", name = "Tapis circulaire draconique", profession = "Couture" },
        { itemID = 248114, category = "Furnishings", subCategory = "Bed", labels = "Draconique", name = "Lit gigogne draconique", profession = "Travail du cuir" },
        { itemID = 256430, category = "Furnishings", subCategory = "Misc", labels = "Draconique", name = "Chaudron suspendu de Valdrakken", profession = "Forge" },
        { itemID = 256170, category = "Accents", subCategory = "Misc", labels = "Draconique", name = "Bassin de scribe draconique", profession = "Enchantement" },
        { itemID = 257053, category = "Accents", subCategory = "Wall", labels = "Draconique", name = "Tapisserie des cinq Vols", profession = "Couture" },
        { itemID = 256171, category = "Accents", subCategory = "Ornamental", labels = "Draconique", name = "Grimoire des cinq Vols", profession = "Enchantement" },
        { itemID = 239214, category = "Furnishings", subCategory = "Seating", labels = "Draconique", name = "Canapé éclairé de l'Incontinental", profession = "Travail du cuir" },
        { itemID = 257052, category = "Accents", subCategory = "Kitchen", labels = "Draconique", name = "Bouteille d'élixir de dragon", profession = "Alchimie" },
        { itemID = 256427, category = "Lighting", subCategory = "Brazier", labels = "Draconique", name = "Brasero de signal de Trêve-Ailée", profession = "Forge" },
        { itemID = 248119, category = "Accents", subCategory = "Ornamental", labels = "Draconique", name = "Littérature du Vol draconique vert", profession = "Calligraphie" },
        { itemID = 248120, category = "Accents", subCategory = "Ornamental", labels = "Draconique", name = "Littérature du Vol draconique rouge", profession = "Calligraphie" },
        { itemID = 248118, category = "Accents", subCategory = "Ornamental", labels = "Draconique", name = "Littérature du Vol draconique bleu", profession = "Calligraphie" },
        { itemID = 258253, category = "Structural", subCategory = "Large Structures", labels = "Draconique, Titan", name = "Fontaine titanesque du bassin de Tyr", profession = "Ingénierie" },
    },

    ["SHADOWMOON"] = { -- WoD (Draenei/Orc)
        { itemID = 245441, category = "Structural", subCategory = "Fences", labels = "Horde", name = "Piquet orc", profession = "Calligraphie" },
        { itemID = 244313, category = "Structural", subCategory = "Fences", labels = "Horde", name = "Clôture orque", profession = "Calligraphie" },
        { itemID = 244317, category = "Furnishings", subCategory = "Storage", labels = "Horde", name = "Tonneau ficelé orc", profession = "Calligraphie" },
        { itemID = 244318, category = "Furnishings", subCategory = "Storage", labels = "Horde", name = "Tonneau de vin", profession = "Alchimie" },
        { itemID = 244323, category = "Furnishings", subCategory = "Bed", labels = "Horde", name = "Lit de camp orc", profession = "Travail du cuir" },
        { itemID = 257044, category = "Furnishings", subCategory = "Misc", labels = "Horde", name = "Chaudron orc grangresang", profession = "Alchimie" },
        { itemID = 244319, category = "Furnishings", subCategory = "Storage", labels = "", name = "Caisse de transport en bois", profession = "Calligraphie" },
        { itemID = 245600, category = "Furnishings", subCategory = "Production", labels = "Horde", name = "Forge de Mur-de-Givre", profession = "Forge" },
        { itemID = 245534, category = "Lighting", subCategory = "Brazier", labels = "Horde", name = "Brasero élevé de Mur-de-Givre", profession = "Calligraphie" },
        { itemID = 244314, category = "Furnishings", subCategory = "Table", labels = "Horde", name = "Table d'architecte de Mur-de-Givre", profession = "Ingénierie" },
        { itemID = 245432, category = "Furnishings", subCategory = "Bed", labels = "Horde", name = "Lits superposés rochenoires", profession = "Travail du cuir" },
        { itemID = 245436, category = "Furnishings", subCategory = "Storage", labels = "Horde", name = "Râtelier d'armes rochenoires", profession = "Forge" },
        { itemID = 245601, category = "Lighting", subCategory = "Large Lights", labels = "Horde", name = "Brasero de signal ancestral", profession = "Enchantement" },
        { itemID = 245421, category = "Furnishings", subCategory = "Bed", labels = "Alliance", name = "Lit de Karabor", profession = "Couture" },
        { itemID = 251655, category = "Lighting", subCategory = "Small Lights", labels = "Alliance", name = "Guirlande lumineuse en draenéthyste", profession = "Enchantement" },
        { itemID = 251550, category = "Lighting", subCategory = "Small Lights", labels = "Alliance", name = "Bougeoir en draenéthyste", profession = "Joaillerie" },
        { itemID = 251495, category = "Accents", subCategory = "Wall", labels = "Alliance", name = "Bassin draenique", profession = "Joaillerie" },
        { itemID = 251482, category = "Accents", subCategory = "Ornamental", labels = "Alliance", name = "Télescope d'astronome draeneï", profession = "Ingénierie" },
        { itemID = 258303, category = "Toys", subCategory = "Plushie", labels = "Peluche", name = "Elekk en peluche adorable", profession = "Couture" },
        { itemID = 251546, category = "Decoration", subCategory = "Rug", labels = "Alliance", name = "Tapis circulaire argusséen", profession = "Couture" },
    },

    ["ARDEN"] = { -- Shadowlands
        { itemID = 258245, category = "Accents", subCategory = "Outdoor", labels = "Sylvarden", name = "Paniers suspendus de Sylvarden", profession = "Calligraphie" },
        { itemID = 258247, category = "Furnishings", subCategory = "Storage", labels = "Revendreth", name = "Grande caisse de stockage de Revendreth", profession = "Calligraphie" },
        { itemID = 257049, category = "Accents", subCategory = "Food and Drink", labels = "Revendreth", name = "Calice venthyr orné de joyaux", profession = "Forge" },
        { itemID = 258240, category = "Furnishings", subCategory = "Storage", labels = "Bastion", name = "Tonneau d'anima kyrian", profession = "Ingénierie" },
        { itemID = 258561, category = "Accents", subCategory = "Ornamental", labels = "Bastion", name = "Coussin roulé d'aspirant kyrian", profession = "Couture" },
        { itemID = 257048, category = "Miscellaneous", subCategory = "All", labels = "Bastion", name = "Bassin de méditation d'aspirant", profession = "Forge" },
        -- Ardenweald
        { itemID = 258237, category = "Lighting", subCategory = "Street Lights", labels = "Sylvarden", name = "Réverbère de Sylvarden", profession = "Enchantement" },
        { itemID = 258242, category = "Structural", subCategory = "Misc", labels = "Sylvarden", name = "Sanctuaire des Faë du creux de la Nuitée", profession = "Calligraphie" },
        { itemID = 257050, category = "Accents", subCategory = "Ornamental", labels = "Sylvarden", name = "Gland d'anima protégé par le voile", profession = "Alchimie" },
        { itemID = 264713, category = "Accents", subCategory = "Wall", labels = "Sylvarden", name = "Bannière du cœur de la Forêt", profession = "Couture" },
        -- Revendreth/Venthyr
        { itemID = 257098, category = "Accents", subCategory = "Food and Drink", labels = "Revendreth", name = "Bouteille d'anima venthyr", profession = "Enchantement" },
        -- Manual Additions
        { itemID = 265500, category = "Accents", subCategory = "Ornamental", labels = "Revendreth", name = "Calice venthyr orné de joyaux", profession = "Joaillerie" },
        { itemID = 257051, category = "Lighting", subCategory = "Candle", labels = "Revendreth", name = "Bougies en malsuif", profession = "Alchimie" },
        -- Bastion/Kyrian Additional
        { itemID = 264678, category = "Accents", subCategory = "Wall", labels = "Bastion", name = "Bannière à anneaux de l'aspirant", profession = "Couture" },
        { itemID = 258235, category = "Furnishings", subCategory = "Seating", labels = "Bastion", name = "Siège d'âme aspirante", profession = "Calligraphie" },
        -- Manual Additions
        { itemID = 265505, category = "Structural", subCategory = "Misc", labels = "Bastion", name = "Bassin de méditation d'aspirant", profession = "Enchantement" },
        { itemID = 262663, category = "Lighting", subCategory = "Lamp", labels = "Bastion", name = "Lampe flottante kyriane", profession = "Joaillerie" },
        -- Maldraxxus
        { itemID = 258239, category = "Accents", subCategory = "Ornamental", labels = "Maldraxxus", name = "Tome de rituels maldraxxi", profession = "Calligraphie" },
        { itemID = 258248, category = "Accents", subCategory = "Floor", labels = "Maldraxxus", name = "Tapis de margrave raccommodé en cuir", profession = "Travail du cuir" },
        { itemID = 258238, category = "Furnishings", subCategory = "Storage", labels = "Maldraxxus", name = "Caisse maldraxxi", profession = "Travail du cuir" },
        { itemID = 260699, category = "Accents", subCategory = "Ornamental", labels = "Maldraxxus", name = "Tablette runique maldraxxi", profession = "Joaillerie" },
        -- Cartel
        { itemID = 258252, category = "Furnishings", subCategory = "Storage", labels = "Cartel", name = "Caisse de capture du cartel Xy", profession = "Ingénierie" },
        { itemID = 258250, category = "Furnishings", subCategory = "Storage", labels = "Cartel", name = "Bibliothèque du cartel Ta", profession = "Calligraphie" },
        { itemID = 258244, category = "Furnishings", subCategory = "Table", labels = "Cartel", name = "Table de maléfices des négociants", profession = "Calligraphie" },
    },

    ["DARKPINE"] = { -- BFA
        { itemID = 252401, category = "Furnishings", subCategory = "Storage", labels = "Alliance", name = "Étagère de livres de Boralus", profession = "Calligraphie" },
        { itemID = 252035, category = "Furnishings", subCategory = "Storage", labels = "Alliance", name = "Tonneau de Boralus", profession = "Calligraphie" },
        { itemID = 252389, category = "Furnishings", subCategory = "Storage", labels = "Alliance", name = "Caisse de transport des Portvaillant", profession = "Calligraphie" },
        { itemID = 252397, category = "Furnishings", subCategory = "Misc", labels = "Alliance", name = "Broyeur de Brennadam", profession = "Forge" },
        { itemID = 252399, category = "Structural", subCategory = "Misc", labels = "Alliance", name = "Fourneau chantorage", profession = "Forge" },
        { itemID = 257046, category = "Lighting", subCategory = "Small Lights", labels = "Alliance", name = "Lampe bouteille de Boralus", profession = "Alchimie" },
        { itemID = 245416, category = "Structural", subCategory = "Fences", labels = "Horde", name = "Piquet de Zuldazar", profession = "Calligraphie" },
        { itemID = 245415, category = "Structural", subCategory = "Fences", labels = "Horde", name = "Clôture de Zuldazar", profession = "Calligraphie" },
        { itemID = 245418, category = "Accents", subCategory = "Wall", labels = "Horde", name = "Tapisserie zanchuli", profession = "Couture" },
        { itemID = 245412, category = "Accents", subCategory = "Ornamental", labels = "Horde", name = "Tambour rituel zandalari", profession = "Travail du cuir" },
        { itemID = 245414, category = "Lighting", subCategory = "Wall Light", labels = "Horde", name = "Lampe-crâne embrasée zandalari", profession = "Joaillerie" },
        -- Manual Additions
        { itemID = 265507, category = "Accents", subCategory = "Wall", labels = "Horde", name = "Bannière de diplomate furie-des-sables", profession = "Travail du cuir" },
        { itemID = 245499, category = "Furnishings", subCategory = "Table", labels = "Horde", name = "Table zandalari dorée", profession = "Calligraphie" },
        { itemID = 258560, category = "Accents", subCategory = "Ornamental", labels = "Sylvarden", name = "Bâtonnet d'enchantement drust", profession = "Enchantement" },
        { itemID = 257047, category = "Accents", subCategory = "Misc", labels = "Horde", name = "Cargaison de bouteilles zandalari", profession = "Alchimie" },
        { itemID = 245496, category = "Accents", subCategory = "Wall", labels = "Horde", name = "Petit masque de Bwonsamdi", profession = "Joaillerie" },
        { itemID = 246500, category = "Lighting", subCategory = "Misc", labels = "Alliance", name = "Soleil artificiel miniature de Mécagone", profession = "Ingénierie" },
        { itemID = 246486, category = "Structural", subCategory = "Misc", labels = "Alliance", name = "Méga-bobine Tesla gnome", profession = "Ingénierie" },
        { itemID = 243101, category = "Toys", subCategory = "Rug", labels = "Horde", name = "Tapis de Dazar'alor rouge", profession = "Couture" },
        { itemID = 999003, category = "Structural", subCategory = "Large Structures", labels = "Alliance", name = "Recalibrateur atomique désactivé", profession = "Ingénierie" },
        { itemID = 258559, category = "Accents", subCategory = "Ornamental", labels = "Horde", name = "Totem d'eaugure", profession = "Enchantement" },
    },

    ["FELTOUCHED"] = { -- Legion
        { itemID = 256680, category = "Structural", subCategory = "Large Structures", labels = "Horde", name = "Fontaine sculptée de l'arcan'dor", profession = "Alchimie" },
        { itemID = 256681, category = "Structural", subCategory = "Large Structures", labels = "Horde", name = "Fontaine de la Nocteflèche", profession = "Enchantement" },
        { itemID = 247916, category = "Furnishings", subCategory = "Table", labels = "Horde", name = "Table de Suramar carrée couverte", profession = "Calligraphie" },
        { itemID = 247918, category = "Furnishings", subCategory = "Table", labels = "Horde", name = "Table de joaillerie sacrenuit", profession = "Calligraphie" },
        { itemID = 247920, category = "Accents", subCategory = "Floor", labels = "Horde", name = "Tapis shal'dorei circulaire", profession = "Couture" },
        { itemID = 247922, category = "Structural", subCategory = "Misc", labels = "Horde", name = "Clôture de Suramar", profession = "Forge" },
        { itemID = 247909, category = "Structural", subCategory = "Fences", labels = "Horde", name = "Piquet de Suramar", profession = "Forge" },
        { itemID = 247923, category = "Structural", subCategory = "Misc", labels = "Horde", name = "Cellule de confinement de Suramar", profession = "Enchantement" },
        { itemID = 247925, category = "Furnishings", subCategory = "Storage", labels = "Horde", name = "Caisse de stockage de Suramar", profession = "Calligraphie" },
        { itemID = 248010, category = "Toys", subCategory = "Tent", labels = "Horde", name = "Tente de plein air shal'dorei", profession = "Couture" },
        { itemID = 258227, category = "Accents", subCategory = "Ornamental", labels = "Horde", name = "Assortiment de joaillerie de Suramar", profession = "Joaillerie" },
        { itemID = 245396, category = "Furnishings", subCategory = "Storage", labels = "Horde", name = "Penderie de Suramar", profession = "Calligraphie" },
        { itemID = 245557, category = "Structural", subCategory = "Windows", labels = "Horde", name = "Fenêtre de Suramar ombragée", profession = "Joaillerie" },
        { itemID = 258226, category = "Accents", subCategory = "Ornamental", labels = "Dalaran", name = "Auto-marteau de Dalaran", profession = "Ingénierie" },
        { itemID = 258225, category = "Accents", subCategory = "Ornamental", labels = "", name = "Pylône de détection des échecs défectueux", profession = "Ingénierie" },
        { itemID = 258224, category = "Furnishings", subCategory = "Storage", labels = "", name = "Présentoir de Dalaran", profession = "Calligraphie" },
        { itemID = 258557, category = "Toys", subCategory = "Plushie", labels = "Peluche", name = "Raptor en peluche adorable", profession = "Couture" },
        { itemID = 257045, category = "Structural", subCategory = "Misc", labels = "", name = "Bassin de clairvoyance étoilé", profession = "Alchimie" },
        { itemID = 257400, category = "Miscellaneous", subCategory = "Professions", labels = "Horde", name = "Cadre de tannerie de Haut-Roc", profession = "Travail du cuir" },
        { itemID = 245406, category = "Structural", subCategory = "Fences", labels = "Horde", name = "Clôture taurène en cuir", profession = "Travail du cuir" },
        { itemID = 245408, category = "Accents", subCategory = "Food and Drink", labels = "Horde", name = "Marmite de soupe taurène", profession = "Forge" },
        { itemID = 245459, category = "Furnishings", subCategory = "Storage", labels = "Horde", name = "Coffre de stockage tauren", profession = "Calligraphie" },
        { itemID = 245407, category = "Structural", subCategory = "Fences", labels = "Horde", name = "Piquet tauren", profession = "Travail du cuir" },
    },

    ["ASHWOOD"] = { -- Cataclysm/Classic
        { itemID = 264677, category = "Accents", subCategory = "Floor", labels = "", name = "Tapis scarabée roulé", profession = "Travail du cuir" },
        { itemID = 258245, category = "Accents", subCategory = "Outdoor", labels = "Sylvarden", name = "Paniers suspendus de Sylvarden", profession = "Travail du cuir" },
        -- Lot 4 Additions (Gilneas / Cataclysm)
        { itemID = 245622, category = "Decoration", subCategory = "Wall", labels = "Alliance", name = "Étagère murale gilnéenne", profession = "Calligraphie" },
        { itemID = 245621, category = "Furnishings", subCategory = "Table", labels = "Alliance", name = "Table gilnéenne en bois", profession = "Calligraphie" },
        { itemID = 245623, category = "Furnishings", subCategory = "Seating", labels = "Alliance", name = "Fauteuil à bascule gilnéen", profession = "Calligraphie" },
        { itemID = 245517, category = "Accents", subCategory = "Food and Drink", labels = "Alliance", name = "Chaudron gilnéen", profession = "Alchimie" },
        { itemID = 257689, category = "Structural", subCategory = "Large Structures", labels = "Alliance", name = "Petit moulin à vent gilnéen", profession = "Ingénierie" },
        { itemID = 257694, category = "Decoration", subCategory = "Alchemy", labels = "Alliance", name = "Potion verte gilnéenne", profession = "Alchimie" },
        { itemID = 257695, category = "Miscellaneous", subCategory = "All", labels = "Alliance", name = "Boîte aux lettres gilnéenne", profession = "Calligraphie" },
        { itemID = 264712, category = "Miscellaneous", subCategory = "All", labels = "Alliance", name = "Selle de rechange gilnéenne", profession = "Travail du cuir" },
        { itemID = 257042, category = "Miscellaneous", subCategory = "All", labels = "Alliance", name = "Fourche gilnéenne", profession = "Forge" },
        { itemID = 245602, category = "Accents", subCategory = "Ornamental", labels = "Alliance", name = "Solutionneur gilnéen", profession = "Ingénierie" },
        { itemID = 245618, category = "Structural", subCategory = "Large Structures", labels = "Alliance", name = "Tente d'exploration de Surwich", profession = "Couture" },
        { itemID = 257095, category = "Accents", subCategory = "Ornamental", labels = "", name = "Réservoir de feu du Crépuscule", profession = "Enchantement" },
        { itemID = 257806, category = "Accents", subCategory = "Floor", labels = "", name = "Mosaïque du Crépuscule en écailles", profession = "Travail du cuir" },
        { itemID = 257404, category = "Decoration", subCategory = "Bottle", labels = "", name = "Bouteille en verre de Bois-du-Bûcher", profession = "Enchantement" },
        { itemID = 257696, category = "Decoration", subCategory = "Wall", labels = "Alliance", name = "Carte gilnéenne", profession = "Calligraphie" },
        { itemID = 257402, category = "Accents", subCategory = "Wall", labels = "Revendreth", name = "Tapisserie « Unité des épines »", profession = "Couture" },
        { itemID = 265503, category = "Decoration", subCategory = "Misc", labels = "Alliance", name = "Boîte aux lettres gilnéenne", profession = "Ingénierie" },
        { itemID = 249143, category = "Lighting", subCategory = "Candle", labels = "Revendreth", name = "Bougeoir à fumée", profession = "Joaillerie" },
        { itemID = 257406, category = "Lighting", subCategory = "Lamp", labels = "Revendreth", name = "Lampe à fumée", profession = "Joaillerie" },
        { itemID = 257409, category = "Lighting", subCategory = "Stand", labels = "Revendreth", name = "Lampe à fumée sur pied", profession = "Forge" },
    },


    ["COLDWIND"] = { -- WotLK
        -- Lot 2 Additions
        { itemID = 257693, category = "Miscellaneous", subCategory = "All", labels = "", name = "Épouvantotem de la tribu Tombeneige", profession = "Travail du cuir" },
        { itemID = 258212, category = "Accents", subCategory = "Ornamental", labels = "Horde", name = "Orbe de sang san'layn", profession = "Alchimie" },
        -- Lot 4 Additions (Dalaran WotLK)
        { itemID = 258209, category = "Furnishings", subCategory = "Storage", labels = "Dalaran", name = "Caisse du Kirin Tor", profession = "Calligraphie" },
        { itemID = 258210, category = "Decoration", subCategory = "Sign", labels = "Dalaran", name = "Plaque de rue de Dalaran", profession = "Calligraphie" },
        { itemID = 258211, category = "Furnishings", subCategory = "Table", labels = "Dalaran", name = "Table en verre du Kirin Tor", profession = "Joaillerie" },
        { itemID = 264676, category = "Structural", subCategory = "Doors", labels = "Dalaran", name = "Porte des égouts de Dalaran", profession = "Forge" },
        { itemID = 258204, category = "Miscellaneous", subCategory = "All", labels = "Dalaran", name = "Poteau de Dalaran", profession = "Calligraphie" },
        { itemID = 258203, category = "Furnishings", subCategory = "Seating", labels = "Dalaran", name = "Banc en argent de Dalaran", profession = "Calligraphie" },
        { itemID = 258206, category = "Accents", subCategory = "Wall Hangings", labels = "Dalaran", name = "Bannière dorée de Dalaran", profession = "Couture" },
        { itemID = 258298, category = "Accents", subCategory = "Wall Hangings", labels = "Dalaran", name = "Bannière de la silhouette du Kirin Tor", profession = "Couture" },
        { itemID = 264710, category = "Decoration", subCategory = "Lighting", labels = "Dalaran", name = "Bougeoir solaire de Dalaran", profession = "Forge" },
        { itemID = 258207, category = "Furnishings", subCategory = "Storage", labels = "Dalaran", name = "Bibliothèque d'érudition de Dalaran", profession = "Calligraphie" },
        { itemID = 257094, category = "Lighting", subCategory = "Small Lights", labels = "Dalaran", name = "Marque de l'œil des mages", profession = "Enchantement" },
        { itemID = 258208, category = "Lighting", subCategory = "Small Lights", labels = "Dalaran", name = "Chandelier solaire du Kirin Tor", profession = "Joaillerie" },
        -- Lot 5 Additions (WotLK Engineering / Misc)
        { itemID = 264707, category = "Accents", subCategory = "Ornamental", labels = "", name = "Engrenage multifonction redimensionnable", profession = "Ingénierie" },
        { itemID = 264708, category = "Accents", subCategory = "Wall", labels = "", name = "Gadget de défense de domicile", profession = "Ingénierie" },
        { itemID = 257101, category = "Accents", subCategory = "Ornamental", labels = "Dalaran", name = "Portail postal de Siffletimbre", profession = "Enchantement" },
        { itemID = 258213, category = "Decoration", subCategory = "Alchemy", labels = "", name = "Peste en boîte de la Couronne de glace", profession = "Alchimie" },
        -- Manual Additions
        { itemID = 258205, category = "Furnishings", subCategory = "Storage", labels = "", name = "Sac postal varleu", profession = "Travail du cuir" },
        { itemID = 257040, category = "Furnishings", subCategory = "Production", labels = "Dalaran", name = "Enclume runique de Dalaran", profession = "Forge" },
        { itemID = 264711, category = "Accents", subCategory = "Ornamental", labels = "", name = "Mur de trains joyeux de Mizanjoie", profession = "Ingénierie" },
    },

    ["BAMBOO"] = { -- Pandaria
        { itemID = 247736, category = "Structural", subCategory = "Large Structures", labels = "Pandaren", name = "Fontaine draconique du temple de Jade", profession = "Joaillerie" },
        -- Moved from DRAGONPINE
        { itemID = 258216, category = "Structural", subCategory = "Misc", labels = "", name = "Foreuse de foudre mogu reconstituée", profession = "Ingénierie" },
        { itemID = 257097, category = "Lighting", subCategory = "Misc Lighting", labels = "", name = "Brasero mogu intense", profession = "Enchantement" },
        -- Lot 3 Additions
        { itemID = 247856, category = "Structural", subCategory = "Large Structures", labels = "Pandaren", name = "Tente du pic de la Sérénité", profession = "Travail du cuir" },
        -- Lot 5 Additions (Pandaria)
        { itemID = 245513, category = "Furnishings", subCategory = "Table", labels = "Pandaren", name = "Table pandarène carrée", profession = "Calligraphie" },
        { itemID = 247728, category = "Structural", subCategory = "Misc", labels = "Pandaren", name = "Poteau pandaren en pierre", profession = "Joaillerie" },
        { itemID = 247731, category = "Accents", subCategory = "Ornamental", labels = "Pandaren", name = "Lanternes en papier suspendues", profession = "Calligraphie" },
        -- Manual Additions
        { itemID = 265502, category = "Lighting", subCategory = "Brazier", labels = "Pandaren", name = "Brasero de signal pandaren", profession = "Forge" },
        { itemID = 247733, category = "Decoration", subCategory = "Kitchen", labels = "Pandaren", name = "Marmite de Micolline", profession = "Ingénierie" },
        { itemID = 247738, category = "Accents", subCategory = "Floor", labels = "Pandaren", name = "Tapis de vagabondage pandaren", profession = "Couture" },
        { itemID = 247752, category = "Accents", subCategory = "Ornamental", labels = "Pandaren", name = "Foyer pandaren", profession = "Forge" },
        { itemID = 247767, category = "Furnishings", subCategory = "Bed", labels = "Pandaren", name = "Lit de sage pandaren", profession = "Travail du cuir" },
        { itemID = 258302, category = "Accents", subCategory = "Ornamental", labels = "Pandaren", name = "Filet de pêche pandaren", profession = "Couture" },
        { itemID = 247661, category = "Lighting", subCategory = "Large Lights", labels = "Pandaren", name = "Brasero de signal pandaren", profession = "Forge" },
        { itemID = 245509, category = "Structural", subCategory = "Misc", labels = "Pandaren", name = "Mur pandaren en pierre", profession = "Joaillerie" },
        { itemID = 258214, category = "Accents", subCategory = "Ornamental", labels = "Pandaren", name = "Kit d'alchimiste pandaren", profession = "Alchimie" },
        { itemID = 247669, category = "Furnishings", subCategory = "Storage", labels = "Pandaren", name = "Bibliothèque de chroniqueur", profession = "Calligraphie" },
        -- Manual Additions
        { itemID = 247735, category = "Furnishings", subCategory = "Seating", labels = "Pandaren", name = "Banc de voyage porte-bonheur", profession = "Calligraphie" },
        { itemID = 257043, category = "Accents", subCategory = "Ornamental", labels = "Pandaren", name = "Cornue d'alchimiste pandarène", profession = "Alchimie" },
        -- Manual Additions (Screenshot Batch 4)
        { itemID = 245514, category = "Furnishings", subCategory = "Table", labels = "Pandaren", name = "Table pandarène en bois", profession = "Calligraphie" },
        { itemID = 257096, category = "Lighting", subCategory = "Table", labels = "Pandaren", name = "Lampe de table pandarène", profession = "Enchantement" },
    },

    ["OLEMBA"] = { -- TBC
        { itemID = 258190, category = "Accents", subCategory = "Wall", labels = "Horde", name = "Bannière mag'har de l'Outreterre", profession = "Travail du cuir" },
        -- Manual Additions
        { itemID = 265506, category = "Accents", subCategory = "Wall", labels = "Draconique", name = "Bannière des Exilés en bronze", profession = "Couture" },
        -- Lot 2 Additions (Draenei TBC items)
        { itemID = 258196, category = "Miscellaneous", subCategory = "All", labels = "Alliance", name = "Transmetteur draeneï", profession = "Ingénierie" },
        { itemID = 258198, category = "Furnishings", subCategory = "Tables", labels = "Alliance", name = "Table ronde draeneï dorée", profession = "Calligraphie" },
        -- Manual Additions (Batch 46)
        { itemID = 258215, category = "Furnishings", subCategory = "Seating", labels = "Alliance", name = "Banc de Halaa", profession = "Calligraphie" },
        { itemID = 258193, category = "Miscellaneous", subCategory = "All", labels = "Alliance", name = "Piédestal de projecteur holographique draeneï", profession = "Ingénierie" },
        { itemID = 258200, category = "Lighting", subCategory = "Candle", labels = "Alliance", name = "Bougeoir de Shattrath", profession = "Joaillerie" },
        { itemID = 258199, category = "Furnishings", subCategory = "Storage", labels = "Alliance", name = "Bibliothèque de l'Aldor", profession = "Calligraphie" },
        { itemID = 258201, category = "Lighting", subCategory = "Street Lights", labels = "Alliance", name = "Réverbère de Shattrath", profession = "Joaillerie" },
        { itemID = 257036, category = "Furnishings", subCategory = "Tables", labels = "Alliance", name = "Enclume de forge draeneï", profession = "Forge" },
        { itemID = 257037, category = "Accents", subCategory = "Ornamental", labels = "Alliance", name = "Holo-estrade draeneï", profession = "Enchantement" },
        { itemID = 257038, category = "Accents", subCategory = "Floor", labels = "Alliance", name = "Holo-chemin draeneï", profession = "Enchantement" },
        { itemID = 257039, category = "Accents", subCategory = "Ornamental", labels = "Alliance", name = "Forge en cristal draeneï", profession = "Forge" },
        { itemID = 262347, category = "Lighting", subCategory = "Large Lights", labels = "Alliance", name = "Chandelier en cristal draeneï", profession = "Joaillerie" },
        { itemID = 258191, category = "Miscellaneous", subCategory = "All", labels = "", name = "Épouvantail leurre arakkoa", profession = "Travail du cuir" },
        { itemID = 257093, category = "Miscellaneous", subCategory = "Quest", labels = "Alliance", name = "Console stellaire de l'Aldor", profession = "Enchantement" },
        { itemID = 258195, category = "Furnishings", subCategory = "Production", labels = "Alliance", name = "Métier à tisser de tisseuse draeneï", profession = "Couture" },
        { itemID = 258197, category = "Accents", subCategory = "Ornamental", labels = "Alliance", name = "Panneau en cristal", profession = "Calligraphie" },
        -- Lot 3 Additions
        { itemID = 258192, category = "Miscellaneous", subCategory = "All", labels = "", name = "Totem du roi-serre", profession = "Calligraphie" },
        -- Lot 5 Additions (Exiles)
        { itemID = 258202, category = "Accents", subCategory = "Wall", labels = "Alliance", name = "Grand drapé des Exilés", profession = "Couture" },
        
        -- Manual Additions
        { itemID = 258194, category = "Accents", subCategory = "Ornamental", labels = "Alliance", name = "Nacelle cryogénique du donjon de la Tempête", profession = "Ingénierie" },
        { itemID = 264709, category = "Furnishings", subCategory = "Storage", labels = "", name = "Sac d'étouffante", profession = "Alchimie" },
        -- Moved from ARDEN
        { itemID = 264705, category = "Accents", subCategory = "Food and Drink", labels = "Horde", name = "Flacon sin'dorei verni", profession = "Alchimie" },
        { itemID = 264706, category = "Lighting", subCategory = "Torch", labels = "", name = "Torche du Conseil des ombres", profession = "Alchimie" },
    },

    ["IRONWOOD"] = { -- Classic
        -- Lot 2 Additions
        { itemID = 257100, category = "Furnishings", subCategory = "Tables", labels = "", name = "Établi d'apothicaire", profession = "Alchimie" },
        -- Lot 3 Additions
        { itemID = 258289, category = "Structural", subCategory = "Misc", labels = "Horde", name = "Totem des Pitons-du-Tonnerre", profession = "Calligraphie" },
        { itemID = 246700, category = "Furnishings", subCategory = "Bed", labels = "Alliance", name = "Lit à vapeur gnome", profession = "Ingénierie" },
        -- Lot 4 Additions (Dwarven)
        { itemID = 246423, category = "Furnishings", subCategory = "Table", labels = "Alliance", name = "Table de Forgefer en bois", profession = "Calligraphie" },
        { itemID = 246489, category = "Accents", subCategory = "Wall Hangings", labels = "Alliance", name = "Emblème de Forgefer en acier", profession = "Forge" },
        { itemID = 246420, category = "Furnishings", subCategory = "Storage", labels = "Alliance", name = "Bibliothèque de Kharanos", profession = "Calligraphie" },
        { itemID = 242948, category = "Accents", subCategory = "Floor", labels = "Alliance", name = "Tapis de Loch Modan en peau d'ours", profession = "Travail du cuir" },
        -- Lot 5 Additions (Dark Iron / Classic Tauren)
        { itemID = 246410, category = "Furnishings", subCategory = "Table", labels = "Alliance", name = "Scie sur table sombrefer", profession = "Ingénierie" },
        { itemID = 253250, category = "Lighting", subCategory = "Small Lights", labels = "Horde", name = "Feu de camp de Tirisfal", profession = "Enchantement" },
        { itemID = 257725, category = "Accents", subCategory = "Floor", labels = "Horde", name = "Tapis du camp Narache", profession = "Travail du cuir" },
        -- Manual Additions (from User Screenshots)
        { itemID = 246488, category = "Lighting", subCategory = "Chandelier", labels = "Alliance", name = "Chandelier de Forgefer", profession = "Joaillerie" },
        { itemID = 246111, category = "Lighting", subCategory = "Sconce", labels = "Alliance", name = "Bougeoir ombreforge", profession = "Forge" },
        -- Moved from ARDEN (Uses Ironwood/Bois de bois-de-fer)
        { itemID = 263027, category = "Lighting", subCategory = "Brazier", labels = "Revendreth", name = "Brasero mystique du Sombre Maître", profession = "Enchantement" },
        { itemID = 246685, category = "Accents", subCategory = "Wall", labels = "Alliance", name = "Bannière du quartier des Nains", profession = "Couture" },
        -- Manual Additions
        { itemID = 246413, category = "Lighting", subCategory = "Street Lights", labels = "Alliance", name = "Réverbère rochenoire", profession = "Joaillerie" },
        -- Moved from ARDEN
        { itemID = 243336, category = "Accents", subCategory = "Floor", labels = "Horde", name = "Tapis de la cime des Anciens", profession = "Couture" },
        { itemID = 257041, category = "Accents", subCategory = "Food and Drink", labels = "", name = "Potion noire à bouchon", profession = "Alchimie" },
        -- Moved from ASHWOOD
        { itemID = 245502, category = "Furnishings", subCategory = "Storage", labels = "Horde", name = "Cercueil de Brill", profession = "Calligraphie" },
        { itemID = 245503, category = "Decoration", subCategory = "Outdoor", labels = "Horde", name = "Couvercle de cercueil de Brill", profession = "Calligraphie" },
    },
}

-- Fonction pour obtenir le type de bois d'un item (Reverse lookup)
function addonTable.Database:GetItemWood(index_or_itemID)
    for woodKey, items in pairs(self.Items) do
        for _, item in ipairs(items) do
            if item.itemID == index_or_itemID then
                return woodKey
            end
        end
    end
    return nil
end

function addonTable.Database:MatchWood(index, woodKey)
    return self:MatchWoodByItemID(index, woodKey)
end

function addonTable.Database:MatchWoodByItemID(itemID, woodKey)
    local items = self.Items[woodKey]
    if not items then return false end

    for _, item in ipairs(items) do
        if item.itemID == itemID then
            return true
        end
    end
    return false
end

function addonTable.Database:MatchCategoryByItemID(itemID, category)
    for _, items in pairs(self.Items) do
        for _, item in ipairs(items) do
            if item.itemID == itemID then
                if category == "FURNITURE" then
                    return item.category == "Furnishings"
                elseif category == "DECORATION" then
                    return item.category == "Accents" or item.category == "Decoration"
                elseif category == "LIGHTING" then
                    return item.category == "Lighting"
                elseif category == "STRUCTURAL" then
                    return item.category == "Structural"
                elseif category == "STORAGE" then
                    return item.subCategory == "Storage"
                elseif category == "TEXTILE" then
                    return item.subCategory == "Floor" or item.subCategory == "Wall" or item.subCategory == "Wall Hangings" or item.subCategory == "Bed" or item.subCategory == "Tent" or item.subCategory == "Rug"
                elseif category == "OUTDOOR" then
                    return item.subCategory == "Outdoor" or item.subCategory == "Fences" or item.subCategory == "Large Structures" or item.subCategory == "Street Lights"
                elseif category == "MISC" then
                    return item.category == "Miscellaneous" or item.category == "Toys"
                else
                    -- Fallback ou "Toutes catégories" (nil géré en amont)
                    return item.category == category or item.subCategory == category
                end
            end
        end
    end
    return false
end



function addonTable.Database:MatchProfessionByItemID(itemID, profession)
    for _, items in pairs(self.Items) do
        for _, item in ipairs(items) do
            if item.itemID == itemID then
                return item.profession == profession
            end
        end
    end
    return false
end

-- Récupère la liste unique et triée de toutes les étiquettes (Statiques + Custom)
function addonTable.Database:GetAllLabels()
    local labelSet = {}
    
    -- 1. Scan Database Statique
    for _, items in pairs(self.Items) do
        for _, item in ipairs(items) do
            if item.labels then
                -- Découpe les labels séparés par des virgules
                for label in string.gmatch(item.labels, "([^,]+)") do
                    -- Trim whitespace
                    label = label:match("^%s*(.-)%s*$")
                    if label and label ~= "" then
                        labelSet[label] = true
                    end
                end
            end
        end
    end
    
    -- 2. Scan CustomLabels (SavedVariable)
    if HousingCrafterDB and HousingCrafterDB.CustomLabels then
        for itemID, labelsStr in pairs(HousingCrafterDB.CustomLabels) do
             for label in string.gmatch(labelsStr, "([^,]+)") do
                label = label:match("^%s*(.-)%s*$")
                if label and label ~= "" then
                    labelSet[label] = true
                end
            end
        end
    end
    
    -- Convertir en liste triée
    local sortedLabels = {}
    for label, _ in pairs(labelSet) do
        table.insert(sortedLabels, label)
    end
    table.sort(sortedLabels)
    
    return sortedLabels
end

-- Vérifie si l'item possède AU MOINS UN des labels sélectionnés (Logique OU)
function addonTable.Database:MatchLabelsByItemID(itemID, selectedLabelsMap)
    -- Si aucun label sélectionné, on ne filtre pas (match tout)
    if not selectedLabelsMap or next(selectedLabelsMap) == nil then
        return true
    end
    
    local itemLabelsStr = ""
    
    -- Chercher l'item dans la DB Statique
    local found = false
    for _, items in pairs(self.Items) do
        for _, item in ipairs(items) do
            if item.itemID == itemID then
                itemLabelsStr = item.labels or ""
                found = true
                break
            end
        end
        if found then break end
    end
    
    -- Ajouter les CustomLabels si existent
    if HousingCrafterDB and HousingCrafterDB.CustomLabels and HousingCrafterDB.CustomLabels[itemID] then
        if itemLabelsStr ~= "" then
            itemLabelsStr = itemLabelsStr .. ", " .. HousingCrafterDB.CustomLabels[itemID]
        else
            itemLabelsStr = HousingCrafterDB.CustomLabels[itemID]
        end
    end
    
    -- Vérification
    for label in string.gmatch(itemLabelsStr, "([^,]+)") do
        label = label:match("^%s*(.-)%s*$")
        if label and selectedLabelsMap[label] then
            return true -- Match trouvé !
        end
    end
    
    return false
end

function addonTable.Database:GetRecipesByWood(woodKey)
    return self.Items[woodKey] or {}
end

function addonTable.Database:GetTotalItemCount()
    local count = 0
    for _, items in pairs(self.Items) do
        count = count + #items
    end
    return count
end

-- Récupère UNIQUEMENT les étiquettes de la base statique (Standard)
function addonTable.Database:GetStandardLabelValues()
    local labelSet = {}
    
    for _, items in pairs(self.Items) do
        for _, item in ipairs(items) do
            if item.labels then
                for label in string.gmatch(item.labels, "([^,]+)") do
                    label = label:match("^%s*(.-)%s*$")
                    if label and label ~= "" then
                        labelSet[label] = true
                    end
                end
            end
        end
    end
    
    local sorted = {}
    for label, _ in pairs(labelSet) do table.insert(sorted, label) end
    table.sort(sorted)
    return sorted
end

-- Récupère UNIQUEMENT les étiquettes personnalisées (SavedVariables)
function addonTable.Database:GetCustomLabelValues()
    if not HousingCrafterDB or not HousingCrafterDB.CustomLabels then
        return {}
    end

    local labelSet = {}
    for _, labelsStr in pairs(HousingCrafterDB.CustomLabels) do
        for label in string.gmatch(labelsStr, "([^,]+)") do
            label = label:match("^%s*(.-)%s*$")
            if label and label ~= "" then
                labelSet[label] = true
            end
        end
    end
    
    local sorted = {}
    for label, _ in pairs(labelSet) do table.insert(sorted, label) end
    table.sort(sorted)
    return sorted
end

-- Ajoute une étiquette personnalisée à un item
function addonTable.Database:AddCustomLabel(itemID, newLabel)
    if not itemID or not newLabel or newLabel == "" then return end
    
    -- Nettoyer le label
    newLabel = newLabel:match("^%s*(.-)%s*$")
    
    -- Init DB
    if not HousingCrafterDB.CustomLabels then HousingCrafterDB.CustomLabels = {} end
    
    local currentLabels = HousingCrafterDB.CustomLabels[itemID] or ""
    
    -- Vérifier si déjà présent
    for label in string.gmatch(currentLabels, "([^,]+)") do
        label = label:match("^%s*(.-)%s*$")
        if label == newLabel then return end -- Déjà là
    end
    
    -- Ajouter
    if currentLabels == "" then
        HousingCrafterDB.CustomLabels[itemID] = newLabel
    else
        HousingCrafterDB.CustomLabels[itemID] = currentLabels .. ", " .. newLabel
    end
end

-- Retire une étiquette personnalisée d'un item
function addonTable.Database:RemoveCustomLabel(itemID, labelToRemove)
    if not itemID or not labelToRemove or not HousingCrafterDB or not HousingCrafterDB.CustomLabels then return end
    
    local currentLabels = HousingCrafterDB.CustomLabels[itemID]
    if not currentLabels then return end
    
    local newLabels = {}
    for label in string.gmatch(currentLabels, "([^,]+)") do
        label = label:match("^%s*(.-)%s*$")
        if label ~= labelToRemove then
            table.insert(newLabels, label)
        end
    end
    
    if #newLabels == 0 then
        HousingCrafterDB.CustomLabels[itemID] = nil
    else
        HousingCrafterDB.CustomLabels[itemID] = table.concat(newLabels, ", ")
    end
end

-- Récupère les labels (Standard + Custom) pour un item donné sous forme de liste
function addonTable.Database:GetLabelsForItem(itemID)
    local labels = {}
    local seen = {}
    
    -- 1. Standard
    for _, items in pairs(self.Items) do
        for _, item in ipairs(items) do
            if item.itemID == itemID and item.labels then
                for label in string.gmatch(item.labels, "([^,]+)") do
                    label = label:match("^%s*(.-)%s*$")
                    if label and not seen[label] then
                        table.insert(labels, { name = label, isCustom = false })
                        seen[label] = true
                    end
                end
                break
            end
        end
    end

    -- 2. Custom
    if HousingCrafterDB and HousingCrafterDB.CustomLabels and HousingCrafterDB.CustomLabels[itemID] then
        for label in string.gmatch(HousingCrafterDB.CustomLabels[itemID], "([^,]+)") do
            label = label:match("^%s*(.-)%s*$")
            if label and not seen[label] then
                table.insert(labels, { name = label, isCustom = true })
                seen[label] = true
            end
        end
    end
    
    table.sort(labels, function(a,b) return a.name < b.name end)
    return labels
end

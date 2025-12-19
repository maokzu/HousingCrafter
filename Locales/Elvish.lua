local addonName, addonTable = ...
local L = {}

-- HEADERS
L["TITRE_PRINCIPAL"] = "Fëa Hroa" -- Esprit et Matière (Housing Crafter)
L["TITRE_GUIDE"] = "Mentë Tano" -- Guide de l'Architecte (Chemin du Façonneur)
L["TITRE_ETIQUETTES"] = "Tengwa Kenta" -- Gérer les Signes (Étiquettes)
L["TITRE_REGISTRE"] = "Némë Certa" -- Registre des Runes
L["TITRE_ACCESSIBILITE"] = "Enyalië" -- Mémoire/Accessibilité

-- BOUTONS
L["BTN_FILTRER"] = "Tir-" -- Regarder (Filtrer)
L["BTN_RECHERCHE"] = "Cesta..." -- Chercher...
L["BTN_ETIQUETTES"] = "Tengwar" -- Lettres (Étiquettes)
L["BTN_AJOUTER"] = "Ono-" -- Ajouter/Créer
L["BTN_FERMER"] = "Holta" -- Fermer
L["BTN_RESET"] = "Enwu" -- Recommencer (Reset)

-- DROPDOWNS
L["DD_CLASSIFICATION"] = "Nossë" -- Clan/Famille (Classification)
L["DD_METIER"] = "Curwë" -- Technique/Métier
L["DD_BOIS"] = "Tawar" -- Bois
L["DD_TOUT_BOIS"] = "Ilyë Tawan" -- Tous les bois
L["DD_TOUT_METIER"] = "Ilyë Curwi" -- Tous les métiers
L["DD_ALL"] = "Ilyë" -- Tout

-- CATEGORIES (Approximations sindarin/quenya)
L["CAT_MEUBLES"] = "Hanst" -- Sièges/Tables
L["CAT_DECORATIONS"] = "Netil" -- Ornements
L["CAT_ECLAIRAGE"] = "Calad" -- Lumière
L["CAT_STRUCTURES"] = "Pandar" -- Cours/Salles
L["CAT_RANGEMENT"] = "Hwarma" -- Coffre
L["CAT_TEXTILES"] = "Lann" -- Tissu
L["CAT_EXTERIEUR"] = "Ettë" -- Dehors
L["CAT_DIVERS"] = "Nost" -- Autres

-- SECTIONS
L["SECTION_ARCHIVES_PERSO"] = "Vëa Sanya" -- Archives personnelles (Mémoire privée)
L["SECTION_REGISTRE_STD"] = "Quenta Noldorin" -- Histoire des Sages (Registre standard)

-- OPTIONS
L["OPT_TAILLE_FENETRE"] = "Tië" -- Vision
L["OPT_TEXTE_LARGE"] = "Pella Tengwa" -- Grande lettre
L["OPT_THEME"] = "Vinyë" -- Ambiance/Soir
L["OPT_TRANSPARENCE"] = "Fëa" -- Esprit (Transparence)
L["VAL_OR"] = "Laurë" -- Or
L["VAL_PIERRE"] = "Sarn" -- Pierre
L["VAL_NEANT"] = "Mordo" -- Ombre/Néant

-- LANGUAGE SELECTOR
L["TITRE_LANGUE"] = "Lambë" -- Langue
L["LANG_FR"] = "Falmar" -- (Langue des Côtes - Français)
L["LANG_EN"] = "Andúnë" -- (Ouest - Anglais)
L["LANG_DE"] = "Rómen" -- (Est - Allemand)
L["LANG_ES"] = "Hyarmen" -- (Sud - Espagnol)
L["LANG_IT"] = "Vinyamar" -- (Nouveau Pays - Italie)
L["LANG_RU"] = "Forod" -- (Nord - Russie)
L["LANG_PT"] = "Númen" -- (Ouest Lointain - Portugal)
L["LANG_ELF"] = "Edhellen" -- Elfique
L["LANG_ORC"] = "Glamhoth" -- (Horde bruyante - Orc)

-- LABELS
L["LABEL_ALLIANCE"] = "Edhil" -- Elfes (Alliance)
L["LABEL_BASTION"] = "Minas" -- Tour
L["LABEL_CARTEL"] = "Hamu" -- Commerce
L["LABEL_DALARAN"] = "Minstir" -- Tour Gardée
L["LABEL_DRACONIQUE"] = "Lókë" -- Dragon
L["LABEL_HORDE"] = "Glamhoth" -- Horde
L["LABEL_MALDRAXXUS"] = "Gurth" -- Mort
L["LABEL_NÉRUBIEN"] = "Ungol" -- Araignée
L["LABEL_PANDAREN"] = "Moina" -- Doux (Panda)
L["LABEL_PELUCHE"] = "Milya" -- Doux
L["LABEL_REVENDRETH"] = "Carag" -- Dent
L["LABEL_SYLVARDEN"] = "Taur" -- Forêt
L["LABEL_TERRESTRE"] = "Cemen" -- Terre
L["LABEL_TITAN"] = "Valar" -- Puissances (Titan)

-- PROFESSIONS
L["PROF_FORGE"] = "Aulë" -- Forgeron (Dieu forgeron)
L["PROF_INGENIERIE"] = "Angol" -- Science profonde
L["PROF_COUTURE"] = "Serindë" -- Brodeuse / Tisseuse
L["PROF_TDC"] = "Alu" -- Cuir
L["PROF_CALLIGRAPHIE"] = "Tecil" -- Plume
L["PROF_JOAILLERIE"] = "Míre" -- Joyau
L["PROF_ALCHIMIE"] = "Yulda" -- Breuvage
L["PROF_ENCHANTEMENT"] = "Lúva" -- Enchantement
L["PROF_CUISINE"] = "Mátengwi" -- Repas

-- WOOD TYPES
L["BOIS_DORNIC"] = "Orn" -- Arbre
L["BOIS_DRAGONPINE"] = "Lómelindë" -- Rossignol (Dragon)
L["BOIS_ARDEN"] = "Taur-nu-Fuin" -- Forêt sous la nuit (Arden)
L["BOIS_DARKPINE"] = "Moren" -- Sombre
L["BOIS_FELTOUCHED"] = "Thuringwethil" -- Ombre secrète (Vil)
L["BOIS_SHADOWMOON"] = "Ithil" -- Lune
L["BOIS_BAMBOO"] = "Lais" -- Feuilles
L["BOIS_ASHWOOD"] = "Lith" -- Cendre
L["BOIS_COLDWIND"] = "Súlimo" -- Vent
L["BOIS_OLEMBA"] = "Alda" -- Arbre
L["BOIS_IRONWOOD"] = "Anga" -- Fer


-- GUIDE
L["GUIDE_INTRO"] = "Mae govannen, Tano ! Manen le ?" -- Bienvenue, Façonneur !
L["GUIDE_DESC_BOIS"] = "Tir i tawar (Duro, Orn...)." -- Choisis le bois
L["GUIDE_DESC_CLASS"] = "Tir i nossë (Rambali, Talami...)." -- Filtre par famille
L["GUIDE_DESC_METIER"] = "Tir i curwë (Tamin, Tann...)." -- Cible le métier
L["GUIDE_PAGE2"] = "Hanta i vëa sanya :\n\n|cFF00FF00Formen-Ranc|r (Clic-Droit) eressë.\n\nEce ono vinyë tengwa ar tir."

L["GUIDE_TITRE_3"] = "Omentielvo" -- Au sujet de la rencontre
L["GUIDE_CREDITS"] = "HousingCrafter\nCarne |cFFFFD700Mao_KZU|r." -- Fait par Mao
L["GUIDE_PASSION"] = "I tamna ná carna 'ni estel..." -- Cet outil est fait avec espoir...
L["GUIDE_SOCIALS"] = "Tir eldhilion ?" -- Voir les étoiles ?


addonTable.L_Elvish = L

-- Core.lua - Point d'entrée de l'addon
local _, addonTable = ...
local addonName = "HousingCrafter"

-- Initialisation de la table de localisation par défaut
-- Note: les fichiers Locales/XX.lua ont déjà rempli addonTable.L (fr), L_enUS, L_Elvish

-- Frame principal pour gérer les événements
local frame = CreateFrame("Frame")

frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_LOGIN")

-- Event handler
frame:SetScript("OnEvent", function(self, event, ...)
    if event == "ADDON_LOADED" then
        local loadedAddon = select(1, ...)
        
        -- Initialisation des variables sauvegardées
        if loadedAddon == "HousingCrafter" then -- Nom du dossier HousingCrafter
            HousingCrafterDB = HousingCrafterDB or {}
            HousingCrafterDB.CustomLabels = HousingCrafterDB.CustomLabels or {}
            HousingCrafterDB.Scale = HousingCrafterDB.Scale or 1.0
            if HousingCrafterDB.UseLargeText == nil then HousingCrafterDB.UseLargeText = false end
            HousingCrafterDB.Theme = HousingCrafterDB.Theme or "Gold"
            HousingCrafterDB.Opacity = HousingCrafterDB.Opacity or 1.0
            
            -- GESTION LANGUAGES (i18n)
            -- 1. Détection Locale ou Force
            local locale = GetLocale()
            if HousingCrafterDB.Language and HousingCrafterDB.Language ~= "Elvish" then
                locale = HousingCrafterDB.Language
            end
            
            -- 2. Application Langues (EN, DE, ES, IT, RU, PT)
            if (locale == "enUS" or locale == "enGB") and addonTable.L_enUS then
                for k, v in pairs(addonTable.L_enUS) do addonTable.L[k] = v end
            elseif (locale == "deDE") and addonTable.L_deDE then
                for k, v in pairs(addonTable.L_deDE) do addonTable.L[k] = v end
            elseif (locale == "esES" or locale == "esMX") and addonTable.L_esES then
                for k, v in pairs(addonTable.L_esES) do addonTable.L[k] = v end
            elseif (locale == "itIT") and addonTable.L_itIT then
                for k, v in pairs(addonTable.L_itIT) do addonTable.L[k] = v end
            elseif (locale == "ruRU") and addonTable.L_ruRU then
                for k, v in pairs(addonTable.L_ruRU) do addonTable.L[k] = v end
            elseif (locale == "ptBR" or locale == "ptPT") and addonTable.L_ptBR then
                for k, v in pairs(addonTable.L_ptBR) do addonTable.L[k] = v end
            end

            -- 3. Application Elfique / Orc (Mode Fun)
            if HousingCrafterDB.Language == "Elvish" and addonTable.L_Elvish then
                for k, v in pairs(addonTable.L_Elvish) do addonTable.L[k] = v end
            elseif HousingCrafterDB.Language == "Orc" and addonTable.L_Orc then
                for k, v in pairs(addonTable.L_Orc) do addonTable.L[k] = v end
            end
        end

        -- Quand l'addon Blizzard_ProfessionsCustomerOrders se charge
        if loadedAddon == "Blizzard_ProfessionsCustomerOrders" then
            C_Timer.After(0.5, function()
                if addonTable.UI and addonTable.UI.Init then
                    addonTable.UI:Init()
                end
            end)
        end
    elseif event == "PLAYER_LOGIN" then
        -- Initialiser la base de données (Indexation statique)
        -- if addonTable.Database and addonTable.Database.BuildIndex then
        --     addonTable.Database:BuildIndex()
        -- end
        
        -- Initialiser la fenêtre de debug
        if addonTable.Debug and addonTable.Debug.CreateDebugWindow then
            addonTable.Debug:CreateDebugWindow()
        end
    end
end)

-- Slash Command principale (/hc)
SLASH_HOUSINGCRAFTER1 = "/hc"

SlashCmdList["HOUSINGCRAFTER"] = function(msg)
    if msg == "elf" or msg == "elvish" then
        HousingCrafterDB.Language = "Elvish"
        print("|cFF00FF00[HousingCrafter]|r Mode Elfique active ! (Rechargement...)")
        ReloadUI() 
    elseif msg == "en" or msg == "english" then
        HousingCrafterDB.Language = "enUS"
        print("|cFF00FF00[HousingCrafter]|r Mode Anglais (Force). (Rechargement...)")
        ReloadUI()
    elseif msg == "reset" or msg == "fr" or msg == "off" then
        HousingCrafterDB.Language = nil -- Retour défaut
        print("|cFF00FF00[HousingCrafter]|r Retour au language detecte (ou FR). (Rechargement...)")
        ReloadUI()
    else
        print("|cFF00FF00[HousingCrafter]|r Commandes :")
        print("  /elf : Active le mode Elfique")
        print("  /hc en : Force l'anglais (Test)")
        print("  /hc reset : Retour au language normal")
    end
end

-- Slash Command Raccourci (/elf)
SLASH_ELFMODE1 = "/elf"
SlashCmdList["ELFMODE"] = function(msg)
    HousingCrafterDB.Language = "Elvish"
    print("|cFF00FF00[HousingCrafter]|r Mode Elfique active ! (Rechargement...)")
    ReloadUI()
end

-- Core.lua - Point d'entrée de l'addon
local _, addonTable = ...
local addonName = "HousingCrafter"

-- Initialisation de la table de localisation par défaut
addonTable.L = addonTable.L or {}

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
        
        print("|cFFFFD700HousingCrafter|r chargé ! Tapez |cFF00FF00/hcdebug|r pour la fenêtre de debug.")
    end
end)


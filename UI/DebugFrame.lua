-- UI/DebugFrame.lua - Fenêtre de debug pour afficher les logs
local _, addonTable = ...

addonTable.Debug = {}
addonTable.Debug.logs = {}

function addonTable.Debug:CreateDebugWindow()
    -- Créer une fenêtre de debug
    local frame = CreateFrame("Frame", "HousingHDVDebugFrame", UIParent, "BackdropTemplate")
    frame:SetSize(600, 400)
    frame:SetPoint("CENTER", UIParent, "CENTER", 300, 0)
    frame:SetFrameStrata("DIALOG")
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", function(self) self:StartMoving() end)
    frame:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
    
    -- Fond
    frame:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true,
        tileSize = 32,
        edgeSize = 32,
        insets = { left = 8, right = 8, top = 8, bottom = 8 }
    })
    frame:SetBackdropColor(0, 0, 0, 0.95)
    frame:SetBackdropBorderColor(0.8, 0.6, 0, 1)
    
    -- Titre
    local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOP", frame, "TOP", 0, -15)
    title:SetText("|cFFFFD700HousingCrafter - Debug Logs|r")
    
    -- Bouton fermer
    local closeBtn = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
    closeBtn:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -5, -5)
    closeBtn:SetScript("OnClick", function() frame:Hide() end)
    
    -- ScrollFrame pour les logs
    local scrollFrame = CreateFrame("ScrollFrame", "HousingHDVDebugScrollFrame", frame, "UIPanelScrollFrameTemplate")
    scrollFrame:SetPoint("TOPLEFT", frame, "TOPLEFT", 15, -45)
    scrollFrame:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -30, 45)
    
    -- EditBox pour afficher les logs
    local editBox = CreateFrame("EditBox", "HousingHDVDebugEditBox", scrollFrame)
    editBox:SetMultiLine(true)
    editBox:SetFontObject(ChatFontNormal)
    editBox:SetWidth(scrollFrame:GetWidth())
    editBox:SetAutoFocus(false)
    editBox:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
    scrollFrame:SetScrollChild(editBox)
    
    -- Bouton Clear
    local clearBtn = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
    clearBtn:SetSize(100, 25)
    clearBtn:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 15, 10)
    clearBtn:SetText("Effacer")
    clearBtn:SetScript("OnClick", function()
        addonTable.Debug.logs = {}
        editBox:SetText("")
    end)
    
    -- Bouton Copier
    local copyBtn = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
    copyBtn:SetSize(100, 25)
    copyBtn:SetPoint("LEFT", clearBtn, "RIGHT", 10, 0)
    copyBtn:SetText("Tout sélectionner")
    copyBtn:SetScript("OnClick", function()
        editBox:HighlightText()
        editBox:SetFocus()
    end)

    -- Bouton Dump DB
    local dumpBtn = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
    dumpBtn:SetSize(100, 25)
    dumpBtn:SetPoint("LEFT", copyBtn, "RIGHT", 10, 0)
    dumpBtn:SetText("Dump DB")
    dumpBtn:SetScript("OnClick", function()
        addonTable.Debug:DumpDatabase()
    end)
    
    self.frame = frame
    self.editBox = editBox
    frame:Hide()
end

function addonTable.Debug:Log(message)
    table.insert(self.logs, message)
    
    if self.editBox then
        local text = table.concat(self.logs, "\n")
        self.editBox:SetText(text)
        self.editBox:SetCursorPosition(#text)
    end
end

function addonTable.Debug:Show()
    if self.frame then
        self.frame:Show()
    end
end

function addonTable.Debug:Hide()
    if self.frame then
        self.frame:Hide()
    end
end

-- Fonction pour scanner et dumper la base de données (Recettes)
-- Fonction pour scanner et dumper la base de données (Recettes)
-- Fonction pour scanner et dumper la base de données (Depuis l'interface de Commandes d'Artisanat)
function addonTable.Debug:DumpDatabase()
    self:Log("--- DEBUT DU DUMP (SCAN AVANCÉ) ---")
    
    local status, err = pcall(function()
        -- 1. Récupérer la frame de commandes
        local frame = _G["ProfessionsCustomerOrdersFrame"]
        if not frame or not frame:IsVisible() then
            self:Log("ERREUR: Veuillez ouvrir l'interface de Commandes d'Artisanat (PNJ).")
            return
        end
        
        -- 2. Accéder à la liste des recettes
        local browseOrders = frame.BrowseOrders
        if not browseOrders then
            self:Log("ERREUR: Onglet 'Recherche' (BrowseOrders) introuvable.")
            return
        end
        
        local recipeList = browseOrders.RecipeList
        if not recipeList or not recipeList.ScrollBox then
            self:Log("ERREUR: Liste des recettes introuvable.")
            return
        end
        
        local dataProvider = recipeList.ScrollBox:GetDataProvider()
        if not dataProvider then
            self:Log("ERREUR: Aucun DataProvider.")
            return
        end
        
        -- 3. Parcourir les items
        local count = 0
        self:Log("Format: ItemID ; Nom ; ItemClass ; ItemSubClass ; ProfessionID")
        
        for index, node in dataProvider:Enumerate() do
            local data = node.option or node
            
            if data and data.itemID then
                local itemID = data.itemID
                local name = GetItemInfo(itemID) or ("Item " .. itemID)
                local _, _, _, itemEquipLoc, _, itemClassID, itemSubClassID = GetItemInfoInstant(itemID)
                
                -- Essayer de récupérer le nom de la classe/sous-classe
                local itemClass = itemClassID and GetItemClassInfo(itemClassID) or "?"
                local itemSubClass = (itemClassID and itemSubClassID) and GetItemSubClassInfo(itemClassID, itemSubClassID) or "?"
                
                -- Essayer de trouver la profession
                local professionID = "N/A"
                if data.skillLineID then
                    professionID = data.skillLineID
                elseif data.professionID then
                    professionID = data.professionID
                end
                
                -- Si on a une skillLineAbilityID, on peut parfois remonter à la profession
                if professionID == "N/A" and data.skillLineAbilityID then
                    -- Tentative via C_TradeSkillUI (hypothétique si l'API le permet directement)
                    -- Pour l'instant on log l'ID brut
                    professionID = "Ability:" .. data.skillLineAbilityID
                end

                self:Log(string.format("%d ; %s ; %s ; %s ; %s", itemID, name, itemClass, itemSubClass, tostring(professionID)))
                count = count + 1
            end
        end
        
        self:Log("--- FIN DU DUMP (" .. count .. " items trouvés) ---")
    end)
    
    if not status then
        self:Log("CRASH LUA : " .. tostring(err))
    end
end

-- Commande slash pour afficher/masquer la fenêtre
SLASH_HOUSINGCRAFTERDEBUG1 = "/hcdebug"
SlashCmdList["HOUSINGCRAFTERDEBUG"] = function()
    if addonTable.Debug then
        if not addonTable.Debug.frame then
            addonTable.Debug:CreateDebugWindow()
        end
        
        if addonTable.Debug.frame:IsShown() then
            addonTable.Debug:Hide()
        else
            addonTable.Debug:Show()
        end
    end
end

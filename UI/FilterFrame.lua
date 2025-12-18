-- UI/FilterFrame.lua - Interface utilisateur
local _, addonTable = ...
local L = addonTable.L
addonTable.UI = {}

function addonTable.UI:Init()
    local parentFrame = ProfessionsCustomerOrdersFrame
    if not parentFrame then
        return
    end

    self:CreateCustomUI(parentFrame)
    self:HookNativeDataProvider(parentFrame)
end

function addonTable.UI:CreateCustomUI(parent)
    -- Créer une fenêtre flottante INDÉPENDANTE au-dessus de l'interface d'artisanat
    -- Créer une fenêtre flottante INDÉPENDANTE au-dessus de l'interface d'artisanat
    local container = CreateFrame("Frame", "HousingHDVContainer", UIParent, "BackdropTemplate")
    container:SetSize(850, 150) -- Hauteur augmentée pour 3 lignes (Titre / Dropdowns / Boutons)
    container:SetFrameStrata("DIALOG") -- Au-dessus de l'interface d'artisanat
    
    -- Positionner au-dessus du titre de la fenêtre d'artisanat
    container:SetPoint("BOTTOM", parent, "TOP", 0, 8)
    
    -- Fond avec style WoW "Premium" (Custom Background)
    container:SetBackdrop({
        bgFile = "Interface\\AddOns\\HousingCrafter\\Media\\Background.tga", -- Texture utilisateur
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Gold-Border", -- Bordure Or
        tile = true,
        tileSize = 256,
        edgeSize = 32,
        insets = { left = 11, right = 12, top = 12, bottom = 11 }
    })
    container:SetBackdropColor(1, 1, 1, 1) -- Blanc pour afficher la texture telle quelle (Opaque)
    container:SetBackdropBorderColor(1, 1, 1, 1)
    
    -- Rendre la fenêtre déplaçable
    container:SetMovable(true)
    container:EnableMouse(true)
    container:RegisterForDrag("LeftButton")
    container:SetScript("OnDragStart", function(self) self:StartMoving() end)
    container:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
    
    -- Masquer/afficher avec la fenêtre parent
    parent:HookScript("OnShow", function()
        container:Show()
    end)
    parent:HookScript("OnHide", function()
        container:Hide()
    end)
    
    self.container = container
    
    -- Header Background (Style WoW Classique)
    local headerBg = container:CreateTexture(nil, "ARTWORK")
    headerBg:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Header")
    headerBg:SetSize(570, 64) -- Largeur adjustée (Titre Long)
    headerBg:SetPoint("TOP", container, "TOP", 0, 12) -- Chevauche le bord supérieur
    
    -- Label "HousingHDV" (Titre Centré sur le Header)
    local label = container:CreateFontString(nil, "OVERLAY", "GameFontNormalHuge")
    label:SetPoint("TOP", headerBg, "TOP", 0, -12) -- Centré verticalement
    label:SetText("|cFFFFD700Registre de l'Architecte|r")
    label:SetShadowOffset(1, -1)
    
    -- Bouton Info / Guide (Point d'entrée)
    local infoButton = CreateFrame("Button", "HousingHDVInfoButton", container)
    infoButton:SetSize(24, 24)
    infoButton:SetPoint("TOPRIGHT", container, "TOPRIGHT", -15, -15)
    infoButton:SetNormalTexture("Interface\\common\\help-i")
    infoButton:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight")
    
    self.infoButton = infoButton

    -- FENÊTRE GUIDE (Style Journal de Quête - Version Simple)
    -- On revient à un cadre simple pour éviter les erreurs de Template
    local guideFrame = CreateFrame("Frame", "HousingHDVGuideFrame", UIParent, "BackdropTemplate")
    guideFrame:SetSize(338, 496) -- Taille standard
    guideFrame:SetPoint("CENTER")
    guideFrame:SetFrameStrata("DIALOG")
    guideFrame:Hide()
    
    -- Fond Noir Simple (Lisibilité maximale)
    guideFrame:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8x8", -- Texture unie pour un noir parfait
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 32, edgeSize = 32,
        insets = { left = 5, right = 5, top = 5, bottom = 5 }
    })
    guideFrame:SetBackdropColor(0, 0, 0, 1) -- Noir Opaque (100%)
    
    -- Bouton de Fermeture (Haut Droit)
    local closeGuide = CreateFrame("Button", nil, guideFrame, "UIPanelCloseButton")
    closeGuide:SetPoint("TOPRIGHT", -5, -5)
    closeGuide:SetScript("OnClick", function() guideFrame:Hide() end)

    -- Titre (Jaune)
    local guideTitle = guideFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalHuge")
    guideTitle:SetPoint("TOP", 0, -25)
    guideTitle:SetText("Guide de l'Architecte")
    guideTitle:SetTextColor(1, 0.82, 0, 1) -- Jaune WoW
    
    -- Zone de Contenu Texte (Blanc)
    local contentText = guideFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightMedium") -- Police plus lisible
    contentText:SetPoint("TOPLEFT", 25, -60)
    contentText:SetPoint("BOTTOMRIGHT", -25, 50) -- Place pour nav en bas
    contentText:SetJustifyH("LEFT")
    contentText:SetJustifyV("TOP")
    contentText:SetTextColor(1, 1, 1, 1) -- Blanc
    
    -- EditBox Twitch (Pour copier-coller) - Uniquement slide 3
    local twitchBox = CreateFrame("EditBox", nil, guideFrame, "InputBoxTemplate")
    twitchBox:SetSize(240, 20)
    twitchBox:SetPoint("BOTTOM", 0, 80) -- Positionné en bas de page
    twitchBox:SetAutoFocus(false)
    twitchBox:SetText("https://www.twitch.tv/mao_kzu")
    twitchBox:Hide()
    
    twitchBox:SetScript("OnTextChanged", function(self)
        if self:GetText() ~= "https://www.twitch.tv/mao_kzu" then
            self:SetText("https://www.twitch.tv/mao_kzu")
            self:HighlightText()
        end
    end)
    twitchBox:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
    
    -- Pagination
    local currentPage = 1
    local totalPages = 3
    
    -- Indicateur Page
    local pageNum = guideFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    pageNum:SetPoint("BOTTOM", 0, 25)
    
    -- Flèches Navigation
    local prevBtn = CreateFrame("Button", nil, guideFrame)
    prevBtn:SetSize(32, 32)
    prevBtn:SetPoint("BOTTOMLEFT", 15, 15)
    prevBtn:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Up")
    prevBtn:SetPushedTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Down")
    prevBtn:SetDisabledTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Disabled")
    
    local nextBtn = CreateFrame("Button", nil, guideFrame)
    nextBtn:SetSize(32, 32)
    nextBtn:SetPoint("BOTTOMRIGHT", -15, 15)
    nextBtn:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Up")
    nextBtn:SetPushedTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Down")
    nextBtn:SetDisabledTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Disabled")
    
    local function UpdatePage()
        pageNum:SetText("Page " .. currentPage .. " / " .. totalPages)
        prevBtn:SetEnabled(currentPage > 1)
        nextBtn:SetEnabled(currentPage < totalPages)
        
        -- Reset TwitchBox visibility
        twitchBox:Hide()
        
        if currentPage == 1 then
            contentText:SetText(
                "|cFFFFD700Chapitre I : Les Registres|r\n\n" ..
                "Salutations, bâtisseur.\n\n" ..
                "Pour trouver vos matériaux, utilisez les filtres :\n\n" ..
                "- |cFF00BFFFType de Bois|r : Choisissez l'essence (Chêne, Pin...).\n\n" ..
                "- |cFF00BFFFClassification|r : Filtrez par usage (Murs, Sols, Décorations...).\n\n" ..
                "- |cFF00BFFFMétier|r : Ciblez les créations d'artisans (Forge, Ingénierie...)."
            )
        elseif currentPage == 2 then
            contentText:SetText(
                "|cFFFFD700Chapitre II : Étiquettes|r\n\n" ..
                "Organisez votre inventaire mental :\n\n" ..
                "Faîtes un |cFF00FF00Clic-Droit|r sur n'importe quel objet de la liste pour ouvrir le gestionnaire.\n\n" ..
                "Vous pouvez créer vos propres tags (ex: 'Cuisine', 'Projet A') et filtrer ensuite via le panneau latéral."
            )
        elseif currentPage == 3 then
            twitchBox:Show() -- Afficher la box
            contentText:SetText(
                "|cFFFFD700À Propos|r\n\n" ..
                "HousingCrafter v1.0\n" ..
                "Développé par le Maître Artisan |cFFFFD700Mao_KZU|r.\n\n" ..
                "Cet outil est forgé avec passion pour tous ceux qui voient des châteaux là où d'autres ne voient que des pierres.\n\n" ..
                "Si vous souhaitez soutenir les travaux de l'Architecte, rejoignez notre conclave :"
            )
        end
    end
    
    prevBtn:SetScript("OnClick", function() 
        if currentPage > 1 then currentPage = currentPage - 1 UpdatePage() end 
    end)
    
    nextBtn:SetScript("OnClick", function() 
        if currentPage < totalPages then currentPage = currentPage + 1 UpdatePage() end 
    end)
    
    -- Trigger
    infoButton:SetScript("OnClick", function()
        if guideFrame:IsShown() then
            guideFrame:Hide()
        else
            currentPage = 1
            UpdatePage()
            guideFrame:Show()
        end
    end)
    
    -- Dropdown "Type de Bois" avec sélection unique
    -- (Barre de recherche supprimée car redondante avec celle du jeu)
    
    -- Dropdown "Catégorie" (PIVOT CENTRAL)
    local categoryDropdown = CreateFrame("Frame", "HousingHDVCategoryDropdown", container, "UIDropDownMenuTemplate")
    UIDropDownMenu_SetWidth(categoryDropdown, 130)
    categoryDropdown:SetPoint("TOP", container, "TOP", 0, -60)
    
    local categories = {
        { key = nil, name = "Toutes" },
        { key = "FURNITURE", name = "Meubles" },
        { key = "DECORATION", name = "Décorations" },
        { key = "LIGHTING", name = "Éclairage" },
        { key = "STRUCTURAL", name = "Structures" },
        { key = "STORAGE", name = "Rangement" },
        { key = "TEXTILE", name = "Textiles" },
        { key = "OUTDOOR", name = "Extérieur" },
        { key = "MISC", name = "Divers" },
    }
    
    UIDropDownMenu_Initialize(categoryDropdown, function(self, level)
        for _, category in ipairs(categories) do
            local info = UIDropDownMenu_CreateInfo()
            info.text = category.name
            info.arg1 = category.key
            info.func = function(self, arg1)
                addonTable.UI.selectedCategory = arg1
                UIDropDownMenu_SetText(categoryDropdown, category.name)
            end
            info.checked = (addonTable.UI.selectedCategory == category.key)
            UIDropDownMenu_AddButton(info, level)
        end
    end)
    
    UIDropDownMenu_SetText(categoryDropdown, "Classification")
    self.categoryDropdown = categoryDropdown

    -- Dropdown "Métier" (À DROITE du Pivot)
    local professionDropdown = CreateFrame("Frame", "HousingHDVProfessionDropdown", container, "UIDropDownMenuTemplate")
    UIDropDownMenu_SetWidth(professionDropdown, 130)
    -- Ajustement léger pour coller visuellement
    professionDropdown:SetPoint("LEFT", categoryDropdown, "RIGHT", -10, 0)

    local professions = {
        "Forge", "Ingénierie", "Couture", "Travail du cuir", "Calligraphie", "Joaillerie", "Alchimie", "Enchantement", "Cuisine"
    }
    table.sort(professions)
    table.insert(professions, 1, "Tous les métiers")

    UIDropDownMenu_Initialize(professionDropdown, function(self, level)
        for _, profName in ipairs(professions) do
            local info = UIDropDownMenu_CreateInfo()
            info.text = profName
            info.arg1 = (profName ~= "Tous les métiers") and profName or nil
            info.func = function(self, arg1)
                addonTable.UI.selectedProfession = arg1
                UIDropDownMenu_SetText(professionDropdown, arg1 or "Métier")
            end
            info.checked = (addonTable.UI.selectedProfession == info.arg1)
            UIDropDownMenu_AddButton(info, level)
        end
    end)

    UIDropDownMenu_SetText(professionDropdown, "Métier")
    self.professionDropdown = professionDropdown

    -- Dropdown "Type de Bois" (À GAUCHE du Pivot)
    self.selectedWood = nil 
    self.selectedCategory = nil
    self.selectedProfession = nil
    
    local dropdown = CreateFrame("Frame", "HousingHDVDropdown", container, "UIDropDownMenuTemplate")
    UIDropDownMenu_SetWidth(dropdown, 130)
    -- Ajustement pour coller visuellement à gauche
    dropdown:SetPoint("RIGHT", categoryDropdown, "LEFT", 10, 0)
    
    UIDropDownMenu_Initialize(dropdown, function(self, level)
        local info = UIDropDownMenu_CreateInfo()
        info.text = "Tous les bois"
        info.arg1 = nil
        info.func = function(self, arg1)
            addonTable.UI.selectedWood = arg1
            UIDropDownMenu_SetText(dropdown, "Type de Bois")
        end
        info.checked = (addonTable.UI.selectedWood == nil)
        UIDropDownMenu_AddButton(info, level)
        
        info = UIDropDownMenu_CreateInfo()
        info.disabled = true
        info.notCheckable = true
        UIDropDownMenu_AddButton(info, level)
        
        for _, woodType in ipairs(addonTable.Database.WoodTypes) do
            info = UIDropDownMenu_CreateInfo()
            info.text = woodType.name
            info.arg1 = woodType.key
            info.func = function(self, arg1)
                addonTable.UI.selectedWood = arg1
                UIDropDownMenu_SetText(dropdown, woodType.name)
            end
            info.checked = (addonTable.UI.selectedWood == woodType.key)
            UIDropDownMenu_AddButton(info, level)
        end
    end)
    
    UIDropDownMenu_SetText(dropdown, "Type de Bois")
    self.dropdown = dropdown

    -- Bouton "Filtrer" - Applique le filtre manuellement (Action Principale)
    local searchButton = CreateFrame("Button", "HousingHDVSearchButton", container, "UIPanelButtonTemplate")
    searchButton:SetSize(130, 30) -- Plus gros, bouton d'action principal
    -- Ligne 3 : En bas à DROITE
    searchButton:SetPoint("BOTTOMRIGHT", container, "BOTTOMRIGHT", -25, 20)
    searchButton:SetText("Filtrer")
    
    searchButton:SetScript("OnClick", function()
        -- if addonTable.Debug then addonTable.Debug:Log("Bouton Filtrer (Custom) cliqué - Début séquence") end
        
        -- 1. Changer l'état du bouton pour indiquer la recherche
        searchButton:SetText("Recherche...")
        searchButton:Disable()
        addonTable.UI.isFiltering = true -- Flag pour éviter double exécution

        -- 2. Déclencher la recherche native
        if ProfessionsCustomerOrdersFrame and ProfessionsCustomerOrdersFrame.BrowseOrders and ProfessionsCustomerOrdersFrame.BrowseOrders.SearchBar and ProfessionsCustomerOrdersFrame.BrowseOrders.SearchBar.SearchButton then
            -- if addonTable.Debug then addonTable.Debug:Log("Bouton Recherche Natif trouvé -> Click() simule") end
            ProfessionsCustomerOrdersFrame.BrowseOrders.SearchBar.SearchButton:Click()
        else
            -- if addonTable.Debug then addonTable.Debug:Log("ERREUR: Bouton Recherche Natif NON trouvé -> Fallback") end
            addonTable.UI:ApplyFilters()
            return -- ApplyFilters gère le reset
        end

        -- 3. Sécurité (Watchdog) : Si après 2s rien ne s'est passé (pas de réponse serveur/hook), on force le filtrage
        C_Timer.After(2.0, function()
            if addonTable.UI.isFiltering then
                -- if addonTable.Debug then addonTable.Debug:Log("TIMEOUT: Le jeu n'a pas répondu -> Force Filtrage") end
                addonTable.UI:ApplyFilters()
            end
        end)
    end)
    
    self.searchButton = searchButton

    -- Bouton "Étiquettes" (Ouvre le panneau multi-colonnes)
    local labelButton = CreateFrame("Button", "HousingHDVLabelButton", container, "UIPanelButtonTemplate")
    labelButton:SetSize(130, 26) -- Plus haut
    -- Ligne 3 : À gauche du bouton Filtrer
    labelButton:SetPoint("RIGHT", searchButton, "LEFT", -10, 0)
    labelButton:SetText("Étiquettes")
    addonTable.UI.selectedLabels = {}

    -- Création du panneau de sélection (Caché par défaut)
    local labelFrame = CreateFrame("Frame", "HousingHDVLabelSelector", UIParent, "BackdropTemplate")
    labelFrame:SetSize(450, 400) -- Assez large pour 3 colonnes
    -- Ancrage par rapport au bouton (qui a bougé, donc repère dynamique)
    labelFrame:SetPoint("TOPLEFT", labelButton, "BOTTOMLEFT", 0, -20) -- Espace augmenté pour aérer l'interface
    labelFrame:SetFrameStrata("DIALOG")
    labelFrame:SetBackdrop({
        bgFile = "Interface\\AddOns\\HousingCrafter\\Media\\Background_Void.tga", -- Texture Void Portal
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 256, -- TileSize plus grand pour éviter répérition trop visible
        edgeSize = 32,
        insets = { left = 11, right = 12, top = 12, bottom = 11 }
    })
    labelFrame:SetBackdropColor(1, 1, 1, 1) -- Fond Opaque avec texture
    labelFrame:Hide()
    
    -- Titre "Registre des Provenances"
    local title = labelFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOP", 0, -15)
    title:SetText("Registre des Provenances")
    title:SetTextColor(1, 0.82, 0) -- Jaune WoW standard

    -- Ligne de séparation
    local separator = labelFrame:CreateTexture(nil, "ARTWORK")
    separator:SetHeight(1)
    separator:SetPoint("TOPLEFT", 10, -40)
    separator:SetPoint("TOPRIGHT", -10, -40)
    separator:SetColorTexture(0.5, 0.5, 0.5, 0.5) -- Gris semi-transparent

    -- ScrollFrame pour gérer le grand nombre d'étiquettes
    local scrollFrame = CreateFrame("ScrollFrame", "HousingHDVLabelScrollFrame", labelFrame, "UIPanelScrollFrameTemplate")
    scrollFrame:SetPoint("TOPLEFT", 15, -50) -- Ajusté pour laisser place au titre
    scrollFrame:SetPoint("BOTTOMRIGHT", -35, 15)

    -- Contenu du ScrollFrame
    local scrollChild = CreateFrame("Frame", "HousingHDVLabelScrollChild")
    scrollChild:SetSize(400, 1000) -- Hauteur ajustée dynamiquement
    scrollFrame:SetScrollChild(scrollChild)

    -- Fonction pour rafraîchir la liste des checkboxes
    local function RefreshLabelList()
        local customLabels = addonTable.Database:GetCustomLabelValues()
        local standardLabels = addonTable.Database:GetStandardLabelValues()
        
        local colCount = 3
        local colWidth = 130
        local cbHeight = 20
        local paddingX = 10
        
        -- Initialisation des pools si nécessaire
        if not labelFrame.checkboxes then labelFrame.checkboxes = {} end
        if not labelFrame.headers then labelFrame.headers = {} end
        
        -- Reset : tout cacher
        for _, cb in pairs(labelFrame.checkboxes) do cb:Hide() end
        for _, h in pairs(labelFrame.headers) do h:Hide() end
        
        local currentY = -10
        local checkboxIndex = 1
        local headerIndex = 1

        -- Helper pour créer/récupérer un header
        local function AddHeader(text)
            local h = labelFrame.headers[headerIndex]
            if not h then
                h = scrollChild:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
                h:SetJustifyH("LEFT")
                labelFrame.headers[headerIndex] = h
            end
            h:ClearAllPoints()
            h:SetPoint("TOPLEFT", scrollChild, "TOPLEFT", 10, currentY)
            h:SetText(text)
            h:SetTextColor(1, 0.82, 0) -- Jaune
            h:Show()
            
            headerIndex = headerIndex + 1
            currentY = currentY - 25 -- Espace pour le titre
        end

        -- Helper pour afficher une grille de labels
        local function AddLabelGrid(labels)
            local startY = currentY
            local maxYInGrid = startY
            
            for i, labelName in ipairs(labels) do
                local cb = labelFrame.checkboxes[checkboxIndex]
                if not cb then
                    local cbName = "HousingHDVLabelCheckButton"..checkboxIndex
                    cb = CreateFrame("CheckButton", cbName, scrollChild, "ChatConfigCheckButtonTemplate")
                    labelFrame.checkboxes[checkboxIndex] = cb
                end
                
                cb:ClearAllPoints()
                cb:Show()
                if _G[cb:GetName() .. "Text"] then
                    _G[cb:GetName() .. "Text"]:SetText(labelName)
                end
                cb:SetHitRectInsets(0, -100, 0, 0)
                
                local col = (i - 1) % colCount
                local row = math.floor((i - 1) / colCount)
                
                cb:SetPoint("TOPLEFT", paddingX + (col * colWidth), startY - (row * cbHeight))
                
                -- État checked
                cb:SetChecked(addonTable.UI.selectedLabels[labelName] == true)
                
                cb:SetScript("OnClick", function(self)
                    if self:GetChecked() then
                        addonTable.UI.selectedLabels[labelName] = true
                    else
                        addonTable.UI.selectedLabels[labelName] = nil
                    end
                    
                    local count = 0
                    for _ in pairs(addonTable.UI.selectedLabels) do count = count + 1 end
                    if count == 0 then
                        labelButton:SetText("Étiquettes")
                    else
                        labelButton:SetText("Étiquettes (" .. count .. ")")
                    end
                end)
                
                checkboxIndex = checkboxIndex + 1
                maxYInGrid = startY - ((row + 1) * cbHeight)
            end
            
            if #labels > 0 then
                currentY = maxYInGrid - 10 -- Marge après la grille
            end
        end

        -- LOGIQUE D'AFFICHAGE DES SECTIONS
        local hasCustom = (#customLabels > 0)
        
        if hasCustom then
            -- Section 1 : Custom
            AddHeader("Archives Personnelles")
            AddLabelGrid(customLabels)
            
            -- Séparateur visuel (optionnel, déjà géré par l'espace)
            currentY = currentY - 10 
            
            -- Section 2 : Standard
            AddHeader("Registre des Provenances")
            AddLabelGrid(standardLabels)
        else
            -- Pas de custom : Juste la grille standard
            AddLabelGrid(standardLabels)
        end
        
        scrollChild:SetSize(400, math.abs(currentY) + 20)
    end

    -- POPUP DE CHARGEMENT (Feedback Visuel)
    local loadingPopup = CreateFrame("Frame", "HousingHDVLoadingPopup", UIParent, "BackdropTemplate")
    loadingPopup:SetSize(350, 90) -- Un peu plus large pour l'icône
    loadingPopup:SetPoint("CENTER", 0, 100)
    loadingPopup:SetFrameStrata("FULLSCREEN_DIALOG")
    loadingPopup:SetBackdrop({
        bgFile = "Interface\\AddOns\\HousingCrafter\\Media\\Background_Stone.tga", -- Mur Pierre Sombrefer
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Gold-Border",
        tile = true, tileSize = 256, edgeSize = 32,
        insets = { left = 11, right = 12, top = 12, bottom = 11 }
    })
    loadingPopup:SetBackdropColor(1, 1, 1, 1) -- Opaque
    loadingPopup:Hide()
    
    -- Icône Chronomètre (Symbole d'Attente)
    local gearIcon = loadingPopup:CreateTexture(nil, "ARTWORK")
    gearIcon:SetSize(48, 48)
    gearIcon:SetTexture("Interface\\Icons\\INV_Misc_PocketWatch_01") -- Chronomètre
    gearIcon:SetPoint("LEFT", 40, 0)
    gearIcon:SetAlpha(1)
    
    -- Animation de Pulsation (Respiration)
    local ag = gearIcon:CreateAnimationGroup()
    local anim = ag:CreateAnimation("Alpha")
    anim:SetDuration(0.8)
    anim:SetFromAlpha(1)
    anim:SetToAlpha(0.3) -- Descendre un peu plus bas pour l'effet
    anim:SetSmoothing("IN_OUT") -- Transition douce
    ag:SetLooping("BOUNCE") -- Aller-retour infini
    
    loadingPopup:SetScript("OnShow", function() ag:Play() end)
    loadingPopup:SetScript("OnHide", function() ag:Stop() end)
    
    -- Texte centré par rapport au reste
    local loadingText = loadingPopup:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    loadingText:SetPoint("LEFT", gearIcon, "RIGHT", 15, 0) -- À droite de l'engrenage
    loadingText:SetText("|cFFFFD700Traitement...|r") -- Plus court pour le style
    
    -- Bouton de fermeture manuelle (Croix)
    local closeLoading = CreateFrame("Button", nil, loadingPopup, "UIPanelCloseButton")
    closeLoading:SetPoint("TOPRIGHT", loadingPopup, "TOPRIGHT", -5, -5)
    closeLoading:SetScript("OnClick", function()
        loadingPopup:Hide()
        if self.searchButton then self.searchButton:Enable() self.searchButton:SetText("Filtrer") end
    end)
    
    self.loadingPopup = loadingPopup

    -- Toggle visibility
    labelButton:SetScript("OnClick", function()
        if labelFrame:IsShown() then
            labelFrame:Hide()
        else
            RefreshLabelList() -- Refresh à l'ouverture pour être à jour
            labelFrame:Show()
        end
    end)
    
    self.labelFrame = labelFrame
    parent:HookScript("OnShow", function()
        container:Show()
    end)
    
    parent:HookScript("OnHide", function()
        container:Hide()
    end)
    
    -- Modification du bouton Search pour afficher la popup
    searchButton:SetScript("OnClick", function()
        -- 1. Feedback Visuel Immédiat
        searchButton:SetText("Recherche...")
        searchButton:Disable()
        loadingPopup:Show() -- AFFICHER LA POPUP
        
        addonTable.UI.isFiltering = true 

        -- 2. Déclencher la recherche native
        if ProfessionsCustomerOrdersFrame and ProfessionsCustomerOrdersFrame.BrowseOrders and ProfessionsCustomerOrdersFrame.BrowseOrders.SearchBar and ProfessionsCustomerOrdersFrame.BrowseOrders.SearchBar.SearchButton then
            ProfessionsCustomerOrdersFrame.BrowseOrders.SearchBar.SearchButton:Click()
        else
            addonTable.UI:ApplyFilters()
            return
        end

        -- 3. Sécurité (Watchdog)
        C_Timer.After(2.0, function()
            if addonTable.UI.isFiltering then
                addonTable.UI:ApplyFilters()
            end
            -- Force hide popup si toujours là après timeout
             if loadingPopup:IsShown() and not addonTable.UI.isFiltering then
                 loadingPopup:Hide()
             end
        end)
    end)
end

-- Hook sur le DataProvider natif pour filtrer après insertion
function addonTable.UI:HookNativeDataProvider(parent)
    -- if addonTable.Debug then addonTable.Debug:Log("Hooking native DataProvider...") end
    
    local recipeList = parent.BrowseOrders and parent.BrowseOrders.RecipeList
    if not recipeList or not recipeList.ScrollBox then
        if addonTable.Debug then addonTable.Debug:Log("RecipeList not found") end
        return
    end
    
    local scrollBox = recipeList.ScrollBox
    
    -- Sauvegarder la référence au DataProvider
    local function GetCurrentDataProvider()
        return scrollBox:GetDataProvider()
    end
    
    -- Hook SetDataProvider pour capturer le provider
    hooksecurefunc(scrollBox, "SetDataProvider", function(box, dataProvider)
        if not dataProvider then return end
        
        -- if addonTable.Debug then addonTable.Debug:Log("DataProvider detected") end
        
        -- Hook toutes les méthodes d'insertion possibles
        if not addonTable.UI.hookedProvider then
            -- Hook InsertTable
            if dataProvider.InsertTable then
                hooksecurefunc(dataProvider, "InsertTable", function(provider, tbl)
                    -- if addonTable.Debug then addonTable.Debug:Log("HOOK: InsertTable called with " .. #tbl .. " items") end
                    C_Timer.After(0.2, function()
                        addonTable.UI:ApplyFilters()
                    end)
                end)
            end
            
            -- Hook Insert (insertion unique)
            if dataProvider.Insert then
                hooksecurefunc(dataProvider, "Insert", function(provider, data)
                    -- if addonTable.Debug then addonTable.Debug:Log("Insert called") end
                end)
            end
            
            -- Hook Flush (vidage)
            if dataProvider.Flush then
                hooksecurefunc(dataProvider, "Flush", function(provider)
                    -- if addonTable.Debug then addonTable.Debug:Log("Flush called") end
                end)
            end
            
            addonTable.UI.hookedProvider = true
            -- if addonTable.Debug then addonTable.Debug:Log("All DataProvider methods hooked (Premier succès)") end
        end
    end)
    
    -- Hook direct sur le RecipeList pour détecter les mises à jour
    if recipeList.RefreshResults then
        hooksecurefunc(recipeList, "RefreshResults", function()
            -- if addonTable.Debug then addonTable.Debug:Log("HOOK: RecipeList.RefreshResults called") end
            C_Timer.After(0.3, function()
                local dp = GetCurrentDataProvider()
                if dp then
                    local count = 0
                    for _ in dp:Enumerate() do count = count + 1 end
                    -- if addonTable.Debug then addonTable.Debug:Log("Current DataProvider has " .. count .. " items") end
                end
            end)
        end)
    end
    
    -- if addonTable.Debug then addonTable.Debug:Log("DataProvider hook installed") end
    
    -- Hook du menu contextuel
    self:HookContextMenu(scrollBox)
end

-- Fonction de filtrage globale (Bois, Catégorie, Métier, Étiquettes)
function addonTable.UI:ApplyFilters()
    -- Récupérer le DataProvider
    local recipeList = ProfessionsCustomerOrdersFrame.BrowseOrders.RecipeList
    if not recipeList or not recipeList.ScrollBox then
        return
    end
    
    local dataProvider = recipeList.ScrollBox:GetDataProvider()
    if not dataProvider then
        return
    end
    
    -- Parcourir les nodes et identifier ceux à retirer
    local nodesToRemove = {}
    local keptNodes = 0
    
    for index, node in dataProvider:Enumerate() do
        local data = node.option or node
        
        if data and data.itemID then
            local itemID = data.itemID
            local shouldKeep = true
            
            -- Filtrage par type de bois
            if self.selectedWood then
                if not addonTable.Database:MatchWoodByItemID(itemID, self.selectedWood) then
                    shouldKeep = false
                end
            end
            
            -- Filtrage par catégorie
            if shouldKeep and self.selectedCategory then
                if not addonTable.Database:MatchCategoryByItemID(itemID, self.selectedCategory) then
                    shouldKeep = false
                end
            end

            -- Filtrage par métier
            if shouldKeep and self.selectedProfession then
                if not addonTable.Database:MatchProfessionByItemID(itemID, self.selectedProfession) then
                    shouldKeep = false
                end
            end

            -- Filtrage par étiquettes (Multi)
            if shouldKeep and self.selectedLabels and next(self.selectedLabels) then
                if not addonTable.Database:MatchLabelsByItemID(itemID, self.selectedLabels) then
                    shouldKeep = false
                end
            end
            
            if shouldKeep then
                keptNodes = keptNodes + 1
            else
                table.insert(nodesToRemove, node)
            end
        end
    end
    
    -- Retirer les nodes
    if #nodesToRemove > 0 then
        for _, node in ipairs(nodesToRemove) do
            dataProvider:Remove(node)
        end
        if addonTable.Debug then
            -- addonTable.Debug:Log(keptNodes .. " items affichés (" .. #nodesToRemove .. " masqués)")
        end
    end

    -- 3. Fin du processus : Réinitialiser le bouton
    if self.searchButton then
        self.searchButton:SetText("Filtrer")
        self.searchButton:Enable()
    end
    
    if self.loadingPopup then self.loadingPopup:Hide() end
    
    addonTable.UI.isFiltering = false -- Reset flag
end

-- Helper pour afficher les clés d'une table
function addonTable.UI:GetTableKeys(tbl)
    local keys = {}
    for k, _ in pairs(tbl) do
        table.insert(keys, tostring(k))
    end
    return keys
end

-- Hook pour le menu contextuel sur les lignes de recettes
function addonTable.UI:HookContextMenu(scrollBox)
    if not scrollBox then return end
    
    -- On hook OnDataRangeChanged pour capturer les frames créées (Update)
    hooksecurefunc(scrollBox, "Update", function(self)
        self:ForEachFrame(function(frame)
            if not frame.HousingHDVHooked then
                frame:HookScript("OnMouseDown", function(self, button)
                    if button == "RightButton" then
                        -- Récupérer l'élément de données associé
                        if self.GetElementData then
                            local elementData = self:GetElementData()
                            local data = elementData.option or elementData
                            if data and data.itemID then
                                addonTable.UI:ShowLabelManagementPopup(data.itemID, data.name)
                            end
                        end
                    end
                end)
                frame.HousingHDVHooked = true
            end
        end)
    end)
end

-- Fenêtre Popup de Gestion des Étiquettes
if not HousingHDVLabelPopup then
    -- 1. Masque Modal (Fond noir semi-transparent qui prend tout l'écran)
    local mask = CreateFrame("Frame", nil, UIParent)
    mask:SetAllPoints(UIParent)
    mask:SetFrameStrata("DIALOG")
    mask:SetFrameLevel(100) -- Niveau élevé
    mask:EnableMouse(true) -- Capture les clics
    -- Ajouter une texture sombre
    mask.texture = mask:CreateTexture(nil, "BACKGROUND")
    mask.texture:SetAllPoints()
    mask.texture:SetColorTexture(0, 0, 0, 0.6) -- Noir 60% opacité
    mask:Hide()
    
    -- Si on clique sur le masque, on ferme tout (comme une modale standard)
    mask:SetScript("OnMouseDown", function()
        if HousingHDVLabelPopup then
            HousingHDVLabelPopup:Hide()
        end
    end)

    -- 2. La Popup elle-même
    local popup = CreateFrame("Frame", "HousingHDVLabelPopup", UIParent, "BackdropTemplate")
    popup:SetSize(420, 280) -- Plus large pour le bouton, plus haut pour la liste
    popup:SetPoint("CENTER")
    popup:SetFrameStrata("DIALOG")
    popup:SetFrameLevel(101) -- Au-dessus du masque
    
    popup.Mask = mask -- Attacher réf
    
    popup:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Gold-Border", -- Bordure Or
        tile = true, tileSize = 32, edgeSize = 32,
        insets = { left = 11, right = 12, top = 12, bottom = 11 }
    })
    popup:SetBackdropColor(0, 0, 0, 1) -- Fond noir 100% OPAQUE
    popup:SetBackdropBorderColor(1, 1, 1, 1)
    popup:EnableMouse(true)

    popup:SetScript("OnShow", function() mask:Show() end)
    popup:SetScript("OnHide", function() mask:Hide() end)
    
    popup:Hide()
    
    -- Header Background (Style "Haut de page")
    local headerBg = popup:CreateTexture(nil, "ARTWORK")
    headerBg:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Header")
    headerBg:SetWidth(400) -- Taille du header texture
    headerBg:SetHeight(64)
    headerBg:SetPoint("TOP", 0, 12)
    
    -- Titre
    local title = popup:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge") -- Titre plus grand
    title:SetPoint("TOP", 0, -5) -- Ajusté pour le header
    title:SetText("Gérer les Étiquettes")
    popup.title = title
    
    -- Nom de l'objet (Sous-titre élégant)
    local itemName = popup:CreateFontString(nil, "OVERLAY", "GameFontHighlightMedium")
    itemName:SetPoint("TOP", title, "BOTTOM", 0, -10)
    itemName:SetText("Nom de l'objet")
    popup.itemName = itemName
    
    -- Zone d'ajout centrée
    -- Groupe total : Input (200) + Espace (8) + Bouton (90) = 298px
    -- On centre le tout en décalant le premier élément (Input) vers la gauche
    
    -- Champ de saisie
    local editBox = CreateFrame("EditBox", nil, popup, "InputBoxTemplate")
    editBox:SetSize(200, 24)
    editBox:SetPoint("TOP", itemName, "BOTTOM", -49, -20) -- Décalé pour centrer le groupe
    editBox:SetAutoFocus(true)
    popup.editBox = editBox
    
    -- Bouton Ajouter
    local addButton = CreateFrame("Button", nil, popup, "UIPanelButtonTemplate")
    addButton:SetSize(90, 24)
    addButton:SetPoint("LEFT", editBox, "RIGHT", 8, 0)
    addButton:SetText("Ajouter")
    popup.addButton = addButton
    
    -- Séparateur Orné
    local separator = popup:CreateTexture(nil, "ARTWORK")
    separator:SetTexture("Interface\\Common\\UI-TooltipDivider-Transparent") -- Ligne élégante
    separator:SetHeight(8)
    separator:SetPoint("TOPLEFT", 20, -100)
    separator:SetPoint("TOPRIGHT", -20, -100)
    
    -- ScrollFrame pour la liste des étiquettes interactives
    local scrollFrame = CreateFrame("ScrollFrame", "HousingHDVPopupScrollFrame", popup, "UIPanelScrollFrameTemplate")
    scrollFrame:SetPoint("TOPLEFT", 20, -115) -- Sous le séparateur
    scrollFrame:SetPoint("BOTTOMRIGHT", -40, 45)
    
    local scrollChild = CreateFrame("Frame")
    scrollChild:SetSize(260, 100)
    scrollFrame:SetScrollChild(scrollChild)
    popup.scrollChild = scrollChild
    
    -- Bouton Fermer
    local closeButton = CreateFrame("Button", nil, popup, "UIPanelButtonTemplate")
    closeButton:SetSize(100, 22)
    closeButton:SetPoint("BOTTOM", 0, 15)
    closeButton:SetText("Fermer")
    closeButton:SetScript("OnClick", function() popup:Hide() end)
    
    addonTable.UI.LabelPopup = popup
end

function addonTable.UI:ShowLabelManagementPopup(itemID, name)
    local popup = self.LabelPopup
    popup.itemID = itemID
    
    popup.itemName:SetText(name or "Objet Inconnu")
    popup.editBox:SetText("")
    
    local function RefreshLabels()
        local labels = addonTable.Database:GetLabelsForItem(itemID)
        
        -- Nettoyer les anciens frames
        if not popup.labelFrames then popup.labelFrames = {} end
        for _, f in pairs(popup.labelFrames) do f:Hide() end
        
        local currentY = 0
        local index = 1
        
        for _, l in ipairs(labels) do
            local f = popup.labelFrames[index]
            if not f then
                f = CreateFrame("Frame", nil, popup.scrollChild, "BackdropTemplate")
                f:SetSize(280, 24) -- Un peu plus haut pour l'élégance
                
                -- Fond sombre/alterné pour la ligne
                f.bg = f:CreateTexture(nil, "BACKGROUND")
                f.bg:SetAllPoints()
                f.bg:SetColorTexture(0.2, 0.2, 0.2, 0.3) -- Gris sombre par défaut
                
                -- Highlight au survol
                f:SetScript("OnEnter", function(self) self.bg:SetColorTexture(0.4, 0.4, 0.4, 0.5) end)
                f:SetScript("OnLeave", function(self) 
                    -- Reset couleur alternée (voir boucle update)
                    if self.isOdd then
                         self.bg:SetColorTexture(0.1, 0.1, 0.1, 0.3)
                    else
                         self.bg:SetColorTexture(0.2, 0.2, 0.2, 0.3)
                    end
                end)
                
                f.text = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
                f.text:SetPoint("LEFT", 8, 0)
                
                -- Bouton Supprimer (X)
                f.delBtn = CreateFrame("Button", nil, f, "UIPanelCloseButton")
                f.delBtn:SetSize(20, 20) -- Un peu plus grand pour être cliquable
                f.delBtn:SetPoint("RIGHT", -2, 0)
                f.delBtn:SetScript("OnClick", function(self)
                   local parentLabel = self:GetParent().labelName
                   if parentLabel then
                       addonTable.Database:RemoveCustomLabel(popup.itemID, parentLabel)
                       RefreshLabels()
                       -- Rafraîchir la fenêtre principale si ouverte pour voir le changement immédiat
                       if HousingHDVLabelSelector and HousingHDVLabelSelector:IsShown() then
                            -- TODO: Un moyen plus propre de refresh ?
                            -- Pour l'instant on force le refresh en fermant/rouvrant (rapide ou hacky)
                            -- Ou mieux : appeler RefreshLabelList s'il est exposé (il est local pour l'instant)
                       end
                   end
                end)
                
                popup.labelFrames[index] = f
            end
            
            f:Show()
            f:SetPoint("TOPLEFT", 0, -currentY)
            f.labelName = l.name
            
            -- Alternance couleur fond
            f.isOdd = (index % 2 == 1)
            if f.isOdd then
                 f.bg:SetColorTexture(0.1, 0.1, 0.1, 0.3) -- Ligne plus sombre
            else
                 f.bg:SetColorTexture(0.2, 0.2, 0.2, 0.3) -- Ligne plus claire
            end
            
            if l.isCustom then
                f.text:SetText(l.name .. "  |cFF00FF00(Perso)|r") -- Indication plus propre
                f.delBtn:Show()
            else
                f.text:SetText(l.name)
                f.delBtn:Hide()
            end
            
            currentY = currentY + 25 -- Hauteur ligne + espace
            index = index + 1
        end
        
        popup.scrollChild:SetSize(260, currentY)
    end
    
    popup.addButton:SetScript("OnClick", function()
        local text = popup.editBox:GetText()
        if text and text ~= "" then
            addonTable.Database:AddCustomLabel(itemID, text)
            RefreshLabels()
            popup.editBox:SetText("")
            -- TODO : Rafraîchir bouton "Étiquettes" si besoin
        end
    end)
    
    popup.editBox:SetScript("OnEnterPressed", function()
        popup.addButton:Click()
    end)

    RefreshLabels()
    popup:Show()
end


--[[
	Krowi's Tutorials License
        Copyright ©2020-2022 The contents of this library, excluding third-party resources, are
        copyrighted to their authors with all rights reserved.

        This library is free to use and the authors hereby grants you the following rights:

        1. 	You may make modifications to this library for private use only, you
            may not publicize any portion of this library. The only exception being you may
            upload to the github website.

        2. 	Do not modify the name of this library, including the library folders.

        3. 	This copyright notice shall be included in all copies or substantial
            portions of the Software.

        All rights not explicitly addressed in this license are reserved by
        the copyright holders.
]]

--[[
	API Information

	Tutorial Arguments
	---------------------------
		SavedVariables ..... The table that is used in the .toc file for the SavedVariables
		Key ................ The variable name that will be used to save the last viewed page index
		Icon ............... [Optional] Path to image (tga or blp). Default is '?'-mark.
		Font ............... [Optional] Font name to be used. Default is default game font (GameFontHighlight).

	Tutorial Functions
	------------------
		New ................ Creates a new tutorial frame.
		SetPages ........... Sets the pages the tutorial contains.
		AddPage ............ Adds a single page to the tutorial.
		Reset .............. Resets the tutorial so when it opens it will be on the first page.
		ShowTutorial ....... Shows the tutorial on the set page.
		SetFrameTitle ...... [Optional] Sets the title at the top of the tutorial window. Will be overwritten if a page has a 'Title' defined.
		SetFrameWidth ...... [Optional] Sets the internal frame width (without borders). Default is 512 + 20. Allows for 512 wide images to have some space between image and borders.
							            Will be overwritten if a page has a 'Width' defined.
		SetCloseButtonHook . [Optional] Hooks a function to the closing of the tutorial.
		SetImageSize ....... [Optional] Set the image size for all pages.
		SetImageMargin ..... [Optional] Set the image margins for all pages.
		SetTextSize ........ [Optional] Set the text size for all pages.
		SetTextMargin ...... [Optional] Set the text margins for all pages.

	Page Arguments (All these arguments can also be declared on Tutorial level)
	--------------
		Point .............. [Optional] Used in Tutorial:SetPoint. Default is "CENTER".
		RelativeFrame ...... [Optional] Used in Tutorial:SetPoint. Default is "UIParent".
		RelativePoint ...... [Optional] Used in Tutorial:SetPoint. Default is "CENTER".
		OffsetX ............ [Optional] Used in Tutorial:SetPoint. Default is 0.
		OffsetY ............ [Optional] Used in Tutorial:SetPoint. Default is 0.
		Title .............. [Optional] Overwrites SetFrameTitle for the specific page. Default is 'Tutorial'.
		Width .............. [Optional] Overwrites SetFrameWidth for the specific page.
		Image .............. [Optional] Image path (tga or blp). Default is none.
		ImageSize .......... [Optional] {Width, Height} of the image. Default is {0, 0}.
		ImageTexCoord ...... [Optional] {Left, Right, Top, Bottom}. See https://wowpedia.fandom.com/wiki/API_Texture_SetTexCoord. Default is {0, 1, 0, 1}.
		ImageMargin ........ [Optional] {Left, Top, Right, Bottom} margins of the image. Default is {0, 0, 0, 0}.
		Text ............... [Optional] Text string. Dsiplayed under Image if provided.
		TextSize ........... [Optional] {Width, Height} of the text area. Auto Width/Height if default. Default is {0, 0}.
		TextMargin ......... [Optional] {Left, Top, Right, Bottom} margins of the text area. Default is {0, 0, 0, 0}.
		Shine .............. [Optional] The frame to anchor the flashing "look at me!" glow.
		ShineAll ........... [Optional] Set ShineTop, ShineBottom, ShineLeft, ShineRight to the same value, can be overwritten by the invidual arguments or ShineWidth and ShineHeight.
		ShineWidth ......... [Optional] Set ShineLeft, ShineRight to the same value, can be overwritten by the invidual arguments.
		ShineHeight ........ [Optional] Set ShineTop, ShineBottom to the same value, can be overwritten by the invidual arguments.
		ShineTop ........... [Optional] Top offset.
		ShineBottom ........ [Optional] Bottom offset.
		ShineLeft .......... [Optional] Left offset.
		ShineRight ......... [Optional] Right offset.

	Not Used Right Now
	------------------
		editbox ............ [Optional] Edit box text string (directing value). Edit box is out of content flow.
		editboxWidth ....... [Optional] Default is 400.
		editboxLeft, editboxBottom
		button ............. [optional] Button text string (directing value). Button is out of content flow.
		buttonWidth ........ Default is 100.
		buttonClick ........ Function with button's click action.
		buttonLeft, buttonBottom
--]]

local lib = LibStub:NewLibrary('Krowi_Tutorials-2.1', 1);

if not lib then
	return;
end

local default = {
	-- editboxWidth = 400,
	-- buttonWidth = 100,

	Point = "CENTER",
	RelativeFrame = UIParent,
	RelativePoint = "CENTER",
	OffsetX = 0,
	OffsetY = 0,
	Width = 50,
	Title = "Tutorial",
	ImageSize = {
		Width = 0,
		Height = 0
	},
	ImageTexCoord = {0, 1, 0, 1},
	ImageMargin = { -- These are the offsets for the frame
		Left = 7,
		Top = 26,
		Right = 9,
		Bottom = 28},
	TextSize = {
		Width = 0,
		Height = 0
	},
	TextMargin = {
		Left = 0,
		Top = 0,
		Right = 0,
		Bottom = 0},
	Layout = "VERTICAL",
}

-- [[ INTERNAL API ]] --

local function Copy_Table(src, dest)
	for index, value in pairs(src) do
		if type(value) == "table" then
			dest[index] = {}
			Copy_Table(value, dest[index])
		else
			dest[index] = value
		end
	end
end

local function UpdateFrame(frame, i)
	local page = frame.Pages[i];

	if not page then
		return;
	end

	-- Set values
	local layout = page.Layout or (frame.Layout or default.Layout);
	local point = page.Point or (frame.Point or default.Point);
	local relativeFrame = page.RelativeFrame or (frame.RelativeFrame or default.RelativeFrame);
	local relativePoint = page.RelativePoint or (frame.RelativePoint or default.RelativePoint);
	local offsetX = page.OffsetX or (frame.OffsetX or default.OffsetX);
	local offsetY = page.OffsetY or (frame.OffsetY or default.OffsetY);
	local width = page.Width or (frame.Width or default.Width);
	local title = page.Title or (frame.Title or default.Title);
	local imageSize = page.ImageSize or (frame.ImageSize or default.ImageSize);
	local imageTexCoord = {};
	Copy_Table(page.ImageTexCoord or (frame.ImageTexCoord or default.ImageTexCoord), imageTexCoord);
	local imageMargin = {};
	Copy_Table(page.ImageMargin or (frame.ImageMargin or {Left = 0, Top = 0, Right = 0, Bottom = 0}), imageMargin);
	imageMargin.Left = imageMargin.Left + default.ImageMargin.Left;
	imageMargin.Top = imageMargin.Top + default.ImageMargin.Top;
	imageMargin.Right = imageMargin.Right + default.ImageMargin.Right;
	imageMargin.Bottom = imageMargin.Bottom + default.ImageMargin.Bottom;
	local textSize = page.TextSize or (frame.TextSize or default.TextSize);
	local textMargin = {};
	Copy_Table(page.TextMargin or (frame.TextMargin or default.TextMargin), textMargin);
	textMargin.Left = textMargin.Left + (page.Image and 0 or imageMargin.Left);
	textMargin.Top = textMargin.Top + (page.Image and 0 or imageMargin.Top);
	textMargin.Right = textMargin.Right + (page.Image and 0 or imageMargin.Right);
	textMargin.Bottom = textMargin.Bottom + (page.Image and 0 or imageMargin.Bottom);

	-- Callbacks
	if page.OnShow then
		page:OnShow();
	end
	if page.OnHide then
		page:OnHide();
	end

	-- Frame
	frame:ClearAllPoints();
	frame:SetPoint(point, relativeFrame, relativePoint, offsetX, offsetY);

	-- Title
	frame.TitleText:SetPoint('TOP', 0, -5);
	frame.TitleText:SetText(title);

	-- Image
	for _, p in next, frame.Pages do
		if p.ImageTex then
			p.ImageTex:Hide();
		end
	end
	if page.Image then
		if page.ImageTex then
			page.ImageTex:Show();
		else
			local image = frame:CreateTexture(); -- Implicitly calls Show
			image:SetPoint("TOPLEFT", frame, imageMargin.Left, -imageMargin.Top);
			image:SetWidth(imageSize.Width);
			image:SetHeight(imageSize.Height);
			image:SetTexture(page.Image);
			image:SetTexCoord(imageTexCoord[1], imageTexCoord[2], imageTexCoord[3], imageTexCoord[4]);
			page.ImageTex = image;
		end
	end
	local fullImageWidth = page.Image and imageMargin.Left + imageSize.Width + imageMargin.Right or 0;
	local fullImageHeight = page.Image and imageMargin.Top + imageSize.Height + imageMargin.Bottom or 0;

	-- Text
	local text = page.Text;
	if page.SubTitle then
		text = page.SubTitle .. "\n\n" .. text;
	end
	local textRelativeFrame = page.Image and page.ImageTex or frame;
	local textRelativePoint = page.Image and (layout == "HORIZONTAL" and "TOPRIGHT" or "BOTTOMLEFT") or "TOPLEFT";
	local textOffsetX = (layout == "HORIZONTAL" and imageMargin.Right - default.ImageMargin.Right or 0) + textMargin.Left;
	local textOffsetY = textMargin.Top + (page.Image and imageMargin.Bottom - default.ImageMargin.Bottom or 0);
	local textWidth = textSize.Width ~= 0 and textSize.Width or max(imageSize.Width, width);
	frame.Text:SetPoint("TOPLEFT", textRelativeFrame, textRelativePoint, textOffsetX, -textOffsetY);
	frame.Text:SetWidth(layout == "HORIZONTAL" and textSize.Width or textWidth - textMargin.Left - textMargin.Right);
	frame.Text:SetText(text);
	local fullTextWidth = text and textMargin.Left + max(textSize.Width, frame.Text:GetWidth()) + textMargin.Right or 0;
	fullTextWidth = fullTextWidth + (layout == "HORIZONTAL" and default.ImageMargin.Right or 0);
	local fullTextHeight = text and textMargin.Top + max(textSize.Height, frame.Text:GetHeight()) + textMargin.Bottom or 0;
	fullTextHeight = fullTextHeight + (layout == "HORIZONTAL" and imageMargin.Top + imageMargin.Bottom or 0); -- imageMargin.Top + imageMargin.Bottom needed as frame offsets

	-- EditBox
	-- if data.editbox then
	-- 	frame.editbox:ClearFocus()
	-- 	frame.editbox:SetWidth(data.editboxWidth)
	-- 	frame.editbox:SetPoint('BOTTOMLEFT', 14 + data.TextX + (data.editboxLeft or 0), 28 + 18 + (data.editboxBottom or 0))
	-- 	frame.editbox:SetText(data.editbox)
	-- 	frame.editbox:Show()
	-- else
	-- 	frame.editbox:Hide()
	-- end

	-- Button
	-- if data.button then
	-- 	frame.button:SetWidth(data.buttonWidth)
	-- 	frame.button:SetPoint('BOTTOMLEFT', 8 + data.TextX + (data.buttonLeft or 0), 28 + 18 + (data.buttonBottom or 0))
	-- 	frame.button:SetText(data.button)
	-- 	frame.button:SetScript('OnClick', data.buttonClick)
	-- 	frame.button:Show()
	-- else
	-- 	frame.button:Hide()
	-- end

	-- Shine
	if page.Shine then
		frame.Shine:SetParent(page.Shine);
		local shineTop, shineBottom, shineLeft, shineRight = 0, 0, 0, 0;

		-- First set All so more specific ones can overwrite
		page.ShineAll = type(page.ShineAll) == "function" and page.ShineAll() or page.ShineAll;
		if page.ShineAll then
			shineTop = page.ShineAll;
			shineBottom = -page.ShineAll;
			shineLeft = -page.ShineAll;
			shineRight = page.ShineAll;
		end

		-- Second set Height and Width so more specific ones can overwrite
		page.ShineHeight = type(page.ShineHeight) == "function" and page.ShineHeight() or page.ShineHeight;
		if page.ShineHeight then
			shineTop = page.ShineHeight;
			shineBottom = -page.ShineHeight;
		end

		page.ShineWidth = type(page.ShineWidth) == "function" and page.ShineWidth() or page.ShineWidth;
		if page.ShineWidth then
			shineLeft = -page.ShineWidth;
			shineRight = page.ShineWidth;
		end

		-- Lastly set Top, Bottom, Left, Right since these are the most specific ones
		page.ShineTop = type(page.ShineTop) == "function" and page.ShineTop() or page.ShineTop;
		if page.ShineTop then
			shineTop = page.ShineTop;
		end

		page.ShineBottom = type(page.ShineBottom) == "function" and page.ShineBottom() or page.ShineBottom;
		if page.ShineBottom then
			shineBottom = page.ShineBottom;
		end

		page.ShineLeft = type(page.ShineLeft) == "function" and page.ShineLeft() or page.ShineLeft;
		if page.ShineLeft then
			shineLeft = page.ShineLeft;
		end

		page.ShineRight = type(page.ShineRight) == "function" and page.ShineRight() or page.ShineRight;
		if page.ShineRight then
			shineRight = page.ShineRight;
		end

		frame.Shine:SetPoint('BOTTOMRIGHT', shineRight, shineBottom);
		frame.Shine:SetPoint('TOPLEFT', shineLeft, shineTop);
		frame.Shine:Show();
		frame.Flash:Play();
	else
		frame.Flash:Stop();
		frame.Shine:Hide();
	end

	-- Buttons
	if i == frame.MinPage then
		frame.Prev:Disable();
	else
		frame.Prev:Enable();
	end
	frame.PageNum:SetText(("%d/%d"):format(i, frame.MaxPage))
	if i < frame.MaxPage then
		frame.Next:Enable();
	else
		frame.Next:Disable();
	end

	-- Frame
	frame:SetWidth(layout == "HORIZONTAL" and fullImageWidth + fullTextWidth or max(fullImageWidth, fullTextWidth));
	frame:SetHeight(layout == "HORIZONTAL" and max(fullImageHeight, fullTextHeight) or fullImageHeight + fullTextHeight);
	frame.ShownIndex = i;
	frame:Show();

	frame.SavedVariables[frame.Key].PageViewed[i] = true;
	page.IsViewed = true;
end

local function NewButton(frame, name, texName, direction)
	local button = CreateFrame("Button", nil, frame);
	button:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight");
	local buttonTex = "Interface\\Buttons\\UI-SpellbookIcon-%sPage-%s";
	button:SetDisabledTexture(buttonTex:format(texName, "Disabled"));
	button:SetPushedTexture(buttonTex:format(texName, "Down"));
	button:SetNormalTexture(buttonTex:format(texName, "Up"));
	button:SetPoint("BOTTOM" .. ((direction == -1) and "LEFT" or "RIGHT"), -(30 * direction), 2);
	button:SetSize(26, 26);
	button:SetScript("OnClick", function()
		UpdateFrame(frame, frame.ShownIndex + direction);
	end)

	local text = button:CreateFontString(nil, nil, "GameFontHighlightSmall");
	text:SetText(name);
	text:SetPoint("LEFT", -(13 + text:GetStringWidth() / 2) * direction, 0);

	return button;
end

local function FrameOnHide(self)
	self.Flash:Stop()
	self.Shine:Hide()
end

local function ApplyElvUISkin(frame)
	if ElvUI == nil then
		return;
	end

	local engine = unpack(ElvUI);
	local blizzardSkins = engine.private.skins.blizzard;
	local tutorials = blizzardSkins.enable and blizzardSkins.tutorials;

	if not tutorials then
		return;
	end

	local skins = engine:GetModule("Skins");

	frame:StripTextures();
	frame:CreateBackdrop("Transparent");

	skins:HandleCloseButton(frame.CloseButton);
	skins:HandleNextPrevButton(frame.Prev, "left");
	skins:HandleNextPrevButton(frame.Next, "right");
end

local function FixSizeTable(size)
	if size then
		local newSize = {};
		newSize.Width = size.Width or size[1];
		newSize.Height = size.Height or size[2];
		return newSize;
	end
end

local function FixMarginTable(margin)
	if margin == nil then
		return;
	end

	local newMargin = {};
	if type(margin) == "table" then
		newMargin.Left = margin.Left or margin[1];
		newMargin.Top = margin.Top or margin[2];
		newMargin.Right = margin.Right or (margin[3] or margin[1] + 2);
		newMargin.Bottom = margin.Bottom or (margin[4] or margin[2]);
	elseif type(margin) == "number" then
		newMargin.Left = margin;
		newMargin.Top = margin;
		newMargin.Right = margin;
		newMargin.Bottom = margin;
	else
		return;
	end

	return newMargin;
end

local function FindFirstNotViewed(self)
	local found;
	for i = 1, #self.Pages, 1 do
		if not self.SavedVariables[self.Key].PageViewed[i] then
			found = i;
			return i;
		end
	end
	return found;
end

local function GetNextBase2(number)
	return math.pow(2, ceil(log(number) / log(2)))
end

local function FixImageTexCoord(self)
	if self.ImageTexCoord then
		return;
	end
	local width = self.ImageSize[1];
	local height = self.ImageSize[2];
	local right = width / GetNextBase2(width);
	local bottom = height / GetNextBase2(height);
	self.ImageTexCoord = {0, right, 0, bottom};
end

local function FixTextSize(self)
	if self.Layout == nil or self.TextSize then
		return;
	end
	local width = self.ImageSize[1];
	width = width * 1.5;
	self.TextSize = {width, 0};
end

-- [[ EXTERNAL API ]] --

local numFrames = 0; -- Local ID for naming, starts at 0 and will increment if a new frame is added

lib.__index = lib; -- Used to support OOP like code
function lib:New(key, savedVariables, icon, font)
	-- Increment ID
	numFrames = numFrames + 1;

	-- Create frame
	local frame = CreateFrame("Frame", "Krowi_Tutorial" .. numFrames, UIParent, "ButtonFrameTemplate");
	setmetatable(frame, setmetatable(lib, getmetatable(frame)));

	-- Set portrait and background
	frame.portrait:SetPoint("TOPLEFT", icon and -4 or -3, icon and 6 or 5);
	frame.portrait:SetTexture(icon or "Interface\\TutorialFrame\\UI-HELP-PORTRAIT");
	frame.Inset:SetPoint("TOPLEFT", 4, -23);
	frame.Inset.Bg:SetColorTexture(0, 0, 0);

	-- Reserve a table for the images (loaded lazy only when shown), see UpdateFrame for loading
	frame.Images = {};

	-- Text
	frame.Text = frame:CreateFontString(nil, nil, "GameFontHighlight");
	if font then
		frame.Text:SetFont(font, 12);
	end
	frame.Text:SetJustifyH("LEFT");

	-- Buttons
	frame.Prev = NewButton(frame, PREVIOUS, "Prev", -1);
	frame.Next = NewButton(frame, NEXT, "Next", 1);

	-- Page Number
	frame.PageNum = frame:CreateFontString(nil, nil, "GameFontHighlightSmall");
	frame.PageNum:SetPoint("BOTTOM", 0, 10);

	-- Frame settings
	frame:SetFrameStrata("DIALOG");
	frame:SetClampedToScreen(true);
	frame:EnableMouse(true);
	frame:SetToplevel(true);
	frame:SetScript("OnHide", FrameOnHide);

	-- frame.editbox = CreateFrame("EditBox", nil, frame, "InputBoxTemplate")
	-- frame.editbox:SetHeight(20)
	-- frame.editbox:SetAutoFocus(false)
	-- frame.editbox:Hide()

	-- frame.button = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
	-- frame.button:SetSize(100, 22)
	-- frame.button:SetPoint("CENTER")
	-- frame.button:Hide()

	-- Shine
	frame.Shine = CreateFrame("Frame", nil, frame, "BackdropTemplate");
	frame.Shine:SetBackdrop({edgeFile = "Interface\\TutorialFrame\\UI-TutorialFrame-CalloutGlow", edgeSize = 16});
	for i = 1, frame.Shine:GetNumRegions() do
		select(i, frame.Shine:GetRegions()):SetBlendMode("ADD");
	end

	-- Flashing animation of the Shine
	local flash = frame.Shine:CreateAnimationGroup();
	flash:SetLooping("BOUNCE");
	frame.Flash = flash;

	local anim = flash:CreateAnimation("Alpha");
	anim:SetDuration(.75);
	anim:SetFromAlpha(.7);
	anim:SetToAlpha(0);

	-- Set frame variables
	frame.SavedVariables = savedVariables
	frame.Key = key;
	if frame.SavedVariables[frame.Key] == nil then
		frame.SavedVariables[frame.Key] = {}; -- First time creation
	end
	if frame.SavedVariables[frame.Key].PageViewed == nil then
		frame.SavedVariables[frame.Key].PageViewed = {}; -- First time creation
	end
	if ElvUI then -- Set these here because ElvUI will otherwise put a function in this
		frame.Point = default.Point;
		frame.Width = default.Width;
	end

	ApplyElvUISkin(frame);

	frame:Hide();

	return frame;
end

function lib:SetFrameTitle(title)
	self.Title = title;
end

function lib:SetFrameWidth(width)
	self.Width = width;
end

function lib:SetPages(pages)
	self.Pages = pages;

	for i, _ in next, pages do
		pages[i].IsViewed = self.SavedVariables[self.Key].PageViewed[i];
		FixImageTexCoord(pages[i]);
		FixTextSize(pages[i]);
		pages[i].ImageMargin = FixMarginTable(pages[i].ImageMargin);
		pages[i].ImageSize = FixSizeTable(pages[i].ImageSize);
		pages[i].TextMargin = FixMarginTable(pages[i].TextMargin);
		pages[i].TextSize = FixSizeTable(pages[i].TextSize);
	end
end

function lib:AddPage(page)
	if self.Pages == nil then
		self.Pages = {};
	end

	tinsert(self.Pages, page);
	page.IsViewed = self.SavedVariables[self.Key].PageViewed[#self.Pages];
	FixImageTexCoord(page);
	FixTextSize(page);
	page.ImageMargin = FixMarginTable(page.ImageMargin);
	page.ImageSize = FixSizeTable(page.ImageSize);
	page.TextMargin = FixMarginTable(page.TextMargin);
	page.TextSize = FixSizeTable(page.TextSize);
end

function lib:SetImageMargin(margin)
	self.ImageMargin = FixMarginTable(margin);
end

function lib:SetImageSize(size)
	self.ImageSize = FixSizeTable(size);
end

function lib:SetTextMargin(margin)
	self.TextMargin = FixMarginTable(margin);
end

function lib:SetTextSize(size)
	self.TextSize = FixSizeTable(size);
end

function lib:SetCloseButtonHook(func)
	if self then
		self:SetScript("OnHide", function(self)
			FrameOnHide(self);
			func();
		end);
	end
end

function lib:Reset()
	self.SavedVariables[self.Key].PageViewed = {};
	if self.Pages ~= nil then
		for i, _ in next, self.Pages do
			self.Pages[i].IsViewed = false;
		end
	end	
	self:Hide();
end

local locked; -- Used to prevent multiple trigers if ShowTutorial is hooked in other places
function lib:ShowTutorial(index, minPage, maxPage)
	if locked then
		return;
	end

	locked = true;

	local firstNotViewed = FindFirstNotViewed(self) or 1;
	index = index or firstNotViewed;

	self.MinPage = minPage or 1;
	self.MaxPage = maxPage or #self.Pages;
	UpdateFrame(self, index);

	locked = nil;
end

function lib:HasUnviewedPages()
	local firstNotViewed = FindFirstNotViewed(self);
	return firstNotViewed ~= nil;
end
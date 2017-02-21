/*---------------------------------------------------------------------------
	
	Creator: TheCodingBeast - TheCodingBeast.com
	This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License. 
	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/
	
---------------------------------------------------------------------------*/

local function MotdFrame()

	local Frame = vgui.Create( "DFrame" )
	Frame:SetSize( ScrW() - 100, ScrH() - 150 )
	Frame:SetTitle( "" )
	Frame:SetVisible( true )
	Frame:SetDraggable( false )
	Frame:ShowCloseButton( false )
	Frame:MakePopup()
	Frame:Center()
	Frame.Paint = function()

		draw.RoundedBox( 0, 0, 0, Frame:GetWide()-0, Frame:GetTall()-0, Color( 50, 50, 50, 255 ) )
		draw.RoundedBox( 0, 2, 2, Frame:GetWide()-4, Frame:GetTall()-4, Color( 75, 75, 75, 255 ) )

	end

	local ButtonPanel = vgui.Create( "DPanel", Frame )
	ButtonPanel:SetPos( 2, 2 )
	ButtonPanel:SetSize( 300, ScrH()-154 )
	ButtonPanel.Paint = function()

		draw.RoundedBox( 0, 0, 0, ButtonPanel:GetWide(), ButtonPanel:GetTall(), Color( 60, 60, 60, 255 ) )

		draw.RoundedBox( 0, 0, 0, ButtonPanel:GetWide(), 50, Color( 55, 55, 55, 255) )

		draw.DrawText( ServerName, "CloseCaption_Bold", ButtonPanel:GetWide()/2+1, 10+1, Color( 0, 0, 0, 255 ), 1 )
		draw.DrawText( ServerName, "CloseCaption_Bold", ButtonPanel:GetWide()/2+0, 10+0, Color( 255, 255, 255, 255 ), 1 )

	end

	local HtmlPanel = vgui.Create( "DPanel", Frame )
	HtmlPanel:SetPos( 302, 2 )
	HtmlPanel:SetSize( Frame:GetWide() - 304, Frame:GetTall() - 4 )
	HtmlPanel.Paint = function() end

	local Close = vgui.Create( "DButton", ButtonPanel )
	Close:SetPos( 10, ButtonPanel:GetTall()-42 )
	Close:SetSize( ButtonPanel:GetWide() - 20, 32 )
	Close:SetText( "" )
	Close.Hover = false
	Close.OnCursorEntered 	= function() Close.Hover = true end
	Close.OnCursorExited	= function() Close.Hover = false end
	Close.DoClick = function() Frame:Close() end
	Close.Paint = function()

		draw.RoundedBox( 0, 0, 0, Close:GetWide()-0, Close:GetTall()-0, Color( 180, 0, 0, 255 ) )
		draw.RoundedBox( 0, 2, 2, Close:GetWide()-4, Close:GetTall()-4, Color( 140, 0, 0, 255 ) )

		if Close.Hover then
			draw.RoundedBox( 0, 2, 2, Close:GetWide()-4, Close:GetTall()-4, Color( 150, 0, 0, 255 ) )
		end

		draw.DrawText( "Close", "Trebuchet24", Close:GetWide()/2+1, 4+1, Color( 0, 0, 0, 255 ), 1 )
		draw.DrawText( "Close", "Trebuchet24", Close:GetWide()/2+0, 4+0, Color( 255, 255, 255, 255 ), 1 )

	end

	local HtmlBackground = vgui.Create( "DPanel", HtmlPanel )
	HtmlBackground:SetPos( 10, 10 )
	HtmlBackground:SetSize( HtmlPanel:GetWide() - 20, HtmlPanel:GetTall() - 20 )
	HtmlBackground.Paint = function()

		draw.RoundedBox( 0, 0, 0, HtmlBackground:GetWide(), HtmlBackground:GetTall(), Color( 0, 0, 0, 200 ) )

		draw.DrawText( "Loading Website ...", "Trebuchet24", HtmlBackground:GetWide()/2+1, HtmlBackground:GetTall()/2+1, Color( 0, 0, 0, 255), 1 )
		draw.DrawText( "Loading Website ...", "Trebuchet24", HtmlBackground:GetWide()/2+0, HtmlBackground:GetTall()/2+0, Color( 255, 255, 255, 255), 1 )

	end

	local HtmlFrame = vgui.Create( "DHTML", HtmlPanel )
	HtmlFrame:SetPos( 12, 12 )
	HtmlFrame:SetSize( HtmlPanel:GetWide() - 24, HtmlPanel:GetTall() - 24 )

	local MotdButtonY = 62
	local MotdButtonI = 0

	for k,v in pairs(MotdButtons) do

		local MotdButton = vgui.Create( "DButton", ButtonPanel )
		MotdButton:SetPos( 10, MotdButtonY )
		MotdButton:SetSize( ButtonPanel:GetWide() - 20, 60 )
		MotdButton:SetText( "" )
		MotdButton.Hover 	= false
		MotdButton.OnCursorEntered 	= function() MotdButton.Hover = true end
		MotdButton.OnCursorExited	= function() MotdButton.Hover = false end
		MotdButton.DoClick = function() HtmlFrame:OpenURL( v['url'] ) end
		MotdButton.Paint = function()

		draw.RoundedBox( 0, 0, 0, MotdButton:GetWide()-0, MotdButton:GetTall()-0, Color( 75, 75, 75, 255 ) )
		draw.RoundedBox( 0, 2, 2, MotdButton:GetWide()-4, MotdButton:GetTall()-4, Color( 90, 90, 90, 255 ) )

		if MotdButton.Hover then
			draw.RoundedBox( 0, 2, 2, MotdButton:GetWide()-4, MotdButton:GetTall()-4, Color( 100, 100, 100, 255 ) )
		end

		draw.DrawText( v['txt'], "CloseCaption_Bold", MotdButton:GetWide()/2+1, 16+1, Color( 0, 0, 0, 255 ), 1 )
		draw.DrawText( v['txt'], "CloseCaption_Bold", MotdButton:GetWide()/2+0, 16+0, Color( 255, 255, 255, 255 ), 1 )

		end

		if MotdButtonI == 0 then
			HtmlFrame:OpenURL( v['url'] )
		end

		MotdButtonY = MotdButtonY + 60 + 8
		MotdButtonI = MotdButtonI + 1

	end 


end
usermessage.Hook( "TcbMotd", MotdFrame )
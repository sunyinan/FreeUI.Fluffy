CharacterBag0Slot:Hide()
CharacterBag1Slot:Hide()
CharacterBag2Slot:Hide()
CharacterBag3Slot:Hide()


----------------------------------------------------------------------------------------
--	Force readycheck warning
----------------------------------------------------------------------------------------
local ShowReadyCheckHook = function(self, initiator)
	if initiator ~= "player" then
		PlaySound("ReadyCheck", "Master")
	end
end
hooksecurefunc("ShowReadyCheck", ShowReadyCheckHook)

----------------------------------------------------------------------------------------
--	Force other warning
----------------------------------------------------------------------------------------
local ForceWarning = CreateFrame("Frame")
ForceWarning:RegisterEvent("UPDATE_BATTLEFIELD_STATUS")
ForceWarning:RegisterEvent("PET_BATTLE_QUEUE_PROPOSE_MATCH")
ForceWarning:RegisterEvent("LFG_PROPOSAL_SHOW")
ForceWarning:RegisterEvent("RESURRECT_REQUEST")
ForceWarning:SetScript("OnEvent", function(self, event)
	if event == "UPDATE_BATTLEFIELD_STATUS" then
		for i = 1, GetMaxBattlefieldID() do
			local status = GetBattlefieldStatus(i)
			if status == "confirm" then
				PlaySound("PVPTHROUGHQUEUE", "Master")
				break
			end
			i = i + 1
		end
	elseif event == "PET_BATTLE_QUEUE_PROPOSE_MATCH" then
		PlaySound("PVPTHROUGHQUEUE", "Master")
	elseif event == "LFG_PROPOSAL_SHOW" then
		PlaySound("ReadyCheck", "Master")
	elseif event == "RESURRECT_REQUEST" then
		PlaySoundFile("Sound\\Spells\\Resurrection.wav", "Master")
	end
end)

----------------------------------------------------------------------------------------
--	Misclicks for some popups
----------------------------------------------------------------------------------------
StaticPopupDialogs.RESURRECT.hideOnEscape = nil
StaticPopupDialogs.AREA_SPIRIT_HEAL.hideOnEscape = nil
StaticPopupDialogs.PARTY_INVITE.hideOnEscape = nil
StaticPopupDialogs.PARTY_INVITE_XREALM.hideOnEscape = nil
StaticPopupDialogs.CONFIRM_SUMMON.hideOnEscape = nil
StaticPopupDialogs.ADDON_ACTION_FORBIDDEN.button1 = nil
StaticPopupDialogs.TOO_MANY_LUA_ERRORS.button1 = nil
PetBattleQueueReadyFrame.hideOnEscape = nil
PVPReadyDialog.leaveButton:Hide()
PVPReadyDialog.enterButton:ClearAllPoints()
PVPReadyDialog.enterButton:SetPoint("BOTTOM", PVPReadyDialog, "BOTTOM", 0, 25)








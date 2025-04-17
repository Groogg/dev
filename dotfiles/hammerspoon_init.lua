-- Set up Option+1 to launch Firefox
local function launchFirefox()
	local firefox = hs.application.get("Firefox")
	if firefox then
		firefox:activate()
	else
		hs.application.open("Firefox")
	end
end

-- Set up Option+2 to launch Ghostty
local function launchGhostty()
	local ghostty = hs.application.get("Ghostty")
	if ghostty then
		ghostty:activate()
	else
		hs.application.open("Ghostty")
	end
end

-- Set up Option+3 to launch Zed
local function launchZed()
	local zed = hs.application.get("Zed")
	if zed then
		zed:activate()
	else
		hs.application.open("Zed")
	end
end

-- Set up Option+4 to launch Slack
local function launchSlack()
	local slack = hs.application.get("Slack")
	if slack then
		slack:activate()
	else
		hs.application.open("Slack")
	end
end

-- Bind all the hotkeys
hs.hotkey.bind({ "alt" }, "1", launchFirefox)
hs.hotkey.bind({ "alt" }, "2", launchGhostty)
hs.hotkey.bind({ "alt" }, "3", launchZed)
hs.hotkey.bind({ "alt" }, "4", launchSlack)

-- Add a simple notification to confirm config loaded
hs.notify.new({ title = "Hammerspoon", informativeText = "Config loaded successfully with all app shortcuts" }):send()

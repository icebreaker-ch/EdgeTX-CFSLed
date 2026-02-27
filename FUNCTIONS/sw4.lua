local CFSBlink = loadfile("/SCRIPTS/CFSBLINK/cfsblink.lua")()

local led = CFSBlink.new("SW4", CFSBlink.RED, CFSBlink.BLACK, CFSBlink.RED)

return { run=function() led:run() end, background=function() led:background() end }

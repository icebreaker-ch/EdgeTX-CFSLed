local CFSBlink = {}
CFSBlink.__index = CFSBlink

CFSBlink.STATE = {
    OFF = 0,
    BLINK = 1
}

CFSBlink.BLACK = { 0x00, 0x00, 0x00 }
CFSBlink.WHITE = { 0xFF, 0xFF, 0xFF }
CFSBlink.RED = { 0xFF, 0x00, 0x00 }
CFSBlink.GREEN = { 0x00, 0xFF, 0x00 }
CFSBlink.BLUE = { 0x00, 0x00, 0xFF }
CFSBlink.YELLOW = { 0xFF, 0xFF, 0x00 }
CFSBlink.MAGENTA = { 0xFF, 0x00, 0xFF }
CFSBlink.CYAN = { 0x00, 0xFF, 0xFF }

function CFSBlink.new(name, offColor, blinkOffColor, blinkOnColor, blinkOffTime, blinkOnTime)
    local self = setmetatable({}, CFSBlink)
    self.name = name
    self.offColor = offColor or CFSBlink.BLACK
    self.blinkOffColor = blinkOffColor or CFSBlink.BLACK
    self.blinkOnColor = blinkOnColor or CFSBlink.WHITE
    self.blinkOffTime = blinkOffTime or 50
    self.blinkOnTime = blinkOnTime or 50
    self.state = CFSBlink.STATE.OFF
    self.lastTime = 0
    self.ledOn = false
    return self
end

function CFSBlink:updateColor(rgb)
    setCFSLedColor(self.name, rgb[1], rgb[2], rgb[3])
end

function CFSBlink:update()
    if self.state == CFSBlink.STATE.OFF then
        self:updateColor(self.offColor)
    elseif self.state == CFSBlink.STATE.BLINK then
        local time = getTime()
        if self.ledOn and time - self.lastTime > self.blinkOnTime then
            self.lastTime = time
            self.ledOn = false
            self:updateColor(self.blinkOffColor)
        elseif not self.ledOn and time - self.lastTime > self.blinkOffTime then
            self.lastTime = time
            self.ledOn = true
            self:updateColor(self.blinkOnColor)
        end
    end
end

function CFSBlink:background()
    self.state = CFSBlink.STATE.OFF
    self:update()
end

function CFSBlink:run()
    self.state = CFSBlink.STATE.BLINK
    self:update()
end

return CFSBlink
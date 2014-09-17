local awful = require("awful")
local wibox = require("wibox")

volumecfg = {}
volumecfg.cardid  = 0
volumecfg.channel = "Master"
--volumecfg.widget = widget({ type = "textbox", name = "volumecfg.widget", align = "right" })

volumecfg.vol_layout = wibox.layout.fixed.horizontal()
local volumecfg_widget = wibox.widget.textbox()
volumecfg_widget:set_align("right")
local vol_icon = wibox.widget.imagebox()
vol_icon:set_image("/home/gmas/Downloads/sm4tik-icon-pack/png/spkr_01.png")
volumecfg.vol_layout:add(volumecfg_widget)
volumecfg.vol_layout:add(vol_icon)
volumecfg.vol_layout:buttons(awful.util.table.join(
       awful.button({ }, 4, function () volumecfg.up() end),
       awful.button({ }, 5, function () volumecfg.down() end),
       awful.button({ }, 1, function () volumecfg.toggle() end)
))

local log = function (msg)
       local logger = io.open("awesome.log", "a")
       logger:write(msg,"\n")
       logger:close()
end

volumecfg.mixercommand = function (command)
       -- command must start with a space!
       local fd = io.popen("amixer " .. command)
       local status = fd:read("*all")
       fd:close()
       -- log("----------------","\n")
       -- log("status: " .. status)
       if status == "" then
         -- log("no status, returning")
         return
       end
       local volume = string.match(status, "(%d?%d?%d)%%")
       volume = string.format("% 3d", volume)
       status = string.match(status, "%[(o[^%]]*)%]")
       if string.find(status, "on", 1, true) then
               volume = volume .. ""
       else   
               volume = volume .. "M"
       end
       local volume_value = " <span color='black' background='grey'> " .. volume .. " </span>"
       volumecfg_widget:set_text(volume)
end
volumecfg.update = function ()
       volumecfg.mixercommand(" sget " .. volumecfg.channel)
end
volumecfg.up = function ()
       volumecfg.mixercommand(" sset " .. volumecfg.channel .. " 5%+")
end
volumecfg.down = function ()
       volumecfg.mixercommand(" sset " .. volumecfg.channel .. " 5%-")
end
volumecfg.toggle = function ()
       volumecfg.mixercommand(" sset " .. volumecfg.channel .. " toggle")
end
volumecfg.update()


-- timer to update volume widget
local volume_timer = timer({ timeout = 1 })
volume_timer:connect_signal("timeout", function () volumecfg.update() end)
volume_timer:start()

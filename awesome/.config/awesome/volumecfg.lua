local awful = require("awful")
local wibox = require("wibox")

volumecfg = {}
volumecfg.cardid  = 0
volumecfg.channel = "Master"
--volumecfg.widget = widget({ type = "textbox", name = "volumecfg.widget", align = "right" })
volumecfg_widget = wibox.widget.textbox()
volumecfg_widget:set_align("right")
--volumecfg_widget:set_name("volumecfg_widget")
-- command must start with a space!
volumecfg.mixercommand = function (command)
       local fd = io.popen("amixer " .. command)
       local status = fd:read("*all")
       fd:close()
       local volume = string.match(status, "(%d?%d?%d)%%")
       volume = string.format("% 3d", volume)
       status = string.match(status, "%[(o[^%]]*)%]")
--
--       local log = io.open("awesome.log", "w")
--       log:write("volume:", volume, "\n")
--       log:write("status:", status, "\n")
--       log:close()
--
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
volumecfg_widget:buttons(awful.util.table.join(
       awful.button({ }, 4, function () volumecfg.up() end),
       awful.button({ }, 5, function () volumecfg.down() end),
       awful.button({ }, 1, function () volumecfg.toggle() end)
))
volumecfg.update()

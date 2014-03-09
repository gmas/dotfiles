local awful = require("awful")
local wibox = require("wibox")

volume_widget = wibox.widget.textbox()
volume_widget:set_align("right")

function update_volume(widget)
   local fd = io.popen("amixer sget Master")
   local status = fd:read("*all")
   fd:close()

   local volume = tonumber(string.match(status, "(%d?%d?%d)%%"))
   -- volume = string.format("% 3d", volume)
   --local log = io.open("awesome.log", "w")
   --log:write("volume:", volume, "\n")
   --log:close()
   
   status = string.match(status, "%[(o[^%]]*)%]")

   local volume_value = ""
   if string.find(status, "on", 1, true) then
       volume_value = " <span color='black' background='grey'> " .. volume .. "% </span>"
   else
       volume_value = " <span color='red' background='grey'> M </span>"
   end
   widget:set_markup(volume_value)
end

update_volume(volume_widget)

mytimer = timer({ timeout = 1 })
mytimer:connect_signal("timeout", function () update_volume(volume_widget) end)
mytimer:start()

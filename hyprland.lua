local active_border_color = { colors = { "rgba(c6f36bee)", "rgba(55d8ffff)" }, angle = 45 }
local inactive_border_color = "rgb(25304a)"

hl.config({
  general = {
    col = {
      active_border = active_border_color,
      inactive_border = inactive_border_color,
    },
  },
  group = {
    col = {
      border_active = active_border_color,
      border_inactive = inactive_border_color,
    },
  },
  decoration = {
    rounding = 6,
    rounding_power = 3,
  },
})

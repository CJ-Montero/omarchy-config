-- Change the default Omarchy look'n'feel.

hl.config({
  general = {
    gaps_in = 3,
    gaps_out = 5,
    border_size = 2,
  },

  decoration = {
    -- Keep all windows opaque.
    active_opacity = 1.0,
    inactive_opacity = 1.0,
    fullscreen_opacity = 1.0,

    -- Round window corners.
    rounding = 8,
  },
})

-- Make dwindle/tiling rearrangements glide instead of snapping to their
-- destination.  This only overrides the stock "windows" animation.
hl.curve("softTiling", { type = "bezier", points = { { 0.25, 0.1 }, { 0.25, 1 } } })
hl.animation({ leaf = "windows", enabled = true, speed = 4.5, bezier = "softTiling" })

-- Slide and subtly fade when changing workspace without a full-screen sweep.
hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "softTiling", style = "slidefade 15%" })

-- https://wiki.hypr.land/Configuring/Basics/Variables/#decoration
-- hl.config({
--   decoration = {
--     -- Use round window corners.
--     rounding = 8,
--
--     -- Dim unfocused windows (0.0 = no dim, 1.0 = fully dimmed).
--     dim_inactive = true,
--     dim_strength = 0.15,
--   },
-- })

-- https://wiki.hypr.land/Configuring/Basics/Variables/#animations
-- hl.config({
--   animations = {
--     -- Disable all animations.
--     enabled = false,
--   },
-- })

-- https://wiki.hypr.land/Configuring/Basics/Variables/#layout
-- hl.config({
--   layout = {
--     -- Avoid overly wide single-window layouts on wide screens.
--     single_window_aspect_ratio = { 1, 1 },
--   },
-- })

-- https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/
-- hl.config({
--   scrolling = {
--     -- See only one column per screen instead of two.
--     column_width = 0.97,
--   },
-- })

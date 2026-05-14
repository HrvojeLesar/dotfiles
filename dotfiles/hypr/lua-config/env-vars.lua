hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("DOTOOL_XKB_LAYOUT", "hr")

hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_QPA_PLATFORM", "wayland; xcb")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")

-- Some nvidia vars)
hl.env("GBM_BACKEND", "nvidia - drm")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
-- hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("WLR_DRM_NO_ATOMIC", "1")
-- hl.env(" __GL_VRR_ALLOWED", "1")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("__NV_PRIME_RENDER_OFFLOAD", "1")
hl.env("__VK_LAYER_NV_optimus", "NVIDIA_only")

hl.env("WLR_NO_HARDWARE_CURSORS", "1")
hl.env("WLR_RENDERER_ALLOW_SOFTWARE", "1")

-- nvidia firefox)
hl.env("MOZ_DISABLE_RDD_SANDBOX", "1")
hl.env("EGL_PLATFORM", "wayland")
hl.env("NVD_BACKEND", "direct")
hl.env("GSK_RENDERER", "ngl")

hl.env("TERMINAL", "ghostty")

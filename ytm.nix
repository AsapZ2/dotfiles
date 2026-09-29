{ pkgs, config, inputs, ... }:


{
  home.packages = [
    inputs.ytm-player.packages.${pkgs.system}.default
    pkgs.mpv
    pkgs.yt-dlp
  ];

  # 2. Hauptkonfiguration (config.toml) anlegen
  home.file.".config/ytm-player/config.toml".text = ''
    [general]
    startup_page = "search"
    playback_bar_position = "bottom"

    [playback]
    audio_quality = "high"
    autoplay = true
    gapless = true
    seek_step = 5
    default_volume = 70
    prefer_audio = true
    resume_on_launch = true
    history_min_listen_seconds = 5
    sync_history_to_ytmusic = true

    [cache]
    enabled = true
    max_size_mb = 2048 # Generöser 2GB Cache für flüssiges Umschalten
    prefetch_next = true

    [search]
    predictive = true

    max_history = 20

    [ui]
    album_art = false
    progress_style = "line"
    sidebar_width = 20
    col_index = 0                # 0 = auto-fill width
    col_title = 0                # 0 = auto-fill
    col_artist = 0               # 0 = auto-fill
    col_album = 0
    theme = "ansi-dark"

    [theme]
    active_tab = "#ffffff"
    inactive_tab = "#ffffff"
    progress_filled = "#b300b3"
    playback_bar_bg = "#1a161d"



  '';
}

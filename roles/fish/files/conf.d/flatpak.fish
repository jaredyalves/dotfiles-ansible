# Check if flatpak command exists
if command -v flatpak >/dev/null
    # Set paths for flatpak installations
    set -ga fish_user_paths ~/.local/share/flatpak/exports/bin /var/lib/flatpak/exports/bin
    set -gx --path XDG_DATA_DIRS ~/.local/share/flatpak/exports/share

    # Add paths for each flatpak installation
    for install_dir in (flatpak --installations)
        set -gxa XDG_DATA_DIRS $install_dir/exports/share
    end

    # Add additional default paths
    set -gxa XDG_DATA_DIRS /usr/local/share /usr/share
end

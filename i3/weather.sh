airport=eddw
temp="$(weather -m $airport | grep Temperature | grep -oE [0-9]+)°C"
sky="$(weather -m $airport | grep Sky | cut -c 20-)"

case "$sky" in
    "clear"*)
        icon=""
        ;;
    "mostly clear"*)
        icon=""
        ;;
    "partly cloudy"*)
        icon=""
        ;;
    "mostly cloudy"*)
        icon=""
        ;;
    "cloudy"*)
        icon=""
        ;;
    *)
        icon=$sky
        ;;
esac

echo "$icon  $temp"


local bin="/data/local/tmp/exogame"
local prop="$bin/prop"
$AXFUN
local cek_id=$(storm "https://reiii3.github.io/EXOGAME/user/beta.txt")
local cek_beta=$(echo "$cek_id" | grep -q "$AXERONID" && echo true || echo false)
import axeron.prop
. $prop
echo -n "  $name | "
sleep 0.2
if [ "$cek_beta" = true ]; then
   echo "Beta Version $betver"
else
   echo "Full Version $ver"
fi

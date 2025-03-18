local bin="/data/local/tmp/exogame"
local prop="$bin/prop"
local adjust="[Penyesuaian] :"
local new="[New] :"
local des="[Deskripsi] :"
local war="[Warning] :"
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
echo
if [ $cek_beta = true ]; then
  echo "   ┌[Exo] New Update Beta Version"
  echo "   └┬$new AI System By Modules Foxver Auto"
  echo "    ├─$des System pintar yang dapat "
  echo "    │mengaktikan mode secara otomatis"
  echo "    ├─$war Masih Dalam pengembangan, "
else
  echo "Tesss"
fi
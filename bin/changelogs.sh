local bin="/data/local/tmp/exogame"
local prop="$bin/prop"
local adjust="[Penyesuaian] :"
local new="[New] :"
local war="[Warning] :"
local p="[-]"
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
  echo "  ┌[Exo] New Update Beta Version"
  echo "  └┬$new AI System By Modules Foxver Auto"
  echo "   ├$new Compiler System Game"
  echo "   ├$new AOT Compiler Just Balanced Compiler"
  echo "   ├$war Masih Dalam pengembangan, "
  echo "   └$adjust -System Modules"
  echo "                    -Render Selection"
else
  echo "  ┌[Exo] Feature Full Version
  └┬$p Render Selection
   ├$p Compiler Game
   └$p Driver Game"
fi
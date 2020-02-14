alias ralias='source $HOME/.bash_aliases'

alias get_esp32='export PATH=$PATH:$HOME/workspace/bt_gsmr/xtensa-esp32-elf/bin'
alias set_idf='export IDF_PATH=$HOME/workspace/bt_gsmr/ESP32/esp-idf'
alias anyr='cd $HOME/workspace/bt_gsmr/ESP32/anyr && get_esp32 && set_idf'

function function_exists() {
  declare -f -F $1 > /dev/null
  return $?
}

# decimal, binary, hexadecimal transformation
bin2dec()
{
  echo "ibase=2; $1" | bc -l
}

dec2bin()
{
  echo "obase=2; $1" | bc -l
}

dec2hex()
{
  for e in $*; do
    echo "obase=16; $e" | bc -l
  done
}
hex2dec()
{
  for e in $*; do
    echo "ibase=16; $(echo $e | tr 'a-z' 'A-Z')" | bc -l
  done
}

hex2bin()
{
  for e in $*; do
    echo "ibase=16; obase=2; $(echo $e | tr 'a-z' 'A-Z')" | bc -l
  done
}

bin2hex()
{
  echo "obase=16; ibase=2; $1" | bc -l
}

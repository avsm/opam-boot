set -x # debug

OCAML_VERSION=4.02.1
OPAM_VERSION=1.2.1

case "$OCAML_VERSION,$OPAM_VERSION" in
4.00.1,1.2.0) ppa=avsm/ocaml40+opam12 ;;
4.01.0,1.2.0) ppa=avsm/ocaml41+opam12 ;;
4.02.1,1.2.0) ppa=avsm/ocaml42+opam12 ;;
4.02.1,1.2.1) ppa=avsm/ppa-opam-experimental ;;
*) echo Unknown $OCAML_VERSION,$OPAM_VERSION; exit 1 ;;
esac

case "$MODE" in
ocaml)
  echo "yes" | sudo add-apt-repository ppa:$ppa
  sudo apt-get update -qq
  sudo apt-get install -qq ocaml ocaml-native-compilers camlp4-extra
  ;;
opam)
  echo "yes" | sudo add-apt-repository ppa:$ppa
  sudo apt-get update -qq
  sudo apt-get install -qq ocaml ocaml-native-compilers camlp4-extra opam
  ;;
*)
  echo No installation actions needed
  ;;
esac
  
git clone git://github.com/mirage/ocaml-github
cp opam-boot ocaml-github
OBJ=`pwd`/_obj
mkdir -p ${OBJ}
cd ocaml-github

./opam-boot build github --obj ${OBJ}
. ${OBJ}/opam-env.sh
which git-jar

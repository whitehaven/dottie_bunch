printf "\n"

printf "# Project Status @ $( git describe )\n"
printf "\n"
printf "## Completed ##\n"
ag --hidden --ignore ./.git/ --ignore ./compile_project_status.sh --ignore ./project_status.md  DONE .

printf "\n"
printf "##    Bugs   ##\n"
ag --hidden --ignore ./.git/ --ignore ./compile_project_status.sh --ignore ./project_status.md  FIXME .

printf "\n"
printf "##    Todo   ##\n"
ag --hidden --ignore ./.git/ --ignore ./compile_project_status.sh --ignore ./project_status.md  TODO .

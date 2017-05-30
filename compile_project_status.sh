printf "# Project Status @ $( git describe )\n"

printf "## completed:\n"
printf "\`\n"
ag --hidden --ignore ./.git/ --ignore ./compile_project_status.sh --ignore ./project_status.md  DONE .
printf "\`\n"

printf "## bugs:\n"
printf "\`\n"
ag --hidden --ignore ./.git/ --ignore ./compile_project_status.sh --ignore ./project_status.md  FIXME .
printf "\`\n"

printf "## todo:\n"
printf "\`\n"
ag --hidden --ignore ./.git/ --ignore ./compile_project_status.sh --ignore ./project_status.md  TODO .
printf "\`\n"

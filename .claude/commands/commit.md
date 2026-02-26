Revisa los cambios staged y unstaged con `git diff` y `git status`, analiza la diff completa, y crea un commit siguiendo estas reglas:

- Conventional Commits: `tipo(scope): mensaje`
- En inglés
- Máximo 96 caracteres
- Sin `Co-Authored-By`
- Si no hay cambios, no hagas nada
- Añade al staging solo los archivos relevantes (no uses `git add -A`)
- Usa un HEREDOC para el mensaje del commit

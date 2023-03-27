### General

- [0] Las opciones interactivas (confirmaciones en cli, apertura del browser)
  son interesantes, pero idealmente deberían ser opcionales para permitir que
  los scripts se ejecuten de manera desatendida.

### pipeline.sh

- [0] L22: La solución es muy elegante, pero hay ciertos riesgos en gestionar el
  software dentro de scripts (por ejemplo, el usuario tiene que tener conda
  instalado y activado). Por lo general se recomiendo desacoplar la gestión de
  software del código de análisis.
- [0] L22: El comando `STAR` es con mayúsculas, por lo que el script siempre
  intenta instalarlo
- [-0.5] L36: `data/contaminants` no existe en el repositorio

### log.sh

- [0] L4: Tendría más sentido que el log final estuviera en la raiz o en `log/`

### bonus

- [+0.5]: comprobaciones md5

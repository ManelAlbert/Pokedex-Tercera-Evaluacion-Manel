# Pokedex Tercera Evaluación Manel

Proyecto de Pokédex moderna para la tercera evaluación.

## Mejoras y cambios realizados

- **Base de datos:**
  - Se corrigieron errores de sintaxis en los scripts SQL.
  - Se añadieron y corrigieron las habilidades de los Pokémon en la tabla `habilidades`.
  - Se revisaron los tipos de Pokémon para evitar errores de clave foránea.
  - Se verificó y corrigió la URL de los sprites para Pokémon como Fennekin y Fuecoco.
  - Se añadió la relación entre Pokémon y habilidades usando `habilidad_id`.

- **Frontend (HTML/CSS/JS):**
  - Se modernizó el diseño con CSS avanzado (glassmorphism, responsivo, animaciones).
  - Se mejoró el formulario de búsqueda, permitiendo filtrar por nombre, generación, tipo y habilidad.
  - Se añadió un selector de tipo y se preparó el código para selector de habilidad.
  - Se muestra el número de Pokédex, tipos y la habilidad de cada Pokémon en los resultados.
  - Se añadió un footer con créditos y enlaces.
  - Se mejoró la accesibilidad y la experiencia de usuario.

- **Backend (PHP):**
  - Se mejoró el archivo `buscar.php` para permitir filtrar por tipo y habilidad.
  - Se hace JOIN con la tabla de habilidades para mostrar el nombre de la habilidad en los resultados.
  - Se devuelve toda la información relevante en formato JSON para el frontend.

- **Solución de errores:**
  - Se explicó y solucionó el problema de los errores de clave foránea al insertar Pokémon con tipos no existentes.
  - Se revisó el código para asegurar que los sprites y habilidades se muestran correctamente.

---

Estoy haciendo pruebas con macOS y con git, ¡estoy flipando con esto!  
Hola Lydia :)
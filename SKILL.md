---
name: efecto
description: Agrega a un video vertical donde hablas a cámara cualquiera de 42 efectos de video (órbita, reflector, widgets de vidrio, línea de tiempo, lista, muro de titulares, comentario, abanico de teléfonos, gráfica de vidrio, corte de noticias, interruptores del iPhone, letrero LED y más). Los efectos siguen tu cara y pueden ir detrás de tu cabeza. Úsala cuando el usuario escriba /efecto, nombre uno de los efectos o pida agregar un efecto, zoom, color, sticker o animación a su video.
---

# efecto: 42 efectos de video

Casi siempre el usuario no es técnico. Responde corto y amable, haz el trabajo por él y nunca le pidas que corra comandos.

Todas las rutas de abajo son relativas a la carpeta de esta skill (donde está este SKILL.md). En los comandos usa su ruta absoluta.

## 1. La primera vez: preparar (una sola vez)
Corre `bash scripts/setup.sh`. Imprime `READY` cuando termina (la primera vez tarda de 1 a 3 minutos).
- `NEED_FFMPEG`: instálalo por él. En Mac: `brew install ffmpeg` (si falta `brew`, dile que instale Homebrew desde brew.sh). En Windows: `winget install ffmpeg`.
- `NEED_PYTHON`: instala Python 3.12 (Mac: `brew install python@3.12`, Windows: `winget install Python.Python.3.12`) y vuelve a correr setup.
- En Windows, el Python está en `.venv\Scripts\python.exe` en lugar de `.venv/bin/python`.

## 2. El video y el efecto
- Video: el usuario lo arrastra al chat o da una ruta. Funciona mejor un video vertical de teléfono.
- Efecto: el de `/efecto <nombre>`, o el que describa. Busca sus palabras en la tabla de abajo. ¿No está claro? Enséñale la lista.

## 3. Encontrar el momento
- Si dice «en la palabra X» o «cuando digo...», corre `.venv/bin/python scripts/words.py <video>` y usa esos tiempos.
- Si no da tiempos, aplica el efecto a todo el clip o pregunta en qué parte (una pregunta corta).
- Las ventanas cortas se ven mejor: de 1.5 a 4 segundos por efecto.

## 4. Borrador, revisión y render
1. Escribe el plan junto a su video como `<nombre-del-video>_efectos.json` (el campo `fx` lleva el nombre del efecto):
   ```json
   {"effects": [
     {"fx": "orbita", "start": 3.2, "end": 6.0},
     {"fx": "palabra-atras", "start": 14.0, "end": 16.3, "text": "CLAUDE"}
   ]}
   ```
2. Revisa cuadros primero (rápido): `.venv/bin/python scripts/fx.py --plan <plan.json> <video> <carpeta>/revision.png --still 4.5,15.2`, a la mitad de cada efecto. Mira tú los PNG. Corrige texto, tiempos u opciones si algo se ve mal (tapa la cara, se corta en la orilla, no se lee).
3. Render: `.venv/bin/python scripts/fx.py --plan <plan.json> <video> <nombre-del-video>_efectos.mp4`. Conserva su audio original. Sale en 1080p; agrega `--width 2160` para 4K (más lento).
4. Dile dónde quedó el archivo y recuérdale en una línea que lo vea antes de publicarlo: tú haces el borrador, él aprueba.

Un solo efecto no necesita plan: `.venv/bin/python scripts/fx.py orbita <video> <salida.mp4> --start 3 --end 6 --text "..." --opt clave=valor`.

## Los 42 efectos
| # | Comando | Qué hace | Opciones (todas opcionales) |
|---|---|---|---|
| 1 | `ruido` | Tus reels se apilan detrás de tu cabeza, uno cada cuarto de segundo | `images` (carpeta de capturas o clips), `size` |
| 2 | `fila` | Fichas numeradas se abren en abanico sobre tu cabeza | `text` (nombres separados con `\|`) |
| 3 | `en-la-mira` | Esquinas que se fijan en tu cara y la cámara te sigue | `zoom` (1.35 por defecto), `text` (etiqueta) |
| 4 | `orbita` | Tus reels giran alrededor de tu cabeza: delante abajo, detrás arriba | `images`, `count`, `speed`, `size` |
| 5 | `zoom-rapido` | Un acercamiento rápido en una palabra | `zoom` (1.45 por defecto, máximo 2), `speed` |
| 6 | `palabra-atras` | Una palabra gigante cae detrás de ti | `text`, `color` (hex), `font` (`bold` o `serif`) |
| 7 | `reflector` | Apaga las luces y te deja iluminado | `text` (palabra que brilla detrás de ti), `color`, `push` |
| 8 | `ticket` | Imprime tus instrucciones como un ticket en la pared sobre tu cabeza | `text` (líneas con `\|`) |
| 9 | `tono` | Una corrección de color con ambiente | `grade` (`moody`, `bw`, `warm`, `cool`, `pop`) |
| 10 | `antes-despues` | Una barra de antes y después te barre | `grade` (el look del «después») |
| 11 | `pendientes` | Una lista junto a tu cabeza que se palomea mientras hablas | `text` (puntos con `\|`), `ticks` (segundos del video con `\|`), `title` |
| 12 | `comentario` | La hoja de comentarios de Instagram escribe tu palabra, la publica, recibe un corazón y tu respuesta | `text` (EFECTO por defecto), `handle`, `reply`, `chip` |
| 13 | `seguir` | Aparece un botón Seguir y cambia a Siguiendo | `at` (segundo del cambio), `x`, `y` (de 0 a 1), `color` |
| 14 | `pausa` | Congela el cuadro y te señala con una flecha a mano | `text` (etiqueta), `color`, `label_x` |
| 15 | `desinstalar` | Una barra de desinstalación con glitch rompe la imagen | `text` |
| 16 | `marco-reel` | Tu video se encoge dentro de una tarjeta de reel | `text` (tu @) |
| 17 | `lluvia-de-teclas` | Teclas del teclado llueven detrás de ti | `text` (teclas con `\|`), `count` |
| 18 | `sello` | Un sello rojo enorme cae sobre la pantalla | `text`, `color`, `angle`, `y` |
| 19 | `cuenta-regresiva` | Un reloj de 3, 2, 1 sobre tu cabeza | `from` |
| 20 | `tunel` | La imagen se mete en sí misma, girando | `ratio`, `speed`, `spin` |
| 21 | `portada` | Te vuelves portada de revista, con el título detrás de tu cabeza | `text` (título), `lines` (con `\|`), `issue`, `color` |
| 22 | `garabatos` | Garabatos de marcador se dibujan solos a tu alrededor | `text` (etiqueta), `color` |
| 23 | `widgets` | Widgets de vidrio y mini artifacts flotan alrededor de tu cabeza, con la pastilla Editado por Claude | `text` (número grande), `sub`, `name`, `handle`, `song`, `day`, `date`, `event`, `look` (`simple` para la versión de 3 widgets) |
| 24 | `collage-rojo` | Tú en blanco y negro, una palabra roja gigante detrás y tres frases que caen | `text` (palabra roja), `lines` (con `\|`), `tag`, `lines_y` (altura de las frases, de 0 a 1) |
| 25 | `titular-dividido` | Una tarjeta con titular baja y te empuja a la mitad de abajo | `text` (líneas con `\|`), `hl` (palabra resaltada), `pill` |
| 26 | `palabra-pastel` | Fondo lavanda, palabra gigante detrás y una tarjeta de perfil que recibe un follow | `text`, `name`, `handle` |
| 27 | `pastillas` | Cuarto de cuadrícula, tus reels detrás y un cursor que da clic en pastillas azules | `text` (pastillas con `\|`), `images` |
| 28 | `linea-de-tiempo` | Color rojo de cine con una línea de tiempo de edición, contador REC y cabezal brillante | `text` (título), `sub`, `tc` |
| 29 | `titular` | Un acercamiento con un titular de dos líneas, la segunda en un recuadro blanco | `text` (líneas con `\|`), `zoom` |
| 30 | `muro-de-perfil` | La cuadrícula de tu perfil llena la pared detrás de ti y un contador sube | `images`, `count`, `label`, `name` |
| 31 | `ranking` | Aparece un tier list y Claude vuela al nivel S | `title`, `item`, `others` |
| 32 | `broll` | B-roll arriba con una etiqueta de precio, tú abajo | `images`, `text` (etiqueta) |
| 33 | `abanico` | Tus reels se abren como una mano de teléfonos bajo un titular | `images`, `text` (líneas con `\|`) |
| 34 | `puntos` | Tu toma se arma con puntos brillantes y luego aparece completa | `color`, `cell` |
| 35 | `muro-de-titulares` | Los titulares de tus reels se apilan detrás de tu cabeza y aparece tu total | `text` (`titular::dato\|...`), `total`, `label` |
| 36 | `lista` | Una lista de tareas de Claude bajo tu barbilla: cada paso gira y se palomea en verde | `text` (`paso::dato\|...`), `title` |
| 37 | `grafica` | Una tarjeta de vidrio bajo tu barbilla: una gráfica verde sube y el número cuenta | `text` (etiqueta), `from`, `to` (por ejemplo `197K`, `59%`), `color` |
| 38 | `carrusel` | Tus reels giran a tu alrededor en un carrusel 3D y frenan | `images`, `count`, `size`, `turns` |
| 39 | `corte` | Páginas de noticias cortan en una palabra, fija en un recuadro rojo detrás de tu cabeza | `text` (la palabra, Claude por defecto), `color` |
| 40 | `interruptores` | Una tarjeta de ajustes del iPhone enciende sus interruptores, una línea a la vez | `text` (filas con `\|`), `ticks` (segundos con `\|`), `color` |
| 41 | `letrero` | Se bajan las luces y un letrero LED se escribe solo detrás de ti | `text` (líneas con `\|`), `color`, `push` |
| 42 | `acercamiento-lento` | Un acercamiento lento de cine a tu cara mientras el cuarto se desenfoca | `zoom` (1.6 por defecto), `blur` |

**Looks con nombre** (el mismo efecto con un look más elaborado; no cuentan aparte):
- `reflector-dorado` = `reflector` con `look=sparkle`: el cuarto se oscurece, salen rayos dorados detrás de tu cabeza, una palabra dorada grande con un brillo que la cruza, destellos y un halo a tu alrededor. `text` (la palabra), `color`, `push`.
- `portada-editorial` = `portada` con `look=editorial`: look de película cálido, cabecera serif clásica detrás de tu cabeza, línea de edición y frases elegantes. `text` (cabecera), `issue`, `lines` (3 líneas con `\|`), `right` (líneas con `\|`), `color`, `accent`, `lines_y`, `right_y`.
- `panel-de-vidrio` = `grafica` con `look=bento`: la gráfica sube en una pantalla de vidrio ahumado detrás de tu cabeza, con fichas de vidrio delante de ti (dona, KPI, barras). `text`, `from`, `to`, `donut` (`29%::etiqueta`), `kpi` (`672K::etiqueta`), `bars` (`197\|140\|124::etiqueta`).
- `interruptores` va arriba de ti, metido detrás de tu cabeza, con un zoom suave (`pos=below` para la tarjeta bajo la barbilla; `overlap`, `zoom`).


## Reglas
- Nunca tapes la cara. Todo va detrás de la persona o la esquiva solo; si un cuadro de revisión todavía muestra texto sobre la cara, muévelo (`x`, `y`) o acorta el texto.
- Los efectos corren en el orden del plan. Pon primero los de cámara (`en-la-mira`, `zoom-rapido`, `reflector`) cuando se encimen con otros.
- El zoom nunca pasa de 2x, para que el video siga nítido.
- Si la cara queda muy abajo en el cuadro, los textos bajo la barbilla pueden caer en la zona de la caption de Instagram: recorta el video para subirla (por ejemplo `crop=916:1628:82:180,scale=1080:1920` con ffmpeg) antes de aplicar el efecto.
- La skill solo agrega imagen. Los efectos de sonido y los subtítulos los pone el usuario.
- Son versiones iniciales. Sé honesto si el usuario las compara con un reel que vio.

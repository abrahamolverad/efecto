# efecto: 42 efectos de video para Claude Code, en español

Sube tu video a Claude Code, escribe `/efecto` y el nombre de un efecto. Esa es toda la edición.

Basada en [claude-video-effects](https://github.com/Vibha-Ramprakash/claude-video-effects) de [@vibha.in.progress](https://instagram.com/vibha.in.progress) (licencia MIT). Esta versión traduce los comandos, los textos de pantalla y la guía al español.

## Instalación (una línea)

Abre la Terminal (o la terminal dentro de Claude Code) y pega:

```bash
git clone https://github.com/abrahamolverad/efecto ~/.claude/skills/efecto
```

En Windows (PowerShell), usa `$HOME\.claude\skills\efecto` en lugar de `~/.claude/skills/efecto`.

Reinicia Claude Code y listo.

> ¿No sabes cómo? Abre Claude Code y pega: **«Instala la skill de github.com/abrahamolverad/efecto en ~/.claude/skills/efecto»**. Claude lo hace por ti.

## Cómo se usa

1. Abre Claude Code (la app o la terminal).
2. Arrastra tu video al chat.
3. Escribe el efecto que quieres:

```
/efecto orbita del segundo 3 al 6
/efecto reflector cuando digo "apaga las luces", con la palabra CLAUDE detrás de mí
/efecto comentario al final, escribiendo EFECTO
/efecto widgets los primeros 3 segundos
```

La primera vez, Claude se prepara solo (unos 2 minutos). Necesita `ffmpeg` y Python, y los instala si faltan.

Claude revisa primero algunos cuadros, corrige lo que tape tu cara y luego renderiza `tuvideo_efectos.mp4` junto a tu original. Tu audio queda igual.

Puedes juntar varios: *«Pon en-la-mira del 6 al 10, luego orbita del 10 al 13 y un sello cuando digo "no"».*

## Los 42 efectos

`ruido`, `fila`, `en-la-mira`, `orbita`, `zoom-rapido`, `palabra-atras`, `reflector`, `ticket`, `tono`, `antes-despues`, `pendientes`, `comentario`, `seguir`, `pausa`, `desinstalar`, `marco-reel`, `lluvia-de-teclas`, `sello`, `cuenta-regresiva`, `tunel`, `portada`, `garabatos`, `widgets`, `collage-rojo`, `titular-dividido`, `palabra-pastel`, `pastillas`, `linea-de-tiempo`, `titular`, `muro-de-perfil`, `ranking`, `broll`, `abanico`, `puntos`, `muro-de-titulares`, `lista`, `grafica`, `carrusel`, `corte`, `interruptores`, `letrero`, `acercamiento-lento`.

Más los looks `reflector-dorado`, `portada-editorial` y `panel-de-vidrio`. La lista con qué hace cada uno y sus opciones está en [SKILL.md](SKILL.md).

## Desde el teléfono

Claude no «ve» video: la skill edita el archivo con código (Python y ffmpeg) en tu computadora. Para usarla desde el iPhone, deja Claude Code abierto en tu Mac con Remote Control (`/remote-control`) y escríbele desde la app de Claude; las sesiones en la nube no ven las skills de tu Mac.

## Créditos y licencia

Efectos originales: Vibha Ramprakash, [claude-video-effects](https://github.com/Vibha-Ramprakash/claude-video-effects) (MIT). Traducción y adaptación al español: Abraham Olvera ([@abrahamolvera.ai](https://www.instagram.com/abrahamolvera.ai/)). Licencia MIT (ver `LICENSE`); fuentes y modelos con sus propias licencias (ver `fonts/` y `models/NOTICE.md`).

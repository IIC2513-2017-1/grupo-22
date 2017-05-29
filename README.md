# README

## LINK A APLICACIÓN
https://arcane-fortress-16941.herokuapp.com/

## Cambios y mejoras en esta entrega
* Diseño web con CSS más trabajado y pulido.
* Mayor uso de partials en las vistas.
* Funciones JS para algunos efectos.
  * Creación topic y comentario móvil (permanece en pantalla)
  * Botón inferior derecho para subir.
* Implementación de resultados para partidos tanto en formato Torneo y Playoffs.
  * Se crea partido, luego se le asigna un resultado.
* Usuario adminitrador de torneo puede armar un calendario de partidos.
* Para formato Torneo se implementó una tabla de posiciones.
* Para formato Playoffs se crearon brackets (no dinámicos, para 8 equipos).
  * Se debe crear un partido, luego editarlo para ubicarlo en los brackets con un código (explicados en la vista de edición),
    y se setea como no jugado. Cuando se haya jugado se edita nuevamente cambiando el atributo played a true y completando la               información solicitada.
  * Los cambios son reversibles en caso necesario (setear partido con played: false).
  * Se deben crear también los partidos al avanzar de ronda para que se vean visualmente, no es automático.
  * El campeón se detecta automáticamente.
* Envío de correo
  * Al crear una cuenta (Sign Up)
  * Al momento de creación de un topic en un foro (se envía al dueño del torneo-foro)
    * No se envia si el usuario que creó el topic es el dueño del torneo-foro.
* Mayor diferenciación de funcionalidades por tipo de usuario.
* Se agregó la posibilidad de subir imagen de perfil a usuarios registrados, caso contrario se muestra foto genérica.
* Más instancias en las seeds para probar funcionalidades nuevas en playoffs y torneos.

## Notas
* Al crear un partido en un torneo, solo se muestra un error genérico. No se logró trasladar los errores producidos en el controlador de matches para que se mostraran en el show del tourney.
* La mayoría de las funciones están diferenciadas por el tipo de usuario (logeado y anónimo) y en general solo puede realziar cambios a las entidades que el usuario logeado en particular creó (es decir, un usuario logeado no puede hacer cambios a algo que pertenece a otro).
  * Es posible se haya pasado alguno por alto
  
## TO-DO/WISH list
* Implementar las funcionalidades de los request
* Seguir mejorando distintas vistas.
* Ver posibilidad de brackets dinámicos.
* Agregar también posibilidad de subir fotos de jugadores y logos en equipos y torneos (no sólo para usuarios)
* Seguir Puliendo y optimizando los HTML y consultas a base de datos
* Definir bien como será la clausura de torneos terminados.

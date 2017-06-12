# README

## LINK A APLICACIÓN
https://arcane-fortress-16941.herokuapp.com/

## Cambios y mejoras en esta entrega
* Diseño web con CSS terminado.
* Uso generalizado partials en las vistas.
* Gran mayoría de las interacciones del usuario con la aplicación se realizan mediante AJAX:
  * Creación, edición y/o eliminación en jugadores, equipos, torneos, partidos, etc.
  * Creación y eliminación de comentarios y topics en los foros.
  * (70% 80& de la funcionalidades estan con AJAX)
* Alta interacción con el DOM, complementario a las interacciones con AJAX.
  * Además, notifaciones customizadas.
  * Al momento de modificar algo en el torneo (equipos, partidos), se actualiza automáticamente lo que se muestra (resultados, posiciones, puntajes, etc).
  * Modals para todos los formularios de creación y edición.
  * Varios tooltips, aunque solo integrados a nivel de navegador (i.e. solo usando el "title")
* Se agregó la posibilidad de subir logos a los equipos, caso contrario se muestra foto genérica
  * Solo dueño de equipo puede realizarlo
* Utilización de scopes en matches. Usados a la hora de calcular puntajes en torneo de puntos.
* Cambios en relación equipos y torneos. Ahora es una relación "has_many :through", lo que permitiría mejor utilización de esta más adelante.
* Restricciones nuevas en torneos. Ahora no se pueden eliminar equipos que ya hayan tenido un partido en el torneo.

## Notas
* Se arregló el error de mostrar errores al crear partidos. Ahora se indica el tipo de error apropiadamente.
* Como siempre, la mayoría de las funciones están diferenciadas por el tipo de usuario (logeado y anónimo) y en general solo puede realziar cambios a las entidades que el usuario logeado en particular creó (es decir, un usuario logeado no puede hacer cambios a algo que pertenece a otro).
  * Es posible se haya pasado alguno por alto
  
## TO-DO/WISH list
* Implementar las funcionalidades de los request
* Agregar brackets de 4 y 16.
* Agregar subir fotos de jugadores.
* Definir bien como será la clausura de torneos terminados.

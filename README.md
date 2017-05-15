# README

## LINK A APLICACIÓN
https://arcane-fortress-16941.herokuapp.com/

## Cambios y mejoras en esta entrega
* Diseño web implementado
* CRUD de foros, topics y comments
  * Un foro asociado es creado automáticamente al crear un torneo.
  * Cualquier usuario logeado puede crear topics/comentarios en un foro.
* Create y destroy de participants (equipos en un torneo).
  * Funcionalidad de agregar equipos a torneo exclusiva del creador del torneo, puede agregar los equipos que quiera.
* Create, destroy e index de matches en un torneo, más las validaciones pertinentes.
  * Errores génericos, ver notas.
* Login, Log-out, Sign up, perfil de usuario y barra de de usuarios.
  * Encriptación de contraseñas
* Diferenciación de funcionalidades por tipo de usuario.

## Notas
* Se cambió el link de la aplicación, al que está indicado al principio de este archivo.
* Seed.rb contiene varias instancias de usuarios (5 al azar + 1 especial), equipos (8 al azar +1 especial), jugadores (30 asignados al azar), un torneo, un partido, un foro, un topico (creados particularmente) y varios comentarios (al azar).
* Al crear un partido en un torneo, solo se muestra un error genérico. No se logró trasladar los errores producidos en el controlador de matches para que se mostraran en el show del tourney.
* La mayoría de las funciones están diferenciadas por el tipo de usuario (logeado y anónimo) y en general solo puede realziar cambios a las entidades que el usuario logeado en particular creó (es decir, un usuario logeado no puede hacer cambios a algo que pertenece a otro).
  * Es posible se haya pasado alguno por alto.
  
## TO-DO list
* Implementar las funcionalidades de los request
  * Funcionalidad de correos
* Mejorar vistas de perfiles de usuario
* Agregar fotos a jugadores y logos en equipos y torneos
* Pulir y optimizar los HTML y consultas a base de datos
* Agregar tablas de posiciones y brackets

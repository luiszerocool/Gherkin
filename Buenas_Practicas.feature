"MALA PRACTICA:"
Escenario: Como usuario existente y habilitado del cajero, quiero realizar una extracción para obtener dinero.
Dado Me autentiqué con una tarjeta habilitada
Y El saldo disponible en mi cuenta es positivo
Y El cajero tiene suficiente dinero
Y El cajero tiene papel suficiente para imprimir recibos
Cuando Introduzco la tarjeta en el cajero
Y Escribo en el teclado el pin de la tarjeta
Y Presiono el botón de confirmar pin 
Y Presiono el botón próximo a la opción extraer dinero 
Y Ingreso una cantidad menor o igual a mi saldo disponible 
Y Presiono el botón de confirmar extracción 
Y Presiono el botón de confirmar imprimir recibo
...


"""
Es mejor evitar escribir los escenarios de esta manera pues los hace muy largos, con muchos detalles 
innecesarios y difícil de leer y entender. Otra desventaja de escribirlos así es que los hace difíciles 
de mantener, ya que al mínimo cambio que tengamos que hacer al comportamiento es muy probable que tengamos
que modificar muchos pasos en el escenario. Una forma más resumida, descriptiva y clara de escribir el escenario 
puede ser ésta:
"""
Escenario: Como usuario existente y habilitado del cajero, quiero realizar una extracción para obtener dinero.
Dado Me autentiqué con una tarjeta habilitada
Y El saldo disponible en mi cuenta es positivo
Cuando Selecciono la opción de extraer dinero
Y Ingreso la cantidad de dinero menor al saldo disponible y disponible del cajero 
Entonces Obtengo dinero 
Y El dinero que obtuve se resta del saldo disponible de mi cuenta 
Y El sistema devuelve la tarjeta automáticamente
Y El sistema muestra el mensaje de transacción  finalizada


"Una forma aún más optima:"
Escenario: Como usuario existente y habilitado del cajero, quiero realizar una extracción para obtener dinero.
Dado Me autentiqué con una tarjeta habilitada y tengo un saldo positivo
Cuando Selecciono la opción de extraer dinero e ingreso la cantidad de dinero menor al saldo disponible
Entonces Obtengo el dinero y este se resta del saldo disponible de mi cuenta devolviendo la tarjeta automáticamente
Y El sistema muestra el mensaje de transacción  finalizada



"""
# Las sentencias se deben escribir en orden Given-When-Then. Esto es porque Given representa una precondición, 
When una acción y Then un resultado o consecuencia de la acción (criterio de aceptación del usuario). Por lo 
que escribir un When después del Then, por ejemplo, no estaría bien conceptualmente y no sería muy claro.

# Tampoco deberían repetirse los Given-When-Then por escenario, para extender cualquiera de las sentencias se 
utiliza And. El motivo de ésto es que un escenario representa un comportamiento individual, y si definimos algo 
del estilo: Given-When-Then-When…, seguramente podemos dividirlo en más de un escenario.

# Las sentencias tienen que ser consistentes entre sí y con la descripción del escenario, o sea, si la 
descripción del escenario está escrita en primera persona las sentencias también deberían escribirse en primera persona

# Es muy importante que los escenarios sean lo más independientes entre sí mientras sea posible, es decir: no puede 
pasar que se acoplen escenarios. Por ejemplo, no es conveniente que si en un escenario insertamos registros en una base 
de datos, el resultado de escenarios siguientes dependan de la existencia de esos registros. Tener escenarios acoplados 
puede generar errores, por ejemplo, si tenemos que ejecutarlos en paralelo, o si uno falla.
"""


"""
¿Cómo separar los archivos?
Al separar los features la cantidad de archivos puede llegar a ser enorme, entonces hay que pensar cómo hacer la división 
de features en diferentes archivos. 

Una opción muy usada es tener un archivo con las features que agrupen todo lo relacionado con un aspecto de la aplicación, 
e incluso organizar en directorios. 

En un caso concreto, para un sistema que maneja facturas, podríamso tener esto:

    >facturas
      cargarfactura.feature
      eliminarfactura.feature
      cancelarfactura.feature
      modificarfactura.feature

Así se organiza mejor y es más fácil ubicar cada test y dónde encontrar cada cosa.
"""



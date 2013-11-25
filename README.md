# Práctica 9 - Matrices dispersas

## Descripción
Gema que implementa la clase SparseMatrix que contempla el formato de matriz con más de un 60% de ceros. 
En ella se describen métodos para la realización de operaciones aritméticas, y métodos de comparación. 
Esos métodos son +(other), -(other), *(other), ==(other), to_s, initialize(h={}). 

La clase SparseMatrix hereda de la clase Matrix, al igual que lo hace DenseMatriz en la cual se implementan las operaciones entre matrices. Esta clase está pensada para su uso con matrices densas.
En la clase SparseMatrix tambien se implementan los metodos para hacer operaciones con hashes que van a representar a vectores y martrices dispersas.

La jerarquía de clases será la que sigue:
Matrix clase base.
DenseMatrix, clase que hereda de Matrix.
SparseMatrix, clase que hereda de Matrix.
SparseVector, clase que es usada por SparseMatrix para crear hashes.


## Instalación

Añadir esta línea a el Gemfile de la aplicación:

    gem 'pract09'

Y entonces ejecuta:

    $ bundle

O instala tu mismo la gema:

    $ gem install pract09

## Uso

Para instanciar la clase llamaremos a su constructor al cual podemos pasarle, de forma opcional, un hash.

	z = SparseMatrix.new 1000 => { 100 => 1, 500 => 200}, 20000 => { 1000 => 3, 9000 => 200}

Para comprobar su funcionamiento se podría hacer lo siguiente:

1.Devolverá el valor que tendría asociado en una matriz la fila 1000 y columna 500.
	
	puts "z[1000][500] = #{z[1000][500]}"

2.Devolverá todos los valores que tendría la columna 500 en una matriz.
	
	puts "z.col(500) = #{z.col(500)}"

## Contribucciones

1.Colaboraciones.

2.Crear una rama 

	$ git checkout -b miRama
	
3.Hacer un commit con los cambios realizados 

	$ git commit -a -m 'Mensaje descriptivo'

4.Empujar los cambios al repositorio

	$ git push -u origin miRama
	
5.Actualizar nuestro repositorio local

	$ git pull origin miRama



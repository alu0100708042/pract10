# Autor: 		Ricardo Oliva Garcia, J. Oliver Martínez Novo
# Fecha: 		26/11/2013
# Descripción: 	Implementación de la clase DenseMatrix, la cual hereda de la clase Matrix
#				para la representación de matrices densas y sus operaciones básicas.

require './matrix.rb'
 
class DenseMatrix < Matrix
	
	# Constructor de la clase DenseMatrix. Hereda de la clase Matrix
	def initialize(newmatrix)
		@matrix = newmatrix
		super(newmatrix[0].size, newmatrix.size)
	end
	
	# Método para leer una matriz de un fichero
	# Se usa el método .to_m para convertir los datos leidos en una matriz de números flotantes.
	def DenseMatrix.read_File(file)
		contenido = File.open(file).read
		a, b = contenido.split(/\n\n+/)
		a = DenseMatrix.to_m(a)
		b = DenseMatrix.to_m(b)
		[a, b]
	end
	
	# Método usado por el constructor para generar un array de arrays a partir de los datos leidos
	# del fichero para construir las matrices con valores flotantes.
	# Usa el método mapmap para recorrer los elementos y retornar los flotantes.
	def DenseMatrix.to_m(a)
	  	a = a.split(/\n/)
	  	a = a.map { |r| r.split(/\s+/) }
	  	a = mapmap(a) { |x| x.to_f } 
	end	
	
	# Método usado para recorrer los elementos y convertir a flotante.
	def DenseMatrix.mapmap(a)
  		a.map { |r| r.map { |e| yield e }}
	end

	# Asignación del método get para :matrix
	attr_reader :matrix

	# Implementacón del método + (suma), para la realización de operaciones de suma de matrices.
	def +(matrixb)
		sum = []
		x,y =0,0
		while x < row
			while y < col
				if y == 0
					sum << [matrix[x][y] + matrixb[x][y]]
				else
					sum[x] << matrix[x][y] + matrixb[x][y]
				end
				y= y+1			
			end
			x=x+1
			y=0
		end
		DenseMatrix.new(sum)
	end
	
	# Implementación del método - (resta), para la realización de operaciones de resta de matrices.
	def -(matrixb)
		res = []
		x,y =0,0
		while x < row
			while y < col
				if y == 0
					res << [matrix[x][y] - matrixb[x][y]]
				else
					res[x] << matrix[x][y] - matrixb[x][y]
				end
				y= y+1			
			end
			x=x+1
			y=0
		end
		DenseMatrix.new(res)
	end
	
	# Implementacón del método * (multiplicación), para la realización de operaciones de multiplicación de matrices.
	def *(matrixc)
    	matRes = Array.new(matrix.size - 1,0)
		for fil in 0...matrix[0].size

			matRes[fil] = Array.new(matrixc.matrix.size,0)

			for col in 0...matrixc.matrix.size

				for pos in 0...matrix.size

					prod = matrix[fil][pos] * matrixc.matrix[pos][col]
					matRes[fil][col] = matRes[fil][col] + prod

				end
			end

    	end
    	DenseMatrix.new(matRes)
  	end
	
	# Implementacón del método == (comparación), para la realización de operaciones de comparación entre matrices.
	def ==(matrixd)
		x,y = 0,0
		flag = true
		while x < row
			while y < col
				if self.matrix[x][y] == matrixd.matrix[x][y] then 
					flag = true
				else 
					return false
				end
				y = y + 1			
			end
    			x  =  x + 1
    			y = 0
		end
		return flag
	end
	
	# Método que retorna la representación en string de una matriz.
	def to_s
		x,y = 0,0
		str = "["
		while x < row
			str << "["
			while y < col
				if y !=0 then
					str << ", "
				end
				str << "#{matrix[x][y]}"
				y= y + 1			
			end
    			x  =  x + 1
    			y = 0
			if x < row then
				str << "], "
			else
				str << "]"							
			end
		end	
		str << "]"
		str
	end
	
	# Implementacón del método [](i), (indexación), para tener acceso a los elementos por indice.()
	def [](i)
		self.matrix[i]
	end
	
	def min()
		#minimo = 10000
		#i = 0														
		#(self.row).times do
		#	j = 0				
		#	(self.col).times do
		#			minimo = @matrix[i][j] if(self[i][j] < min)	
		#		j += 1	
		#	end
		#	i += 1	
		#end
		cp = DenseMatrix.new(self.matrix)
		cp.matrix.sort!
		cp.matrix.map!{|x| x.sort}
		minimo = cp.matrix.first.first
		return minimo
	end
	def coerce(other)
		[other,self]
        end
end

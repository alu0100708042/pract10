#fichero de definición de la clase matrix
require './matrix.rb'
 
class DenseMatrix < Matrix
	
	#inicializar matrix
	def initialize(newmatrix)
		@matrix = newmatrix
		super(newmatrix[0].size, newmatrix.size)
	end
	
	# lee matriz de un fichero que se le pasa la matriz con formato básico	
	def DenseMatrix.read_File(file)
		contenido = File.open(file).read
		a, b = contenido.split(/\n\n+/)
		a = DenseMatrix.to_m(a)
		b = DenseMatrix.to_m(b)
		[a, b]
	end
	
	#la transforma a un array de arrays
	def DenseMatrix.to_m(a)
	  	a = a.split(/\n/)
	  	a = a.map { |r| r.split(/\s+/) }
	  	a = mapmap(a) { |x| x.to_f } 
	end	
	
	def DenseMatrix.mapmap(a)
  		a.map { |r| r.map { |e| yield e }}
	end

	# asignación de get y set
	attr_reader :matrix
	
	#metodo para pasar a string las matrices
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

	# definicion del metodo sumar
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
	#definicion del metodo multiplicar
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
	
	#definicion del método ==
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
	def [](i)
		self.matrix[i]
	end
end

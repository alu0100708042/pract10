# Autor: 		Ricardo Oliva García, J. Oliver Martínez Novo
# Fecha: 		26/11/2013
# Descripción: 	Implementación de la clase SparceMatrix la cual hereda de la clase Matrix
#				para la implementación de matrices dispersas así como sus operaciones básicas.

require './matrix.rb'
require './sparse_vector.rb'
require './dense_matrix.rb'

class SparseMatrix < Matrix

	# Asignación del método get para :m_Matrix
	attr_reader :m_Matrix
                                                   
	# Contructor de la clase SparseMatrix. Hereda de la clase Matrix.
	# Recibe de forma opcional un hash
	def initialize(h = {})
		@m_Matrix = Hash.new({})
		row, col = 0, 0
		arrayCol=[]
		j = 0
		for k in h.keys do
			row = k  if (row < k.to_i == true)   
			if h[k].is_a? SparseVector
				@m_Matrix[k] = h[k]
			else 
				@m_Matrix[k] = SparseVector.new(h[k])
			end
		end

		for r in @m_Matrix.keys do
			j= 0
			while j <  @m_Matrix[r].vector.keys.size do 
				 col= @m_Matrix[r].vector.keys[j] if (col < @m_Matrix[r].vector.keys[j].to_i == true)
				 j += 1		
			end
		end
		row = row + 1
		col = col + 1 
		super(row,col)
	end

	# Método que retorna un objeto SparseVector que representa los valores de una columna en una matriz dispersa.
	def cols(j)
		c = {}
		for r in @m_Matrix.keys do   
			c[r] = @m_Matrix[r].vector[j] if @m_Matrix[r].vector.keys.include? j
		end
		SparseVector.new c
	end

	# Implementacón del método + (suma), para la realización de operaciones de suma de matrices dispersas.
	def +(matrizb)
		for r in @m_Matrix.keys do 
			for j in @m_Matrix[r].vector.keys do 
				matrizb[r][j]= @m_Matrix[r][j].to_i + matrizb[r][j].to_i
			end
		end	
		matrizb
	end

	# Implementacón del método - (resta), para la realización de operaciones de resta de matrices dispersas.
	def -(matrizb)
		for r in @m_Matrix.keys do 
			for j in @m_Matrix[r].vector.keys do 				
				matrizb[r][j]= @m_Matrix[r][j] - matrizb[r][j]
			end
		end
		matrizb
	end
	
	# Implementacón del método * (multiplicación), para la realización de operaciones de multiplicación de matrices dispersas
	def *(matrixc)
	    matRes = Array.new(matrixc.row - 1,0)
		if (matrixc.row == self.row && matrixc.col == self.col) then
			#for fil in 0...matrixc.row
			0.upto(matrixc.row - 1) do |fil|
			matRes[fil] = Array.new(matrixc.col,0)
				0.upto(self.row-1)do |col|				
				#for col in 0... self.row do
					0.upto(matrixc.col-1)do |pos|
					#for pos in 0...matrixc.col

						prod = self[fil][pos].to_i * matrixc[pos][col].to_i
						matRes[fil][col] = matRes[fil][col].to_i + prod
					end
				end
			end
			return DenseMatrix.new(matRes)		
		else 
			raise "La matriz no es cuadrada no se puede multiplicar" 
	    end
    end
    
	# Método para hallar el minimo de la matriz.
	def min()
		min = 1000000
		for r in @m_Matrix.keys do
			for j in @m_Matrix[r].vector.keys do 
				min = @m_Matrix[r].vector[j] if (min > @m_Matrix[r].vector[j] == true)	
			end
		end
	
		min
	end
	
	# Método para hallar el máximo de la matriz.
	def max()
		max = -1000000
		for r in @m_Matrix.keys do
			for j in @m_Matrix[r].vector.keys do 
				max = @m_Matrix[r].vector[j] if (max < @m_Matrix[r].vector[j] == true)		
			end
		end
		max
	end
	
	# Método que retorna la representación en string de una matriz.
	def to_s
		str = "["	
		for r in @m_Matrix.keys do
			for j in @m_Matrix[r].vector.keys do	
				str <<	"[#{r}] [#{@m_Matrix[r].vector.to_s}]"	
			end
		end	
		str << "]"	
	end
    
	# Implementación del método coerse para poder realizar operaciones con otros tipos de matrices.
    def coerce(other)
		return  [self,other]
    end
 	
	# Implementacón del método [](i), (indexación), para tener acceso a los elementos por indice.
	def [](i)
		@m_Matrix[i]
	end

end

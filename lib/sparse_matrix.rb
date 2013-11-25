require './matrix.rb'
require './sparse_vector.rb'
require './dense_matrix.rb'

# Clase para la representacion de matrices dispersas.
class SparseMatrix < Matrix

	attr_reader :m_Matrix

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
		super(row,col)
	end

	# Metodo para la indexacion
	def [](i)
		@m_Matrix[i]
	end

	# Metodo que retorna un SparseVector con los valores de una columna.
	def cols(j)
		c = {}
		for r in @m_Matrix.keys do   
			c[r] = @m_Matrix[r].vector[j] if @m_Matrix[r].vector.keys.include? j
		end
		SparseVector.new c
	end

	# Metodo para la operacion aritmetica de la suma.
	def +(matrizb)
		
		#sumita={}
		#for r in @m_Matrix.keys do 
		#	sum = {}
		#	if matrizb.m_Matrix.keys.include? r
		#		for j in @m_Matrix[r].vector.keys do 
		#			sum[j] = @m_Matrix[r].vector[j]+matrizb[r].vector[j]	
		#			sumita[r] = {j=>sum[j]}
		#		end
		#	else
		#		sum[r]=@m_Matrix[r]
		#	end
		#end
		#SparseMatrix.new(sumita)

		for r in @m_Matrix.keys do 
			for j in @m_Matrix[r].vector.keys do 
				matrizb[r][j]= @m_Matrix[r][j]+matrizb[r][j]
			end
		end	
	matrizb
	end

	# Metodo para la operacion aritmetica de la resta.
	def -(matrizb)
		restita={}
		for r in @m_Matrix.keys do 
			res = {}
			if matrizb.m_Matrix.keys.include? r
				for j in @m_Matrix[r].vector.keys do 
					res[j] = @m_Matrix[r].vector[j]-matrizb[r].vector[j]	
					restita[r] = {j=>res[j]}
				end
			else
				res[r]=@m_Matrix[r]
			end
		end
		SparseMatrix.new(restita)
	end
		
	# Se define un metodo para hallar el máximo que retornará un número
	def max(other)
		max = -1000000
		for r in @m_Matrix.keys do
			for j in @m_Matrix[r].vector.keys do 
				max = @m_Matrix[r].vector[j] if (max < @m_Matrix[r].vector[j] == true)		
			end
		end
		for r in other.m_Matrix.keys do
			for j in other.m_Matrix[r].vector.keys do 
				max = other.m_Matrix[r].vector[j] if (max < other.m_Matrix[r].vector[j] == true)	
			end
		end
		max
	end
	
	def *(matrixc)

    	if (matrixc.row == self.row && matrixc.col == self.col) then

	arr=[]
	multiplicar={}	
		for r in @m_Matrix.keys do
			mult = {}			
			for j in @m_Matrix[r].vector.keys do 
			
					prod = @m_Matrix[r][j].to_i * matrixc.m_Matrix[r][j].to_i
					mult[j] = mult[j].to_i + prod
					arr << r
					arr <<  multiplicar[r] =  {j=>mult[j]}		
				#puts "#{@m_Matrix[r][pos]} #{matrixc.m_Matrix[pos][j]} #{matRes[r][j]} #{r} #{j}"
				#end
			end
		end
	else 
		puts "La matriz no es cuadrada no se puede multiplicar" 
    	end
    arr
    end
    # Se define un metodo para hallar el máximo que retornará un número
	def min(other)
		min = 1000000
		for r in @m_Matrix.keys do
			for j in @m_Matrix[r].vector.keys do 
				min = @m_Matrix[r].vector[j] if (min > @m_Matrix[r].vector[j] == true)	
			end
		end
		for r in other.m_Matrix.keys do
			for j in other.m_Matrix[r].vector.keys do 
				min = other.m_Matrix[r].vector[j] if (min > other.m_Matrix[r].vector[j] == true)	
			end
		end
		min
	end
   
	def to_s
		str = "["	
		for r in @m_Matrix.keys do
			for j in @m_Matrix[r].vector.keys do	
			str <<	"[#{r}] [#{@m_Matrix[r].vector.to_s}]"	
			#puts "[#{r}] [#{j}]"	
			end
		end	
		str << "]"	
	end
    
	def coerce(other)
		return  [self,other]
    end
 	
end

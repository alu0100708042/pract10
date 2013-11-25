#fichero de definición de la clase matriz
 class Matriz
	
	#inicializar matriz
	def initialize(matriz)
		
		@matriz = matriz
    		@row = matriz[0].size
    		@col = matriz[0].size
	end
	# lee matriz de un fichero que se le pasa la matriz con formato básico	
	def Matriz.read_File(file)
		contenido = File.open(file).read
		a, b = contenido.split(/\n\n+/)
		a = Matriz.to_m(a)
		b = Matriz.to_m(b)
		[a, b]
	end
	#la transforma a un array de arrays
	def Matriz.to_m(a)
	  	a = a.split(/\n/)
	  	a = a.map { |r| r.split(/\s+/) }
	  	a = mapmap(a) { |x| x.to_f } 
	end	
	
	def Matriz.mapmap(a)
  		a.map { |r| r.map { |e| yield e }}
	end





	# asignación de get y set

	attr_reader :matriz, :row, :col
	#metodo para pasara a string las matrices
		
	def to_s
		x,y = 0,0
		str = "["
		while x < row
			str << "["
			while y < col
				if y !=0 then
					str << ", "
				end
				str << "#{matriz[x][y]}"
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

	def +(matrizb)
		sum = []
		x,y =0,0
		while x < row
			while y < col
				if y == 0
					sum << [matriz[x][y] + matrizb.matriz[x][y]]
				else
					sum[x] << matriz[x][y] + matrizb.matriz[x][y]
				end
				y= y+1			
			end
			x=x+1
			y=0
		end
		Matriz.new (sum)

	end
	#definicion del metodo multiplicar
	def *(matrizc)

    		matRes = Array.new(matriz.size - 1,0)

		for fil in 0...matriz[0].size

			matRes[fil] = Array.new(matrizc.matriz.size,0)

			for col in 0...matrizc.matriz.size

				for pos in 0...matriz.size

					prod = matriz[fil][pos] * matrizc.matriz[pos][col]
					matRes[fil][col] = matRes[fil][col] + prod

				end

			end

    		end

    		Matriz.new(matRes)

  	end
	#definicion del método ==
	def ==(matrizd)
		x,y = 0,0
		flag=true
		while x < row
			while y < col
				if self.matriz[x][y] == matrizd.matriz[x][y] then 
					flag=true
				else 
					return false
				end
				y= y + 1			
			end
    			x  =  x + 1
    			y = 0
		
		end
	return flag
	end


end

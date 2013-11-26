
require "rspec"
require "sparse_matrix"
#require "sparse_matrix"
#require "dense_matrix"


describe Matrix do
	
	before :each do
		m1, m2 = DenseMatrix.read_File('./lib/datos')
		@m_MatrizA = DenseMatrix.new(m1)
		@m_MatrizB = DenseMatrix.new(m2)
		@m_MatrizC = DenseMatrix.new(m1)
		@sm_a = SparseMatrix.new(0=>{0=>1},1=>{1=>4}, 2=>{2=>6, 1=>4})
		@sm_b = SparseMatrix.new(1=>{1=>2,2=>4},2=>{1=>6})

		
	end
	
	context 'Operaciones con matrices densas' do
	
		it "Comprobar el método de Multiplicar" do							
			@m_MatrizA.multiplicar(@m_MatrizB).to_s.should == "[[15.0, 41.0, 39.0], [45.0, 95.0, 90.0], [75.0, 149.0, 141.0]]"
		end

		it "Comprobar el método de Sumar" do							
			@m_MatrizA.sumar(@m_MatrizB).to_s.should == "[[8.0, 6.0, 6.0], [5.0, 10.0, 12.0], [9.0, 17.0, 17.0]]"
		end
		
		it "Comprobar el método ==" do
			(@m_MatrizA==@m_MatrizC).should == true
		end
		
		it "Comprobar el método de Restar" do
			(@m_MatrizA-@m_MatrizB).should == "[[-5.0, -2.0, 0.0], [3.0, -2.0, 4.0], [5.0, 1.0, 7.0]]"
		end
		
	end
	
	context 'Operaciones con matrices dispersas' do
		
		it "Comprobar la salida del metodo to_s en matrices dispersas" do
			@sm_a.to_s.should == "[[0] [{0=>1}][1] [{1=>4}][2] [{2=>6, 1=>4}][2] [{2=>6, 1=>4}]]"
		end
		
		it "Comprobar la salida del metodo col en matrices dispersas" do
			@sm_b.cols(2).to_s.should ==  "{2=>6}"
		end
		
		it "Comprobar la suma de dos matrices dispersas" do
			(@sm_a+@sm_b).to_s.should ==  "[[1] [{1=>-2, 2=>12}][1] [{1=>-2, 2=>12}][2] [{1=>10, 2=>12}][2] [{1=>10, 2=>12}]]"
		end
		
		it "Comprobar la resta de dos matrices dispersas" do
			(@sm_b-@sm_a).to_s.should ==  "[[0] [{0=>1}][1] [{1=>-2, 2=>4}][1] [{1=>-2, 2=>4}][2] [{2=>6, 1=>2}][2] [{2=>6, 1=>2}]]"
		end
		
		it "Comprobar la multiplicacion de dos matrices dispersas" do
			(@sm_a*@sm_b).to_s.should ==  "[[2, 0, 0], [0, 44, 24], [0, 56, 96]]"
		end
		
		it "Comprobar el metodo min entre matrices dispersas" do
			@sm_a.min(@sm_b).should == 1
		end
		
		it "Comprobar el metodo max entre matrices dispersas" do
			@sm_a.max(@sm_b).should == 6
		end
		
	end
	
	context 'Operaciones con matrices densas y dispersas' do
		
		it "Comprobar la multiplicacion" do
			(@sm_a * @m_MatrizA).to_s.should == "[[1, 2, 3], [20, 22, 24], [50, 58, 66]]"
		end
		
		it "Comprobar la suma" do
			(@sm_a + @m_MatrizA).to_s.should == "[[2, 2.0, 3.0], [4.0, 3, 10], [7.0, 10, 15]]"
		end
	
	end	
	
end


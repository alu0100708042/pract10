
require "rspec"
require "sparse_matrix"
#require "sparse_matrix"
#require "dense_matrix"


describe Matrix do
	
	before :each do
		@sm_a = SparseMatrix.new(10 => { 2 => 1, 5 => 200}, 20 => { 10 => 3, 9 => 5})
		@sm_b = SparseMatrix.new(10 => { 2 => 2, 5 => 300}, 20 => { 10 => 5, 9 => 7})
	end
	
	it "Comprobar la salida del metodo to_s en matrices dispersas" do
		@sm_a.to_s.should == "[[10] [{2=>1, 5=>200}][10] [{2=>1, 5=>200}][20] [{10=>3, 9=>5}][20] [{10=>3, 9=>5}]]"	
	end
	
	it "Comprobar la salida del metodo col en matrices dispersas" do
		@sm_b.cols(5).to_s.should ==  "{10=>300}"
	end
	
	it "Comprobar la suma de dos matrices dispersas" do
		(@sm_a+@sm_b).to_s.should == "[[10] [{5=>500}][20] [{9=>12}]]"
	end
	
	it "Comprobar la resta de dos matrices dispersas" do
		(@sm_b-@sm_a).to_s.should == "[[10] [{5=>100}][20] [{9=>2}]]" 
	end
	it "Comprobar la multiplicacion de dos matrices dispersas" do
		(@sm_b*@sm_a).to_s.should == "[10, {2=>2}, 10, {5=>60000}, 20, {10=>15}, 20, {9=>35}]"
	end
	it "Comprobar el metodo min entre matrices dispersas" do
		@sm_a.min(@sm_b).should == 1
	end
	
	it "Comprobar el metodo max entre matrices dispersas" do
		@sm_a.max(@sm_b).should == 300
	end
	 
end


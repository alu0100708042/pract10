

# Clase para la representacion de vectores dispersos.
class SparseVector 
  attr_reader :vector
  attr_accessor :vector

  def initialize(h = {})
    @vector = Hash.new(0)
    @vector = @vector.merge!(h)
  end

  def [](i)
    @vector[i] 
  end

  def to_s
    @vector.to_s
  end
  
  def []=(i,j)
  	@vector[i]=j
  end
  
end

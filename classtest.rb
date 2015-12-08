class ClassA
  def method
    return "This is a method_from_class_A"
  end
end

class ClassB
  def initialize(class_a_instance)
    @instance_of_class_a = class_a_instance
  end

  def method_calls_method
    @instance_of_class_a.method
  end
end

instance_a = ClassA.new
instance_b = ClassB.new(instance_a)
puts instance_b.method_calls_method
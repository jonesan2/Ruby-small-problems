module SampleModule
end

class SampleObject
  include SampleModule
end

a = SampleObject.new
p a
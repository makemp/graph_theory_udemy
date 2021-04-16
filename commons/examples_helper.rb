module ExamplesHelper
  def self.extended(klass)
    klass.define_singleton_method(:run) do
      klass.methods.select { |sym| sym.to_s =~ /\Aexample/ }.sort.each { |method| send(method) }
    end
  end
end

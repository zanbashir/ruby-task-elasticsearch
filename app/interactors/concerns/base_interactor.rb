module BaseInteractor
  extend ActiveSupport::Concern

  included do
    include Interactor

    delegate :fail!, to: :context
  end

  class_methods do
    def expects(name, options = {})
      define_method name do
        instance_variable_name = "@#{name}"
        return instance_variable_get(instance_variable_name) if instance_variable_defined?(instance_variable_name)

        value = context[name] ||
                (options[:default]&.is_a?(Proc) ? instance_exec(&options[:default]) : options[:default])
        instance_variable_set(instance_variable_name, value)
        value
      end
    end
  end
end

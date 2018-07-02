class PolicyCollector
  attr_accessor :policies

  @@policyClasses = [
    MenuPolicy,
    SessionPolicy
  ]

  def initialize(user)
    
    @policies = {}
    #@policies = {menu: MenuPolicy.new(user, nil).public_methods(false), session: SessionPolicy.new(user, nil).public_methods(false)}

    @@policyClasses.each do |policyClass|
      policy = policyClass.new(user, nil)
      policy_queries = []

      policy.public_methods(false).each do |policy_query|
        if (policy.send(policy_query))
          policy_queries << policy_query
        end
      end

      unless policy_queries.size === 0
        @policies[policyClass.name] = policy_queries
      end
      

    end
   
  end
end

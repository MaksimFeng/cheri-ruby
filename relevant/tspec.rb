class A 

@@default_value = {
    authors: [],
    autorequire: nil,
    bindir: "bin",
    cert_chain: [],
    date: nil,
    dependencies: [],
    description: nil,
    email: nil,
    executables: [],
    extensions: [],
    extra_rdoc_files: [],
    files: [],
    homepage: nil,
    licenses: [],
    metadata: {},
    name: nil,
    platform: 1,
    post_install_message: nil,
    rdoc_options: [],
    require_paths: ["lib"],
    required_ruby_version: 1,
    required_rubygems_version: 1,
    requirements: [],
    rubygems_version: 1,
    signing_key: nil,
    specification_version: 1,
    summary: nil,
    test_files: [],
    version: nil,
  }.freeze

  INITIALIZE_CODE_FOR_DEFAULTS = {} # :nodoc:

  @@default_value.each do |k,v|
    INITIALIZE_CODE_FOR_DEFAULTS[k] = case v
                                      when [], {}, true, false, nil, Numeric, Symbol
                                        v.inspect
                                      when String
                                        v.dump
                                      else
                                        "default_value(:#{k}).dup"
    end
  end
end 

a = A.new
p a.class::default_value.to_str
p a.class::INITIALIZE_CODE_FOR_DEFAULTS

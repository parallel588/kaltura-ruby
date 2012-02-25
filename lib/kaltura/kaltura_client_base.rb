module Kaltura
	class ClientBase
		attr_accessor 	:config
		attr_accessor 	:ks
		attr_reader 	:is_multirequest

		def initialize(config)
			@should_log = false
			@config = config
			@calls_queue = []

			if @config.logger != nil
				@should_log = true
			end
		end

		def queue_service_action_call(service, action, params = {})
			# in start session partner id is optional (default -1). if partner id was not set, use the one in the config
			if (!params.key?('partnerId') || params['partnerId'] == -1)
				params['partnerId'] = config.partner_id;
			end

			add_param(params, 'ks', @ks);

			call = ServiceActionCall.new(service, action, params);
			@calls_queue.push(call);
		end

		def do_queue()
			start_time = Time.now

			if @calls_queue.length == 0
				@is_multirequest = false
				return nil
			end

			log('service url: [' + @config.service_url + ']')
			# append the basic params
			params = {}
			add_param(params, "format", @config.format)
			add_param(params, "clientTag", @config.client_tag)

			url = @config.service_url+"/api_v3/index.php?service="
			if (@is_multirequest)
				url += "multirequest"
				i = 1
				@calls_queue.each_value do |call|
					call_params = call.get_params_for_multirequest(i.next)
					params.merge!(call_params)
				end
			else
				call = @calls_queue[0]
				url += call.service + "&action=" + call.action
				params.merge!(call.params)
			end

			# reset
			@calls_queue = []
			@is_multirequest = false

			signature = signature(params)
			add_param(params, "kalsig", signature)

			log("url: " + url)
			log("params: " + params.to_yaml)
			result = do_http_request(url, params)

			result_object = parse_to_objects(result.body)

			end_time = Time.now
			log("execution time for [#{url}]: [#{end_time - start_time}]")

			return result_object
		end

		def do_http_request(url, params)
			res = RestClient.post url , params
			return res
		end

		def parse_to_objects(data)
			parse_xml_to_objects(data)
		end

		def parse_xml_to_objects(xml)
			doc = REXML::Document.new(xml)
			raise_exception_if_error(doc)
			doc.elements.each('xml/result') do | element |
				return ClassFactory.object_from_xml(element)
			end
		end

    def raise_exception_if_error(doc)
      if is_error(doc)
        code = doc.elements["xml/result/error/code"].text
        message = doc.elements["xml/result/error/message"].text
        raise APIError.new(code,message)
      end
    end

    def is_error(doc)
      doc.elements["xml/result/error/message"] && doc.elements["xml/result/error/code"]
    end

		def start_multirequest()
			@is_multirequest = true
		end

		def do_multirequest()
			return do_queue()
		end

		def signature(params)
			str = params.keys.map {|key| key.to_s }.sort.map {|key|
				"#{escape(key)}#{escape(params[key])}"
			}.join("")

			Digest::MD5.hexdigest(str)
		end

		def add_param(params, name, value)
			if value == nil
				return
			elsif value.is_a? Hash
				value.each do |sub_name, sub_value|
					add_param(params, "#{name}:#{sub_name}", sub_value);
				end
			elsif value.is_a? ObjectBase
				add_param(params, name, value.to_params)
			else
				params[name] = value
			end
		end

		# Escapes a query parameter. Stolen from RFuzz
		def escape(s)
			s.to_s.gsub(/([^ a-zA-Z0-9_.-]+)/n) {
				'%' + $1.unpack('H2'*$1.size).join('%').upcase
			}.tr(' ', '+')
		end

		def log(msg)
			if @should_log
				config.logger.log(msg)
			end
		end
	end

	class ServiceActionCall
		attr_accessor :service
		attr_accessor :action
		attr_accessor :params

		def initialize(service, action, params = array())
			@service = service
			@action = action
			@params = parse_params(params)
		end

		def parse_params(params)
			new_params = {}
			params.each do |key, val|
				if val.kind_of? Hash
					new_params[key] = parse_params(val)
				else
					new_params[key] = val
				end
			end
			return new_params
		end

		def get_params_for_multirequest(multirequest_index)
			multirequest_params = {}
			multirequest_params[multirequest_index+":service"] = @service
			multirequest_params[multirequest_index+":action"] = @action
			@params.each do |key|
				multirequest_params[multirequest_index+":"+key] = @params[key]
			end
			return multirequest_params
		end
	end

	class ObjectBase
		attr_accessor :object_type

    def initialize(*attrs)
      @options = attrs.last.is_a?(::Hash) ? attrs.pop : {}
      (@options||[]).each {  |k,v| self.send("#{k}=", v) if self.respond_to?("#{k}=")  }
    end

		def to_params
			params = {};
			params["objectType"] = self.class.name.split('::').last
			instance_variables.each do |var|
				value = instance_variable_get(var)
				var = var.to_s.sub('@', '')
				kvar = camelcase(var)
				if (value != nil)
					if (value.is_a? ObjectBase)
						params[kvar] = value.to_params;
					else
						params[kvar] = value;
					end
				end
			end
			return params;
		end

		def to_b(val)
			return [true, 'true', 1, '1'].include?(val.is_a?(String) ? val.downcase : val)
		end

		def camelcase(val)
			val = val.split('_').map { |e| e.capitalize }.join()
			val[0,1].downcase + val[1,val.length]
		end
	end

	class Configuration
		attr_accessor :logger
		attr_accessor :service_url
		attr_accessor :format
		attr_accessor :client_tag
		attr_accessor :timeout
		attr_accessor :partner_id

		def initialize(partner_id = -1, service_url="http://www.kaltura.com")
			@service_url 	= service_url
			@format 		= 2 # xml
			@client_tag 	= "ruby"
			@timeout 		= 10
			@partner_id 	= partner_id
		end

		def service_url=(url)
			@service_url = url.chomp('/')
		end
	end

	class ClassFactory
		def self.object_from_xml(xml_element)
			instance = nil
	        if xml_element.elements.size > 0
				if xml_element.elements[1].name == 'item' # array
					instance = []
					xml_element.elements.each('item') do | element |
						instance.push(ClassFactory.object_from_xml(element))
					end
				else # object
					object_type_element = xml_element.get_text('objectType')
					if (object_type_element != nil)
						object_class = xml_element.get_text('objectType').value
						instance = ClassFactory.set_instance(object_class)
						xml_element.elements.each do | element |
							value = ClassFactory.object_from_xml(element)
							instance.send(self.underscore(element.name) + "=", value) if instance.respond_to?(self.underscore(element.name) + "=")
						end
					end
				end
			else # simple type
	        	return xml_element.text
	       	end

	       	return instance;
		end

		def self.underscore(val)
			val.gsub(/(.)([A-Z]+)/,'\1_\2').downcase
		end

		def self.set_instance(object_request_class)
		  string_object_class = object_request_class.to_s
		  instance = nil
		  stripped_request = ClassFactory.strip_kaltura_from_request(string_object_class)
		  instance = Module.const_get("Kaltura")
		  unless ClassFactory.request_is_response?(string_object_class)
		    instance = instance.const_get("Response").const_get(stripped_request).new
	    else
	      instance = instance.const_get(stripped_request).new
      end
      instance
	  end

	  def self.strip_kaltura_from_request(request)
	    request.gsub("Kaltura","")
    end
	  def self.request_is_response?(request)
	    request_array = []
	    request_array << request
	    request_array == request.split("Response",0)
    end
	end

	class APIError < RuntimeError
	  attr_reader :code
	  attr_reader :message

	  def initialize(code,message)
	    @code = code
	    @message = message
    end
  end
end

note
	description: "[
				application execution
			]"
	date: "$Date: 2016-10-21 17:45:18 +0000 (Fri, 21 Oct 2016) $"
	revision: "$Revision: 99331 $"

class
	HTMX_APP_EXECUTION


inherit

	WSF_FILTERED_ROUTED_EXECUTION


	WSF_ROUTED_URI_HELPER

	SHARED_SERVICES


create
	make

feature {NONE} -- Initialization

feature -- Filter

	create_filter
			-- Create `filter'
		do
				--| Example using Maintenance filter.
			create {WSF_MAINTENANCE_FILTER} filter
		end

	setup_filter
			-- Setup `filter'
		local
			f: like filter
		do
			create {WSF_CORS_FILTER} f
			f.set_next (create {WSF_LOGGING_FILTER})

				--| Chain more filters like {WSF_CUSTOM_HEADER_FILTER}, ...
				--| and your owns filters.

			filter.append (f)
		end

feature -- Router

	setup_router
			-- Setup `router'
		do
				--| As example:
				--|   /doc is dispatched to self documentated page
				--|   /* are dispatched to serve files/directories contained in "www" directory

				--| Self documentation
			router.handle ("/doc", create {WSF_ROUTER_SELF_DOCUMENTATION_HANDLER}.make (router), router.methods_GET)

			map_uri_agent ("/", agent handle_index,  router.methods_get)

			map_uri_agent ("/count", agent handle_count,  router.methods_post)
		end

	handle_index (req: WSF_REQUEST; res: WSF_RESPONSE)
		local
			l_index: HTMX_TEMPLATE
			l_result: STRING_8
		do
			create l_index.make_with_path (create {PATH}.make_from_string ("www"), "index.tpl")
			l_index.add_value (shared_counter.count, "counter")

			shared_counter.inc

			l_index.process
			new_response_get (req, res, l_index.output)
		end


	handle_count (req: WSF_REQUEST; res: WSF_RESPONSE)
		local
			l_index: HTMX_TEMPLATE
			l_result: STRING_8
		do
			create l_index.make_with_path (create {PATH}.make_from_string ("www"), "counter.tpl")
			l_index.add_value (shared_counter.count, "counter")
			shared_counter.inc
			l_index.process
			new_response_post (req, res, l_index.output)
		end


	new_response_get (req: WSF_REQUEST; res: WSF_RESPONSE; output: STRING)
		local
			h: HTTP_HEADER
		do
			create h.make
			h.put_content_type_text_html
			h.put_content_length (output.count)
			h.put_current_date
			res.set_status_code ({HTTP_STATUS_CODE}.ok)
			res.put_header_text (h.string)
			res.put_string (output)
		end

	new_response_post (req: WSF_REQUEST; res: WSF_RESPONSE; output: STRING)
		local
			h: HTTP_HEADER
		do
			create h.make
			h.put_content_type_text_html
			h.put_content_length (output.count)
			h.put_current_date
			res.set_status_code ({HTTP_STATUS_CODE}.ok)
			res.put_header_text (h.string)
			res.put_string (output)
		end

end

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

	WSF_ROUTED_URI_TEMPLATE_HELPER

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
		local
			fhdl: WSF_FILE_SYSTEM_HANDLER
		do
				--| As example:
				--|   /doc is dispatched to self documentated page
				--|   /* are dispatched to serve files/directories contained in "www" directory

				--| Self documentation
			router.handle ("/doc", create {WSF_ROUTER_SELF_DOCUMENTATION_HANDLER}.make (router), router.methods_GET)

			map_uri_agent ("/", agent handle_index, router.methods_get)

			map_uri_agent ("/count", agent handle_count, router.methods_post)

			map_uri_agent ("/contacts", agent handle_contacts, router.methods_post)

			map_uri_template_agent ("/contacts/{id}", agent handle_delete_contacts, router.methods_delete)

			create fhdl.make_hidden ("www")
			router.handle ("/", fhdl, router.methods_GET)
		end


feature -- Handlers

	handle_index (req: WSF_REQUEST; res: WSF_RESPONSE)
		local
			l_index: HTMX_TEMPLATE
			l_result: STRING_8
		do
			create l_index.make_with_path (create {PATH}.make_from_string ("www"), "index.tpl")
			shared_page.form.clear
			l_index.add_value (req.absolute_script_url (""), "host")
			l_index.add_value (shared_page.data.contacts, "contacts")
			l_index.add_value (shared_page.form, "form_data")

			l_index.process
			new_response (req, res, l_index.output, {HTTP_STATUS_CODE}.ok)
		end

	handle_count (req: WSF_REQUEST; res: WSF_RESPONSE)
		local
			l_index: HTMX_TEMPLATE
			l_result: STRING_8
		do
			create l_index.make_with_path (create {PATH}.make_from_string ("www"), "counter.tpl")
			l_index.add_value (req.absolute_script_url (""), "host")
			l_index.add_value (shared_counter.count, "counter")
			shared_counter.inc
			l_index.process
			new_response (req, res, l_index.output, {HTTP_STATUS_CODE}.ok)
		end

	handle_contacts (req: WSF_REQUEST; res: WSF_RESPONSE)
		local
			l_index: HTMX_TEMPLATE
			l_result: STRING_8
			l_error: BOOLEAN
			l_contact: CONTACT
			l_res: STRING
		do
			shared_page.form.clear
			if attached {WSF_STRING} req.form_parameter ("name") as l_name and then
				attached {WSF_STRING} req.form_parameter ("email") as l_email
			then
				if shared_contacts.has_email (l_email.value) then
					shared_page.form.set_name (l_name.value)
					shared_page.form.set_email (l_email.value)
					shared_page.form.errors.force ("Email already exists")
					l_error := True
				else
					create l_contact.make (l_name.value, l_email.value, shared_contacts.contacts.count + 1)
					shared_page.data.put_contact (l_contact)
				end
			end
			if l_error then
				create l_index.make_with_path (create {PATH}.make_from_string ("www"), "form.tpl")
				l_index.add_value (req.absolute_script_url (""), "host")
				l_index.add_value (shared_page.form, "form_data")
				l_index.process
				new_response (req, res, l_index.output, {HTTP_STATUS_CODE}.unprocessable_entity)
			else
				create l_index.make_with_path (create {PATH}.make_from_string ("www"), "form.tpl")
				l_index.add_value (req.absolute_script_url (""), "host")
				l_index.add_value (create {HTMX_FORM_DATA}.make, "form_data")
				l_index.process
				l_res := l_index.output
				create l_index.make_with_path (create {PATH}.make_from_string ("www"), "oob_contact.tpl")
				l_index.add_value (req.absolute_script_url (""), "host")
				l_index.add_value (l_contact, "item")
				l_index.process
				new_response (req, res, l_res + l_index.output, {HTTP_STATUS_CODE}.ok)
			end
		end

	handle_delete_contacts (req: WSF_REQUEST; res: WSF_RESPONSE)
		local
			l_contact: CONTACT
		do
			{EXECUTION_ENVIRONMENT}.sleep (3_000_000_000)
			if attached {WSF_STRING} req.path_parameter ("id") as l_id and then
				l_id.is_integer then
				l_contact := shared_contacts.delete_by_id (l_id.integer_value)
				new_response (req, res, "", {HTTP_STATUS_CODE}.ok)
			else

				new_response (req, res, "Invalid id", {HTTP_STATUS_CODE}.bad_request)
			end
		end

feature -- HTTP response

	new_response (req: WSF_REQUEST; res: WSF_RESPONSE; output: STRING; status_code: INTEGER)
		local
			h: HTTP_HEADER
		do
			create h.make
			h.put_content_type_text_html
			h.put_content_length (output.count)
			h.put_current_date
			res.set_status_code (status_code)
			res.put_header_text (h.string)
			res.put_string (output)
		end

end

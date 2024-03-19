note
	description: "Summary description for {APP_INDEX_TEMPLATE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	HTMX_TEMPLATE

inherit
	SHARED_EXECUTION_ENVIRONMENT
		export
			{NONE} all
		end

	SHARED_TEMPLATE_CONTEXT
		undefine
			default_create
		end

	ANY

create
	make_with_path

feature {NONE} -- Initialization

	make_with_path (d: like document_root; a_template: STRING)

			-- Initialize `Current'.
		do
			if d.is_empty then
				document_root := execution_environment.current_working_path
			else
				document_root := d
			end
			set_template_folder (document_root)
			set_template_file_name (a_template)
			output := ""
		end

feature -- Status

	add_value (a_value: detachable ANY; a_name: READABLE_STRING_GENERAL)
			-- Add a value in the current template
		do
			template.add_value (a_value, a_name)
		end

	process
		do
			template_context.enable_verbose
			template.analyze
			template.get_output
			if attached template.output as l_output then
				output := l_output
			end
		end


	document_root: PATH

	output: STRING

	set_template_folder (v: PATH)
		do
			template_context.set_template_folder (v)
		end

	set_template_file_name (v: STRING)
		do
			create template.make_from_file (v)
		end

	set_template (v: like template)
		do
			template := v
		end

	template: TEMPLATE_FILE


end

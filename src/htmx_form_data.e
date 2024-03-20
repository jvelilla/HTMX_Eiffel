note
	description: "Summary description for {HTMX_FORM_DATA}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	HTMX_FORM_DATA

create
	make

feature -- Initialization

	make
		do
			name := ""
			email := ""
			create {ARRAYED_LIST [STRING]} errors.make (0)
		end

feature -- Access

	name: STRING

	email: STRING

	errors: LIST[STRING]

feature -- Element Change

	set_name (a_name: like name)
		do
			name := a_name
		end

	set_email (a_email: like email)
		do
			email := a_email
		end

	clear
		do
			name := ""
			email := ""
			errors.wipe_out
		end
end

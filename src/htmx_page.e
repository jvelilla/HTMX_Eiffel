note
	description: "Summary description for {HTMX_PAGE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	HTMX_PAGE


create
	make

feature {NONE} -- Initialization
	make (a_data: like data; a_form: like form)
		do
			data := a_data
			form := a_form
		end

feature -- Access

	data:  HTMX_CONTACTS
	form:  HTMX_FORM_DATA

feature -- Element Change	

	set_data (a_data: like data)
		do
			data := a_data
		end

	set_form (a_form: like form)
		do
			form := a_form
		end
end

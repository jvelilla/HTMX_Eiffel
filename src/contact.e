note
	description: "Summary description for {CONTACT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CONTACT

create
	make

feature {NONE} -- Initialization

	make (a_name: STRING; a_email: STRING)
		do
			name := a_name
		    email := a_email
		end

feature -- Access

	name: STRING
	email: STRING
end

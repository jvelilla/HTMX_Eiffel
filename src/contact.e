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

	make (a_name: STRING; a_email: STRING; a_id: INTEGER)
		do
			name := a_name
		    email := a_email
		    id := a_id
		end

feature -- Access

	id: INTEGER
	name: STRING
	email: STRING
end

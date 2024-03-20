note
	description: "Summary description for {HTMX_CONTACTS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	HTMX_CONTACTS

create
	make

feature {NONE} --  Initialization

	make
		do
			create {ARRAYED_LIST [CONTACT]} contacts.make (0)
		end


feature -- Acces		

	contacts: LIST [CONTACT]


feature -- Element Change

	put_contact (a_contact: CONTACT)
		do
			contacts.force (a_contact)
		end

	has_email(a_email: STRING): BOOLEAN
		do
			Result := contacts.there_exists (agent (item: CONTACT; l_email: STRING): BOOLEAN do Result := item.email.same_string_general (l_email) end(?, a_email))
		end
end

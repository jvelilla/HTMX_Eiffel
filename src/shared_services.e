note
	description: "Summary description for {SHARED_COUNTER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SHARED_SERVICES


feature -- Counter

	shared_counter: HTMX_COUNTER
            -- An object that can be shared among threads
            -- without being reinitialized.
        once
            create Result
        end

    shared_contacts: HTMX_CONTACTS
        once
            create Result.make
            Result.put_contact(create {CONTACT}.make("Joe Doe", "jd@example.com", 1))
        end

   shared_form_data: HTMX_FORM_DATA
        once
            create Result.make
        end

	shared_page: HTMX_PAGE
		once
			create Result.make(shared_contacts, shared_form_data)
		end

end

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
end

note
	description: "Summary description for {HTMX_COUNTER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	HTMX_COUNTER

feature -- Access

	count: INTEGER

	inc
		do
			count := count + 1
		end

	dec
		do
			count := count + 1
		end
end

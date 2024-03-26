note
	description: "[
				application service
			]"
	date: "$Date: 2016-10-21 17:45:18 +0000 (Fri, 21 Oct 2016) $"
	revision: "$Revision: 99331 $"

class
	HTMX_APP


inherit
	WSF_LAUNCHABLE_SERVICE
		redefine
			initialize
		end
	APPLICATION_LAUNCHER [HTMX_APP_EXECUTION]


create
	make_and_launch

feature {NONE} -- Initialization

	initialize
			-- Initialize current service.
		do
			Precursor
			set_service_option ("port", 9090)
			set_service_option ("verbose", "yes")
		end


end

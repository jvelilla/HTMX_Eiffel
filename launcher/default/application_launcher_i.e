note
	description: "[
			Specific application launcher

			DO NOT EDIT THIS CLASS

			you can customize APPLICATION_LAUNCHER
		]"
	date: "$Date: 2015-06-12 10:59:28 +0000 (Fri, 12 Jun 2015) $"
	revision: "$Revision: 97466 $"

deferred class
	APPLICATION_LAUNCHER_I [G -> WSF_EXECUTION create make end]

feature -- Execution

	launch (opts: detachable WSF_SERVICE_LAUNCHER_OPTIONS)
			-- Launch Web Server Application using `a_service' and optionals `opts'.
		local
			launcher: WSF_SERVICE_LAUNCHER [G]
		do

			create {WSF_DEFAULT_SERVICE_LAUNCHER [G]} launcher.make_and_launch (opts)
		end

	launcher_id: detachable READABLE_STRING_GENERAL
		once
			-- Not used for default connector selection.
		end

end


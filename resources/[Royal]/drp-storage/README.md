RegisterNetEvent("duty", function()
    TriggerEvent("drp-storage:createMenu", {
        {
            header = "Sign In / Off",
        },
        {
            header = "Signing On Duty",
            context = "Use this to sign in",
            event = "attempt:duty:police",
            args = {1,2}
        },
		{
            header = "Signing Off Duty",
            context = "Use this to sign off",
            event = "police:noLongerCop",
            args = {1,2}
        }
    })
end)
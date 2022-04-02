Config["Documents"]["Jobs"] = {}

Config["Documents"]["Jobs"]["police"] = {
    {
        headerTitle = "Parking Permission",
        headerSubtitle = "Grants special permission when parking your vehicle.",
        elements = {
            { label = "First Name", type = "input", value = "", can_be_emtpy = false },
            { label = "Last Name", type = "input", value = "", can_be_emtpy = false },
            { label = "Expires", type = "input", value = "", can_be_empty = false },
            { label = "Information", type = "textarea", value = "The holder of this document is given special parking permission until the end of the expiration date listed.", can_be_emtpy = false },
        },
    },
    {
        headerTitle = "Temporary Weapon License",
        headerSubtitle = "Temporary permission to carry a firearm.",
        elements = {
            { label = "First Name", type = "input", value = "", can_be_emtpy = false },
            { label = "Last Name", type = "input", value = "", can_be_emtpy = false },
            { label = "Expires", type = "input", value = "", can_be_empty = false },
            { label = "Information", type = "textarea", value = "The holder of this document is given permission to carry a weapon until the end of the expiration date listed.", can_be_emtpy = false },
        },
    },
    {
        headerTitle = "Clean Record Verification",
        headerSubtitle = "Verifies you have a clean record.",
        elements = {
            { label = "First Name", type = "input", value = "", can_be_emtpy = false },
            { label = "Last Name", type = "input", value = "", can_be_emtpy = false },
            { label = "Expires", type = "input", value = "", can_be_empty = false },
            { label = "Record", type = "textarea", value = "This document acts as verification that the holder has a clean record with no criminal convictions", can_be_emtpy = false, can_be_edited = false },
        },
    },
}

Config["Documents"]["Jobs"]["ems"] = {
    {
        headerTitle = "Medical Report - Pathology",
        headerSubtitle = "Official medical report provided by a pathologist.",
        elements = {
            { label = "First Name", type = "input", value = "", can_be_emtpy = false },
            { label = "Last name", type = "input", value = "", can_be_emtpy = false },
            { label = "Expires", type = "input", value = "", can_be_empty = false },
            { label = "Medical Notes", type = "textarea", value = "THE MENTIONED INSURED CITIZEN HAS BEEN TESTED BY A HEALTH OFFICER AND DETERMINED HEALTHY WITH NO LONG TERM CONDITIONS DETECTED. THIS REPORT IS EXPIRES THE MENTIONED EXPIRATION DATE.", can_be_emtpy = false },
        },
    },
    {
        headerTitle = "Medical Report - Psychology",
        headerSubtitle = "Official medical report provided by a psychologist.",
        elements = {
            { label = "First Name", type = "input", value = "", can_be_emtpy = false },
            { label = "Last name", type = "input", value = "", can_be_emtpy = false },
            { label = "Expires", type = "input", value = "", can_be_empty = false },
            { label = "Medical Notes", type = "textarea", value = "THE MENTIONED INSURED CITIZEN HAS BEEN TESTED BY A HEALTH EMPLOYEE AND DETERMINED MENTALLY HEALTHY BY THE LOWEST STANDARDS OF PSYCHOLOGY. THIS REPORT IS EXPIRES THE MENTIONED EXPIRATION DATE.", can_be_emtpy = false },
        },
    },
    {
        headerTitle = "Medical Report - Optometrey",
        headerSubtitle = "Official medical report provided by a optometrist.",
        elements = {
            { label = "First Name", type = "input", value = "", can_be_emtpy = false },
            { label = "Last name", type = "input", value = "", can_be_emtpy = false },
            { label = "Expires", type = "input", value = "", can_be_empty = false },
            { label = "Medical Notes", type = "textarea", value = "THE MENTIONED INSURED CITIZEN WAS TESTED BY A HEALTH EMPLOYEE AND DETERMINED WITH A HEALTHY AND ACCURATE VISION. THIS REPORT IS EXPIRES THE MENTIONED EXPIRATION DATE", can_be_emtpy = false },
        },
    },
    {
        headerTitle = "Authorization For Medical Marijuana Usage",
        headerSubtitle = "Medical Marijuana License",
        elements = {
            { label = "First Name", type = "input", value = "", can_be_emtpy = false },
            { label = "Last name", type = "input", value = "", can_be_emtpy = false },
            { label = "Expires", type = "input", value = "", can_be_empty = false },
            { label = "Medical Notes", type = "textarea", value = "THE MENTIONED INSURED CITIZEN IS GRANTED, AFTER BEING CAREFULLY EXAMINED BY A HEALTH SPECIALIST, PERMISSION TO USE MARIJUANA FOR UNDISCLOSED MEDICAL REASONS. THE LEGAL AND PERMITTED AMOUNT THAT A CITIZEN MAY RETAIN MAY NOT BE MORE THAN 100g.", can_be_emtpy = false, can_be_edited = false },
        },
    },
}

Config["Documents"]["Jobs"]["doj"] = {
    {
        headerTitle = "Legal Services Agreement",
        headerSubtitle = "Contract for the provision of legal services provided by a lawyer.",
        elements = {
            { label = "First Name", type = "input", value = "", can_be_emtpy = false },
            { label = "Last Name", type = "input", value = "", can_be_emtpy = false },
            { label = "Expires", type = "input", value = "", can_be_empty = false },
            { label = "Information", type = "textarea", value = "THIS DOCUMENT IS PROOF OF LEGAL REPRESENTATION AND COVERAGE OF THE MENTIONED CITIZEN. THE LEGAL SERVICES ARE VALID UNTIL THE EXPIRATION DATE MENTIONED.", can_be_emtpy = false },
        },
    },
}
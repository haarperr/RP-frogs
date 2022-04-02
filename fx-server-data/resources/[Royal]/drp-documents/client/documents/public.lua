Config["Documents"]["public"] = {
    {
        headerTitle = "Declaration of Truth",
        headerSubtitle = "Declaration of veracity of the citizen.",
        elements = {
            { label = "CONTENT OF THE DECLARATION", type = "textarea", value = "", can_be_emtpy = false },
        },
    },
    {
        headerTitle = "Witness Testimony",
        headerSubtitle = "Official Witness Testimony",
        elements = {
            { label = "Date Of Occurence", type = "input", value = "", can_be_emtpy = false },
            { label = "TESTIMONIAL CONTENT", type = "textarea", value = "", can_be_emtpy = false },
        },
    },
    {
        headerTitle = "Declaration of Vehicle Transfer",
        headerSubtitle = "Declaration of transfer of vehicle to another citizen.",
        elements = {
            { label = "License Plate", type = "input", value = "", can_be_emtpy = false },
            { label = "Purchaser", type = "input", value = "", can_be_emtpy = false },
            { label = "Agreed Amount", type = "input", value = "", can_be_empty = false },
            { label = "Other Information", type = "textarea", value = "", can_be_emtpy = true },
        },
    },
    {
        headerTitle = "Declaration of Loan",
        headerSubtitle = "Official declaration of debt to another citizen.",
        elements = {
            { label = "Creditors Name", type = "input", value = "", can_be_emtpy = false },
            { label = "Borrowers Name", type = "input", value = "", can_be_emtpy = false },
            { label = "Total Amount", type = "input", value = "", can_be_empty = false },
            { label = "Due Date", type = "input", value = "", can_be_empty = false },
            { label = "Other Information", type = "textarea", value = "", can_be_emtpy = true },
        },
    },
    {
        headerTitle = "Debt Settlement Statement",
        headerSubtitle = "Declaration of debt discharge from another citizen.",
        elements = {
            { label = "Creditors Name", type = "input", value = "", can_be_emtpy = false },
            { label = "Borrowers Name", type = "input", value = "", can_be_emtpy = false },
            { label = "Total Paid", type = "input", value = "", can_be_empty = false },
            { label = "Other Information", type = "textarea", value = "I DECLARE THAT THE MENTIONED CITIZEN MADE A PAYMENT WITH THE MENTIONED DEBT VALUE", can_be_emtpy = false, can_be_edited = false },
        },
    },
}
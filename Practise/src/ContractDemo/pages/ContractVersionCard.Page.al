page 50145 ContractVersionCard
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = ContractVersion;
    Editable = false;
    Caption = 'Contract Version Card';
    
    
    layout
    {
        area(Content)
        {
            group(GroupName)
            {
               field("Contract Version No."; Rec."Contract Version No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the contract version number.';
                }
                field("Contract No."; Rec."Contract No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the contract number.';
                }
                field("Client No."; Rec."Client No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the client number.';
                }
                field("Client Type"; Rec."Client Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the type of client.';
                }
                field("Contract Amount"; Rec."Contract Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the contract amount.';
                }
                field("Contract Start Date"; Rec."Contract Start Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the contract start date.';
                }
                field("Contract End Date"; Rec."Contract End Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the contract end date.';
                }
                field("Contract Status"; Rec."Contract Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the contract status.';
                }
                  
            }
        }
    }
}